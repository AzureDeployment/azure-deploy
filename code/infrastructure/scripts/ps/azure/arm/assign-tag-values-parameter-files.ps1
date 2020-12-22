
param(
    [Parameter(Mandatory=$true,HelpMessage='Directory with Configuration Information.')]
    [string] $psConfigDirectory,

    [Parameter(Mandatory=$true,HelpMessage='Directory with Configuration Information.')]
    [string] $psAlertDirectory,

    [Parameter(Mandatory=$true,HelpMessage='Excel Spreadsheet with Configuration Information.')]
    [string] $adapCMDB,

    [Parameter(Mandatory = $true)]
    [string] $env

)

$configurationFile = ('{0}\{1}' -f  $psConfigDirectory, 'adap-configuration.psm1')
$tagFile = ('{0}\{1}' -f  $psConfigDirectory, 'tags.json')

Import-Module -Name $configurationFile -Force 
$config = Get-Configuration

$tags = Import-Excel `
  -Path $adapCMDB `
  -Worksheet 'Tags' `
  -StartRow 20 | ConvertTo-Json -Depth 10
  
$tagsObject = ($tags | ConvertFrom-Json) | Where-Object {$_.ApplicationName -ne $null}

foreach ($application in $tagsObject) { 
  if ($application.BudgetAmount -NotLike '$*') {
    $application.BudgetAmount = '$' + $application.BudgetAmount
  }
  
  if ($application.BudgetAmount -NotLike '*-Month') {
    $application.BudgetAmount = $application.BudgetAmount + '-Month'
  }
}	

$adapTagsObject = $tagsObject | Where-Object {$_.ApplicationName -eq "ADAP"}

#Loop through Alerts parameter files and replace the tags with the correct values.
Get-ChildItem -Path $psAlertDirectory -Recurse -Filter *.parameters.json | `
Foreach-Object {
  write-host "    Updating: " $_.FullName
  $alertParameterFile = $_.FullName
  try {
    $parameterFileContent = Get-Content $alertParameterFile | ConvertFrom-Json
    $currentTagsObject = $parameterFileContent.parameters.configuration.value
    $newTagsObject = $adapTagsObject
  
    if(-not (Get-Member -inputObject $newTagsObject -name "Display Name" -MemberType Properties)) {
      $newTagsObject | Add-Member -NotePropertyName 'Display Name' -NotePropertyValue 'afc-Policy Alert'
    }

    if ($newTagsObject.Env -ne 'Global') {
      $newTagsObject.Env = 'Global'
    }
  
    if ($newTagsObject.BusinessUnit -ne 'CORP') {
      $newTagsObject.BusinessUnit = 'CORP'
    }
  
    $parameterFileContent.parameters.configuration.value = $newTagsObject
    Set-Content -Path $alertParameterFile -Value ([Regex]::Unescape(($parameterFileContent | ConvertTo-Json -Depth 10))) -Force
  }
  catch {
    Write-Host -ForegroundColor RED    "Error setting tag values in Alert parameter files"
    $PSCmdlet.ThrowTerminatingError($_)
    Exit
  }
}