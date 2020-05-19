//Variables

variable "subscription_id" {
  description = "Azure Subscription Id"
  type        = string
}
variable "tenant_id" {
  description = "Azure Tenant Id"
  type        = string
}

//Landing Zone Location
variable "Landing_Zone_Location" {
  default     = "East US"
  description = "Azure Region"
  type        = string
}

//Landing Zone Tags
variable "Landing_Zone_Tag" {
  default     = ["Hub"]
  description = "Tags to be added to resources"
  type        = list(string)
}

//Landing Zone Resource Group Name
variable "Resource_Group_Name" {
  default     = "Hub_RG"
  description = "Name of Resource Group to be created"
  type        = string
}

//vNet Name
variable "vNet_Name" {
  default     = "Hub_vNet"
  description = "Virtual Network Name"
  type        = string
}

//vNet Name
variable "vNet_IP_Space" {
  default     = ["10.0.0.0/16"]
  description = "IP Space to use for Virtual Network"
  type        = list(string)
}

//vNet Name
variable "vNet_DNS" {
  default     = ["8.8.8.8", "8.8.4.4"]
  description = "DNS Servers to be used by Virtual Network"
  type        = list(string)
}


//Gateway_Subnet
variable "Subnet_1_Name" {
  default     = "Gateway_Subnet"
  description = "Subnet name for the Gateway Subnet"
  type        = string
}
variable "Subnet_1_address_prefix" {
  default     = "10.0.10.0/24"
  description = "Subnet address prefix for the Gateway"
  type        = string
}

//Private_Subnet
variable "Subnet_2_Name" {
  default     = "Private_Subnet"
  description = "Subnet name for the Private Subnet"
  type        = string
}
variable "Subnet_2_address_prefix" {
  default     = "10.0.20.0/24"
  description = "Subnet address prefix for the Private Subnet"
  type        = string
}

//Public_Subnet
variable "Subnet_3_Name" {
  default     = "Public_Subnet"
  description = "Subnet name for the Public Subnet"
  type        = string
}
variable "PublicSubnet" {
  default     = "10.0.30.0/24"
  description = "Subnet address prefix for the Public Subnet"
  type        = string
}

//AzureBastionSubnet
variable "AzureBastionSubnet_address_prefix" {
  default     = "10.0.40.0/24"
  description = "Subnet address prefix for the Azure Bastion Subnet"
  type        = string
}

//ExternalWebLB_Subnet
variable "Subnet_5_Name" {
  default     = "ExternalWebLB_Subnet"
  description = "Subnet name for the External Web and LoadBalancer Subnet"
  type        = string
}
variable "Subnet_5_address_prefix" {
  default     = "10.0.50.0/24"
  description = "Subnet address prefix for the External Web and LoadBalancer Subnet"
  type        = string
}

//Infra_Subnet
variable "Subnet_6_Name" {
  default     = "Infra_Subnet"
  description = "Subnet name for the Infrastructure Subnet"
  type        = string
}
variable "Subnet_6_address_prefix" {
  default     = "10.0.60.0/24"
  description = "Subnet address prefix for the Infrastructure Subnet"
  type        = string
}

//Management_Subnet
variable "Subnet_7_Name" {
  default     = "Management_Subnet"
  description = "Subnet name for the Management Subnet"
  type        = string
}
variable "Subnet_7_address_prefix" {
  default     = "10.0.70.0/24"
  description = "Subnet address prefix for the Management Subnet"
  type        = string
}

variable "Landing_Zone_NSG_Name" {
  default     = "Landing_Zone_NSG"
  description = "Name of the Primary Landing Zone Network Security Group"
  type        = string
}

variable "Hub_Storage_BootDiag_Storage_Account_Name" {
  default     = "Landing_Zone_BootDiag_Storage_Account"
  description = "Name for the Boot Diagnostic Storage Account"
  type        = string
}

variable "Hub_Recovery_Services_Vault_Name" {
  default     = "Landing_Zone_Hub_Recovery_Services_Vault_Name"
  description = "Name for the Recovery Services Vault"
  type        = string
}

variable "Hub_Log_Analytics_Workspace_Name" {
  default     = "Landing_Zone_Hub_Log_Analytics_Workspace__Name"
  description = "Name for the Log Analytics Workspace"
  type        = string
}

//VPN1

variable "Landing_Zone_VPN1_Enabled" {
  default     = true
  description = "Enable/Disable VPN 1"
  type        = bool
}

