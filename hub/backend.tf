provider "azurerm" {
  version = "=2.0.0"
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

terraform {
  backend "azurerm" {
    storage_account_name = var.TFSTATE_STORAGE_ACCOUNT_NAME
    container_name       = var.TFSTATE_CONTAINER_NAME
    key                  = "terraform.tfstate"
    resource_group_name  = var.TFSTATE_RESOURCE_GROUP_NAME
  }
}

