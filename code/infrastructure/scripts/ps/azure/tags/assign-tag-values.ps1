
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
#$psConfigDirectory = 'C:\Users\devAdmin\source\repos\data-analytics-platform\code\infrastructure\scripts\ps\azure\config'
#$adapCMDB = 'C:\Users\devAdmin\source\repos\data-analytics-platform\code\infrastructure\scripts\ps\azure\config\dev-adap-cmdb.xlsm'
#$env = 'dev'

$configurationFile = ('{0}\{1}' -f  $psConfigDirectory, 'adap-configuration.psm1')
$tagFile = ('{0}\{1}' -f  $psConfigDirectory, 'tags.json')

Import-Module -Name $configurationFile -Force 
$config = Get-Configuration

$tags = Import-Excel `
  -Path $adapCMDB `
  -Worksheet 'Tags' `
  -StartRow 20 | ConvertTo-Json -Depth 100

#Create object that will be output to file containing the application name and all of the tags
$tagsFile = @()

#Filter out any null application names from the data
$tagsObject = ($tags | ConvertFrom-Json) | Where-Object {$_.ApplicationName -ne $null}

#Loop through and correct invalid budget values.  Also structure the JSON for the final tags.json output
foreach ($application in $tagsObject) { 
  if ($application.BudgetAmount -NotLike '$*') {
    $application.BudgetAmount = '$' + $application.BudgetAmount
  }
  
  if ($application.BudgetAmount -NotLike '*-Month') {
    $application.BudgetAmount = $application.BudgetAmount + '-Month'
  }
   
  $fileProperties = @{$application.ApplicationName=$application}  
  $fileObject = New-Object PSObject –Property $fileProperties
  $tagsFile += $fileObject
}	

#Create object for only the ADAP application.  This object will be used as the basis for the configuration file.
$adapTagsObject = $tagsObject | Where-Object {$_.ApplicationName -eq "ADAP"}

#Update the Configuration with the correct values for the ADAP platform
$temp = ("     Pre-Deployment - Updating Approver {0} to {1}" -f $config.Approver, $adapTagsObject.Approver)
Write-Output $temp
If ($config.Approver -ne $adapTagsObject.Approver){
  Update-StringInFile -searchStr $config.Approver -replaceStr $adapTagsObject.Approver -rootDirectory $psConfigDirectory -fileExtension 'psm1' -CaseSensitive 
} 
else {
  Write-Output "     Approver is the same - no changes needed."
}

$temp = ("     Pre-Deployment - Updating BudgetAmount {0} to {1}" -f $config.BudgetAmount, $adapTagsObject.BudgetAmount)
Write-Output $temp
If ($config.BudgetAmount -ne $adapTagsObject.BudgetAmount){
  Update-StringInFile -searchStr $config.BudgetAmount -replaceStr $adapTagsObject.BudgetAmount -rootDirectory $psConfigDirectory -fileExtension 'psm1' -CaseSensitive  
} 
else {
  Write-Output "     BudgetAmount is the same - no changes needed."
}

$temp = ("     Pre-Deployment - Updating CostCenter {0} to {1}" -f $config.CostCenter, $adapTagsObject.CostCenter)
Write-Output $temp
If ($config.CostCenter -ne $adapTagsObject.CostCenter){
  Update-StringInFile -searchStr $config.CostCenter -replaceStr $adapTagsObject.CostCenter -rootDirectory $psConfigDirectory -fileExtension 'psm1' -CaseSensitive  
} 
else {
  Write-Output "     CostCenter is the same - no changes needed."
}

$temp = ("     Pre-Deployment - Updating DR {0} to {1}" -f $config.DR, $adapTagsObject.DR)
Write-Output $temp
If ($config.DR -ne $adapTagsObject.DR){
  Update-StringInFile -searchStr $config.DR -replaceStr $adapTagsObject.DR -rootDirectory $psConfigDirectory -fileExtension 'psm1' -CaseSensitive  
} 
else {
  Write-Output "     DR is the same - no changes needed."
}

$temp = ("     Pre-Deployment - Updating EndDate {0} to {1}" -f $config.EndDate, $adapTagsObject.EndDate)
Write-Output $temp
If ($config.EndDate -ne $adapTagsObject.EndDate){
  Update-StringInFile -searchStr $config.EndDate -replaceStr $adapTagsObject.EndDate -rootDirectory $psConfigDirectory -fileExtension 'psm1' -CaseSensitive 
} 
else {
  Write-Output "     EndDate is the same - no changes needed."
}

$temp = ("     Pre-Deployment - Updating Env {0} to {1}" -f $config.Env, $adapTagsObject.Env)
Write-Output $temp
If ($config.Env -ne $adapTagsObject.Env){
  Update-StringInFile -searchStr $config.Env -replaceStr $adapTagsObject.Env -rootDirectory $psConfigDirectory -fileExtension 'psm1' -CaseSensitive 
} 
else {
  Write-Output "     Env is the same - no changes needed."
}

$temp = ("     Pre-Deployment - Updating Owner {0} to {1}" -f $config.Owner, $adapTagsObject.Owner)
Write-Output $temp
If ($config.Owner -ne $adapTagsObject.Owner){
  Update-StringInFile -searchStr $config.Owner -replaceStr $adapTagsObject.Owner -rootDirectory $psConfigDirectory -fileExtension 'psm1' -CaseSensitive 
} 
else {
  Write-Output "     Owner is the same - no changes needed."
}

$temp = ("     Pre-Deployment - Updating Requester {0} to {1}" -f $config.Requester, $adapTagsObject.Requester)
Write-Output $temp
If ($config.Requester -ne $adapTagsObject.Requester){
  Update-StringInFile -searchStr $config.Requester -replaceStr $adapTagsObject.Requester -rootDirectory $psConfigDirectory -fileExtension 'psm1' -CaseSensitive 
} 
else {
  Write-Output "     Requester is the same - no changes needed."
}

$temp = ("     Pre-Deployment - Updating ServiceClass {0} to {1}" -f $config.ServiceClass, $adapTagsObject.ServiceClass)
Write-Output $temp
If ($config.ServiceClass -ne $adapTagsObject.ServiceClass){
  Update-StringInFile -searchStr $config.ServiceClass -replaceStr $adapTagsObject.ServiceClass -rootDirectory $psConfigDirectory -fileExtension 'psm1' -CaseSensitive 
} 
else {
  Write-Output "     ServiceClass is the same - no changes needed."
}

$temp = ("     Pre-Deployment - Updating StartDate {0} to {1}" -f $config.StartDate, $adapTagsObject.StartDate)
Write-Output $temp
If ($config.StartDate -ne $adapTagsObject.StartDate){
  Update-StringInFile -searchStr $config.StartDate -replaceStr $adapTagsObject.StartDate -rootDirectory $psConfigDirectory -fileExtension 'psm1' -CaseSensitive 
} 
else {
  Write-Output "     StartDate is the same - no changes needed."
}

#Write tags by Application to tags.json
ConvertTo-Json @($tagsFile) -Depth 100 | Out-File -FilePath $tagFile