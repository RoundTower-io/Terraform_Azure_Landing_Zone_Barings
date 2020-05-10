## Requirements

The following requirements are needed by this module:

- azurerm (=2.0.0)

## Providers

The following providers are used by this module:

- azurerm (=2.0.0)

## Required Inputs

The following input variables are required:

### subscription\_id

Description: Azure Subscription Id

Type: `string`

### tenant\_id

Description: Azure Tenant Id

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### Landing\_Zone\_Location

Description: Azure Region

Type: `string`

Default: `"East US"`

### Landing\_Zone\_Tag

Description: Tags to be added to resources

Type: `list(string)`

Default:

```json
[
  "Spoke"
]
```

### Resource\_Group\_Name

Description: Name of Resource Group to be created

Type: `string`

Default: `"Spoke_RG"`

### Spoke\_Automation\_Account\_Name

Description: Name for the Key Vault

Type: `string`

Default: `"Landing_Zone_Spoke_Key_Vault_Name"`

### Spoke\_Key\_Vault\_Name

Description: Name for the Key Vault

Type: `string`

Default: `"Landing_Zone_Spoke_Key_Vault_Name"`

### Spoke\_Log\_Analytics\_Workspace\_Name

Description: Name for the Log Analytics Workspace

Type: `string`

Default: `"Landing_Zone_Spoke_Log_Analytics_Workspace_Name"`

### Spoke\_Recovery\_Services\_Vault\_Name

Description: Name for the Recovery Services Vault

Type: `string`

Default: `"Landing_Zone_Spoke_Recovery_Services_Vault_Name"`

### Spoke\_Storage\_BootDiag\_Storage\_Account\_Name

Description: Name for the Boot Diagnostic Storage Account

Type: `string`

Default: `"Landing_Zone_BootDiag_Storage_Account"`

### Spoke\_Storage\_Storage\_Account\_Name

Description: Name for the Default SpokeStorage Account

Type: `string`

Default: `"Landing_Zone_Storage_Account"`

## Outputs

No output.

