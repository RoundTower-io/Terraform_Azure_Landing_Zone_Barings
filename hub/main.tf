//Resource Group
resource "azurerm_resource_group" "Landing_Zone_RG" {
  name     = var.Resource_Group_Name
  location = var.Landing_Zone_Location
}

resource "azurerm_log_analytics_workspace" "Hub_Log_Analytics_Workspace" {
  name                = var.Hub_Log_Analytics_Workspace_Name
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_recovery_services_vault" "Hub_Recovery_Services_Vault" {
  name                = var.Hub_Recovery_Services_Vault_Name
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  sku                 = "Standard"

  soft_delete_enabled = true
}

resource "azurerm_storage_account" "Hub_Storage_BootDiag_Storage_Account" {
  name                     = var.Hub_Storage_BootDiag_Storage_Account_Name
  resource_group_name      = azurerm_resource_group.Landing_Zone_RG.name
  location                 = azurerm_resource_group.Landing_Zone_RG.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}