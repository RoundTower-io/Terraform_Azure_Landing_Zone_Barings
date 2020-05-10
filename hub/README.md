## Requirements

The following requirements are needed by this module:

- azurerm (=2.0.0)

## Providers

The following providers are used by this module:

- azurerm (=2.0.0)

## Required Inputs

The following input variables are required:

### Landing\_Zone\_VPN1\_Gateway\_Address

Description: Gateway Address of on prem VPN Device

Type: `string`

### Landing\_Zone\_VPN2\_Gateway\_Address

Description: Gateway Address of on prem VPN Device

Type: `string`

### subscription\_id

Description: Azure Subscription Id

Type: `string`

### tenant\_id

Description: Azure Tenant Id

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### AzureBastionSubnet\_address\_prefix

Description: Subnet address prefix for the Azure Bastion Subnet

Type: `string`

Default: `"10.0.40.0/24"`

### Hub\_Log\_Analytics\_Workspace\_Name

Description: Name for the Log Analytics Workspace

Type: `string`

Default: `"Landing_Zone_Hub_Log_Analytics_Workspace__Name"`

### Hub\_Recovery\_Services\_Vault\_Name

Description: Name for the Recovery Services Vault

Type: `string`

Default: `"Landing_Zone_Hub_Recovery_Services_Vault_Name"`

### Hub\_Storage\_BootDiag\_Storage\_Account\_Name

Description: Name for the Boot Diagnostic Storage Account

Type: `string`

Default: `"Landing_Zone_BootDiag_Storage_Account"`

### Landing\_Zone\_ExpressRoute1\_Enabled

Description: Enable/Disable Express Route 1

Type: `bool`

Default: `true`

### Landing\_Zone\_ExpressRoute1\_Gateway\_Name

Description: Name of Express Route 1 Gateway

Type: `string`

Default: `"Landing_Zone_Hub_ExpressRoute1_Gateway"`

### Landing\_Zone\_ExpressRoute1\_Gateway\_Scale\_Units

Description: The number of scale units with which to provision the ExpressRoute gateway. Each scale unit is equal to 2Gbps, with support for up to 10 scale units (20Gbps).

Type: `number`

Default: `1`

### Landing\_Zone\_ExpressRoute1\_VHUB\_Address\_Prefix

Description: Address Prefix for Express Route 1 Virtual Hub

Type: `string`

Default: `"10.0.1.0/24"`

### Landing\_Zone\_ExpressRoute1\_VHUB\_Name

Description: Name of Express Route 1 Virtual Hub

Type: `string`

Default: `"Landing_Zone_Hub_ExpressRoute1_Virtual_Hub"`

### Landing\_Zone\_ExpressRoute1\_VWAN\_Name

Description: Name of Express Route 1 Virtual WAN

Type: `string`

Default: `"Landing_Zone_ExpressRoute1_Virtual_WAN"`

### Landing\_Zone\_ExpressRoute2\_Enabled

Description: Enable/Disable Express Route 2

Type: `bool`

Default: `false`

### Landing\_Zone\_ExpressRoute2\_Gateway\_Name

Description: Name of Express Route 2 Gateway

Type: `string`

Default: `"Landing_Zone_Hub_ExpressRoute2_Gateway"`

### Landing\_Zone\_ExpressRoute2\_Gateway\_Scale\_Units

Description: The number of scale units with which to provision the ExpressRoute gateway. Each scale unit is equal to 2Gbps, with support for up to 10 scale units (20Gbps).

Type: `number`

Default: `1`

### Landing\_Zone\_ExpressRoute2\_VHUB\_Address\_Prefix

Description: Address Prefix for Express Route 2 Virtual Hub

Type: `string`

Default: `"10.0.2.0/24"`

### Landing\_Zone\_ExpressRoute2\_VHUB\_Name

Description: Name of Express Route 2 Virtual Hub

Type: `string`

Default: `"Landing_Zone_Hub_ExpressRoute2_Virtual_Hub"`

### Landing\_Zone\_ExpressRoute2\_VWAN\_Name

Description: Name of Express Route 2 Virtual WAN

Type: `string`

