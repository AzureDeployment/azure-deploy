# common variables
$ResourceGroupName = "rg-test"
$template = "synapse-analytics"

$TemplateParameterFile = "$PSScriptRoot\..\..\..\..\arm\templates\parameters\$template.test.parameter.json"
$TemplateMetadataFile = "$PSScriptRoot\..\..\..\..\arm\templates\$template.metadata.json"

Describe 'Metadata Test' {
    It 'Metadata file should exist' {
        $TemplateMetadataFile | Should -Exist
    }
}

Describe 'Test Parameter File Test' {
    It 'Parameter file should exist' {
        $TemplateParameterFile | Should -Exist
    }
}

Describe 'ARM Template File Test' {
    It 'ARM Template file should exist' {
        $TemplateFile | Should -Exist
    }
}

#if (Test-Path $TemplateFile){
#    Describe "Synapse Analytics Workspace Tests" -Tag "functional" {
#        Context "When a Synapse Analytics Workspace is deployed" {
#        
#            $TemplateParameters = @{
#              synapseAnalyticsWorkspace = "synyazyadaptst01"
#              DataLakeFileSystem        = "synyazyadaptst01"
#              DataLakeStoreName         = "adlsyazyadaptst"
#              allowAllConnections       = "false"
#            }
#
#            $TestTemplateParams = @{
#              ResourceGroupName       = $ResourceGroupName
#              TemplateFile            = $TemplateFile
#              TemplateParameterObject = $TemplateParameters
#            }
#
#            $DebugPreference = 'SilentlyContinue'
#            $output = Test-AzResourceGroupDeployment -ResourceGroupName "$ResourceGroupName" -TemplateFile "$TemplateFile" -TemplateParameterFile "$TemplateParameterFile" 5>&1
#            write-host $output
#            if ($output) {
#                write-host $output.details.details.message
#            }
#
#            $DebugPreference = 'SilentlyContinue'
#
#            It "Should be deployed successfully" {
#              $output | Should -BeNullOrEmpty
#            }
#        }
#    }
#}