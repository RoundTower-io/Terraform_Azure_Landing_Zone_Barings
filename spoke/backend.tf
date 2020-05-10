provider "azurerm" {
  version = "=2.0.0"
  features {}
}

terraform {
    backend "azurerm" {
      storage_account_name  = var.TFSTATE_STORAGE_ACCOUNT_NAME
      container_name        = var.TFSTATE_CONTAINER_NAME
      key                   = "terraform.tfstate"
      resource_group_name   = var.TFSTATE_RESOURCE_GROUP_NAME
    }
}

