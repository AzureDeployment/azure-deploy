# Alert Definition: afc-azure-servicehealth

## TOC

[[_TOC_]]


This template creates an Azure Alerts.

## Security Controls

The following security controls can be met through configuration of this template:
      [NIST Controls](security-controls.md):TBD

## File Details

Resource File: [azuredeploy.json](C:\AzureDevOps\Repos\Quisitive\AzureCoE\azure-deployment-coe\code\infrastructure\scripts\ps\azure\arm\..\..\..\..\arm\alert\alerts\azure\afc-azure-servicehealth/azuredeploy.json + )

Metadata File: [azuredeploy.metadata.json](C:\AzureDevOps\Repos\Quisitive\AzureCoE\azure-deployment-coe\code\infrastructure\scripts\ps\azure\arm\..\..\..\..\arm\alert\alerts/azuredeploy.metadata.json + )

Parameters File: [azuredeploy.parameter.json](C:\AzureDevOps\Repos\Quisitive\AzureCoE\azure-deployment-coe\code\infrastructure\scripts\ps\azure\arm\..\..\..\..\arm\alert\alerts\azure\afc-azure-servicehealth/azuredeploy.parameters.json + )

## Parameters

Parameter name | Type | Description | DefaultValue
-------------- | ---- | ----------- | ------------
configuration  | object | Configuration for this resource | -
alertName      | string | -           | -
alertDescription | string | -           | -
primaryActionGroup | string | -           | -

## Resources

Resource name | Type | ApiVersion
------------- | ---- | ----------
              |      |
              |      |
              |      |
              |      |
[concat(parameters('alertName'),'-alert')] | Microsoft.Insights/activityLogAlerts | [variables( 'apiVersions' ).activityLogAlerts]
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
