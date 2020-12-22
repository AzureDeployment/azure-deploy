# Action Group Definition: ag-crit-inf

## TOC

[[_TOC_]]


This template creates an Action Group that is leveraged by Azure Alerts.

## Security Controls

The following security controls can be met through configuration of this template:
      [NIST Controls](security-controls.md):TBD

## File Details

Resource File: [azuredeploy.json](C:\AzureDevOps\Repos\Quisitive\AzureCoE\azure-deployment-coe\code\infrastructure\scripts\ps\azure\arm\..\..\..\..\arm\alert\actiongroup\inf\ag-crit-inf/azuredeploy.json + )

Metadata File: [azuredeploy.metadata.json](C:\AzureDevOps\Repos\Quisitive\AzureCoE\azure-deployment-coe\code\infrastructure\scripts\ps\azure\arm\..\..\..\..\arm\alert\actiongroup\inf\ag-crit-inf/azuredeploy.metadata.json + )

Parameters File: [azuredeploy.parameter.json](C:\AzureDevOps\Repos\Quisitive\AzureCoE\azure-deployment-coe\code\infrastructure\scripts\ps\azure\arm\..\..\..\..\arm\alert\actiongroup\inf\ag-crit-inf/azuredeploy.parameters.json + )

## Parameters

Parameter name | Type | Description | DefaultValue
-------------- | ---- | ----------- | ------------
actionGroupName | string | Name for the Action group. | -
actionGroupShortName | string | Short name for the Action group. | -
smsPhoneNumber | string | SMS Phone number. | -
voicePhoneNumber | string | Voice Phone number. | -
emailAddress   | string | Email address. | -
azAppPushId    | string | Email address logon for Azure App Push. | -

## Resources

Resource name | Type | ApiVersion
------------- | ---- | ----------
              |      |
              |      |
              |      |
              |      |
[parameters('actionGroupName')] | microsoft.insights/actionGroups | 2018-03-01
              |      |
              |      |
              |      |

## Use the template

### PowerShell

```powershell
New-AzResourceGroupDeployment -Name <deployment-name> -ResourceGroupName <resource-group-name> -TemplateFile <path-to-template>
```

### Azure CLI

```text
az group deployment create --name <deployment-name> --resource-group <resource-group-name> --template-file <path-to-template>
```

## Documentation

Coming Soon...
