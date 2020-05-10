//Resource Group
resource "azurerm_resource_group" "Landing_Zone_Spoke_RG" {
  name     = var.Resource_Group_Name
  location = var.Landing_Zone_Location

  tags = {
    environment = var.Landing_Zone_Tag
  }
}

resource "azurerm_log_analytics_workspace" "Spoke_Log_Analytics_Workspace" {
  name                = var.Spoke_Log_Analytics_Workspace_Name
  location            = azurerm_resource_group.Landing_Zone_Spoke_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_Spoke_RG.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_recovery_services_vault" "Spoke_Recovery_Services_Vault" {
  name                = var.Spoke_Recovery_Services_Vault_Name
  location            = azurerm_resource_group.Landing_Zone_Spoke_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_Spoke_RG.name
  sku                 = "Standard"

  soft_delete_enabled = true
}

resource "azurerm_storage_account" "Spoke_Storage_BootDiag_Storage_Account" {
  name                     = var.Spoke_Storage_BootDiag_Storage_Account_Name
  resource_group_name      = azurerm_resource_group.Landing_Zone_Spoke_RG.name
  location                 = azurerm_resource_group.Landing_Zone_Spoke_RG.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.Landing_Zone_Tag
  }
}

resource "azurerm_storage_account" "Spoke_Storage_Storage_Account" {
  name                     = var.Spoke_Storage_Storage_Account_Name
  resource_group_name      = azurerm_resource_group.Landing_Zone_Spoke_RG.name
  location                 = azurerm_resource_group.Landing_Zone_Spoke_RG.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.Landing_Zone_Tag
  }
}

resource "azurerm_key_vault" "Spoke_Key_Vault" {
  name                        = var.Spoke_Key_Vault_Name
  resource_group_name         = azurerm_resource_group.Landing_Zone_Spoke_RG.name
  location                    = azurerm_resource_group.Landing_Zone_Spoke_RG.location
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
}

resource "azurerm_automation_account" "Spoke_Automation_Account" {
  name                = var.Spoke_Automation_Account_Name
  resource_group_name = azurerm_resource_group.Landing_Zone_Spoke_RG.name
  location            = azurerm_resource_group.Landing_Zone_Spoke_RG.location
}
