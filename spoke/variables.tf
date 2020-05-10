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
  default     = ["Spoke"]
  description = "Tags to be added to resources"
  type        = list(string)
}

//Landing Zone Resource Group Name
variable "Resource_Group_Name" {
  default     = "Spoke_RG"
  description = "Name of Resource Group to be created"
  type        = string
}


variable "Spoke_Storage_BootDiag_Storage_Account_Name" {
  default     = "Landing_Zone_BootDiag_Storage_Account"
  description = "Name for the Boot Diagnostic Storage Account"
  type        = string
}

variable "Spoke_Storage_Storage_Account_Name" {
  default     = "Landing_Zone_Storage_Account"
  description = "Name for the Default SpokeStorage Account"
  type        = string
}

variable "Spoke_Recovery_Services_Vault_Name" {
  default     = "Landing_Zone_Spoke_Recovery_Services_Vault_Name"
  description = "Name for the Recovery Services Vault"
  type        = string
}

variable "Spoke_Log_Analytics_Workspace_Name" {
  default     = "Landing_Zone_Spoke_Log_Analytics_Workspace_Name"
  description = "Name for the Log Analytics Workspace"
  type        = string
}

variable "Spoke_Key_Vault_Name" {
  default     = "Landing_Zone_Spoke_Key_Vault_Name"
  description = "Name for the Key Vault"
  type        = string
}

variable "Spoke_Automation_Account_Name" {
  default     = "Landing_Zone_Spoke_Key_Vault_Name"
  description = "Name for the Key Vault"
  type        = string
}