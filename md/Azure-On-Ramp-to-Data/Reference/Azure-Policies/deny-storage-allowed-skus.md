# Policy Definition: deny-storage-allowed-skus

## TOC

[[_TOC_]]


This template creates an Azure Policy.

## Security Controls

The following security controls can be met through configuration of this template:
      [NIST Controls](security-controls.md):TBD

## File Details

Config File: [policy.config.json](C:\AzureDevOps\Repos\Quisitive\AzureCoE\azure-deployment-coe\code\infrastructure\scripts\ps\azure\arm\..\..\..\..\arm\policy\policies\storage\deny-storage-allowed-skus/policy.config.json + )

Rules File: [policy.rules.metadata.json](C:\AzureDevOps\Repos\Quisitive\AzureCoE\azure-deployment-coe\code\infrastructure\scripts\ps\azure\arm\..\..\..\..\arm\policy\policies\storage\deny-storage-allowed-skuspolicy.rules.json + )

Metadata File: [policy.metadata.json](C:\AzureDevOps\Repos\Quisitive\AzureCoE\azure-deployment-coe\code\infrastructure\scripts\ps\azure\arm\..\..\..\..\arm\policy\policies/policy.metadata.json + )

Parameters File: [policy.parameters.json](C:\AzureDevOps\Repos\Quisitive\AzureCoE\azure-deployment-coe\code\infrastructure\scripts\ps\azure\arm\..\..\..\..\arm\policy\policies\storage\deny-storage-allowed-skus/policy.parameters.json + )

## Parameters

Parameter name | Type | Description | DefaultValue
-------------- | ---- | ----------- | ------------
               |      |             |
               |      |             |
               |      |             |
               |      |             |
               |      |             |
               |      |             |
               |      |             |
               |      |             |
               |      |             |
               |      |             |

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