Default: `"Landing_Zone_ExpressRoute2_Virtual_WAN"`

### Landing\_Zone\_Location

Description: Azure Region

Type: `string`

Default: `"East US"`

### Landing\_Zone\_NSG\_Name

Description: Name of the Primary Landing Zone Network Security Group

Type: `string`

Default: `"Landing_Zone_NSG"`

### Landing\_Zone\_Tag

Description: Tags to be added to resources

Type: `list(string)`

Default:

```json
[
  "Hub"
]
```

### Landing\_Zone\_VPN1\_Address\_Space

Description: Address Space Used for VPN 1

Type: `list(string)`

Default:

```json
[
  "10.1.1.0/24"
]
```

### Landing\_Zone\_VPN1\_Enabled

Description: Enable/Disable VPN 1

Type: `bool`

Default: `true`

### Landing\_Zone\_VPN1\_Name

Description: Name of VPN 2

Type: `string`

Default: `"Landing_Zone_VPN1_Datacenter2"`

### Landing\_Zone\_VPN1\_Shared\_Key

Description: Shared Key used for IPSec VPN Tunnel for VPN 1

Type: `string`

Default: `"4-v3ry-53cr37-1p53c-5h4r3d-k3y"`

### Landing\_Zone\_VPN2\_Address\_Space

Description: Address Space Used for VPN 1

Type: `list(string)`

Default:

```json
[
  "10.2.1.0/24"
]
```

### Landing\_Zone\_VPN2\_Enabled

Description: Enable/Disable VPN 2

Type: `bool`

Default: `true`

### Landing\_Zone\_VPN2\_Shared\_Key

Description: Shared Key used for IPSec VPN Tunnel for VPN 2

Type: `string`

Default: `"4-v3ry-53cr37-1p53c-5h4r3d-k3y"`

### PublicSubnet

Description: Subnet address prefix for the Public Subnet

Type: `string`

Default: `"10.0.30.0/24"`

### Resource\_Group\_Name

Description: Name of Resource Group to be created

Type: `string`

Default: `"Hub_RG"`

### Subnet\_1\_Name

Description: Subnet name for the Gateway Subnet

Type: `string`

Default: `"Gateway_Subnet"`

### Subnet\_1\_address\_prefix

Description: Subnet address prefix for the Gateway

Type: `string`

Default: `"10.0.10.0/24"`

### Subnet\_2\_Name

Description: Subnet name for the Private Subnet

Type: `string`

Default: `"Private_Subnet"`

### Subnet\_2\_address\_prefix

Description: Subnet address prefix for the Private Subnet

Type: `string`

Default: `"10.0.20.0/24"`

### Subnet\_3\_Name

Description: Subnet name for the Public Subnet

Type: `string`

Default: `"Public_Subnet"`

### Subnet\_5\_Name

Description: Subnet name for the External Web and LoadBalancer Subnet

Type: `string`

Default: `"ExternalWebLB_Subnet"`

### Subnet\_5\_address\_prefix

Description: Subnet address prefix for the External Web and LoadBalancer Subnet

Type: `string`

Default: `"10.0.50.0/24"`

### Subnet\_6\_Name

Description: Subnet name for the Infrastructure Subnet

Type: `string`

Default: `"Infra_Subnet"`

### Subnet\_6\_address\_prefix

Description: Subnet address prefix for the Infrastructure Subnet

Type: `string`

Default: `"10.0.60.0/24"`

### Subnet\_7\_Name

Description: Subnet name for the Management Subnet

Type: `string`

Default: `"Management_Subnet"`

### Subnet\_7\_address\_prefix

Description: Subnet address prefix for the Management Subnet

Type: `string`

Default: `"10.0.70.0/24"`

### vNet\_DNS

Description: DNS Servers to be used by Virtual Network

Type: `list(string)`

Default:

```json
[
  "8.8.8.8",
  "8.8.4.4"
]
```

### vNet\_IP\_Space

Description: IP Space to use for Virtual Network

Type: `list(string)`

Default:

```json
[
  "10.0.0.0/16"
]
```

### vNet\_Name

Description: Virtual Network Name

Type: `string`

Default: `"Hub_vNet"`

## Outputs

No output.