variable "Landing_Zone_VPN1_Name" {
  default     = "Landing_Zone_VPN1_Datacenter1"
  description = "Name of VPN 1"
  type        = string
}

variable "Landing_Zone_VPN1_Gateway_Address" {
  description = "Gateway Address of on prem VPN Device"
  type        = string
}

variable "Landing_Zone_VPN1_Address_Space" {
  default     = ["10.1.1.0/24"]
  type        = list(string)
  description = "Address Space Used for VPN 1"
}

variable "Landing_Zone_VPN1_Shared_Key" {
  default     = "4-v3ry-53cr37-1p53c-5h4r3d-k3y"
  description = "Shared Key used for IPSec VPN Tunnel for VPN 1"
  type        = string
}

//VPN2

variable "Landing_Zone_VPN2_Enabled" {
  default     = false
  description = "Enable/Disable VPN 2"
  type        = bool
}

variable "Landing_Zone_VPN1_Name" {
  default     = "Landing_Zone_VPN1_Datacenter2"
  description = "Name of VPN 2"
  type        = string
}

variable "Landing_Zone_VPN2_Gateway_Address" {
  description = "Gateway Address of on prem VPN Device"
  type        = string
}

variable "Landing_Zone_VPN2_Address_Space" {
  default     = ["10.2.1.0/24"]
  type        = list(string)
  description = "Address Space Used for VPN 1"
}

variable "Landing_Zone_VPN2_Shared_Key" {
  default     = "4-v3ry-53cr37-1p53c-5h4r3d-k3y"
  description = "Shared Key used for IPSec VPN Tunnel for VPN 2"
  type        = string
}

//Express Route 1

variable "Landing_Zone_ExpressRoute1_Enabled" {
  default     = true
  description = "Enable/Disable Express Route 1"
  type        = bool
}

variable "Landing_Zone_ExpressRoute1_Gateway_Name" {
  default     = "Landing_Zone_Hub_ExpressRoute1_Gateway"
  description = "Name of Express Route 1 Gateway"
  type        = string
}

variable "Landing_Zone_ExpressRoute1_Gateway_Scale_Units" {
  default     = 1
  description = "The number of scale units with which to provision the ExpressRoute gateway. Each scale unit is equal to 2Gbps, with support for up to 10 scale units (20Gbps)."
  type        = number
}

variable "Landing_Zone_ExpressRoute1_VHUB_Name" {
  default     = "Landing_Zone_Hub_ExpressRoute1_Virtual_Hub"
  description = "Name of Express Route 1 Virtual Hub"
  type        = string
}

variable "Landing_Zone_ExpressRoute1_VHUB_Address_Prefix" {
  default     = "10.0.1.0/24"
  description = "Address Prefix for Express Route 1 Virtual Hub"
  type        = string
}

variable "Landing_Zone_ExpressRoute1_VWAN_Name" {
  default     = "Landing_Zone_ExpressRoute1_Virtual_WAN"
  description = "Name of Express Route 1 Virtual WAN"
  type        = string
}

//Express Route 2

variable "Landing_Zone_ExpressRoute2_Enabled" {
  default     = false
  description = "Enable/Disable Express Route 2"
  type        = bool
}

variable "Landing_Zone_ExpressRoute2_Gateway_Name" {
  default     = "Landing_Zone_Hub_ExpressRoute2_Gateway"
  description = "Name of Express Route 2 Gateway"
  type        = string
}

variable "Landing_Zone_ExpressRoute2_Gateway_Scale_Units" {
  default     = 1
  description = "The number of scale units with which to provision the ExpressRoute gateway. Each scale unit is equal to 2Gbps, with support for up to 10 scale units (20Gbps)."
  type        = number
}

variable "Landing_Zone_ExpressRoute2_VHUB_Name" {
  default     = "Landing_Zone_Hub_ExpressRoute2_Virtual_Hub"
  description = "Name of Express Route 2 Virtual Hub"
  type        = string
}

variable "Landing_Zone_ExpressRoute2_VHUB_Address_Prefix" {
  default     = "10.0.2.0/24"
  description = "Address Prefix for Express Route 2 Virtual Hub"
  type        = string
}

variable "Landing_Zone_ExpressRoute2_VWAN_Name" {
  default     = "Landing_Zone_ExpressRoute2_Virtual_WAN"
  description = "Name of Express Route 2 Virtual WAN"
  type        = string
}