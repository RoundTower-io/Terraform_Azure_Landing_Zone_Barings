provider "azurerm" {
  version = "~>2.4.0"
  features {}
}

terraform {
    backend "azurerm" {
    }
}

data "terraform_remote_state" "hub-tfstate" {
  backend = "azurerm"
  config = {
    storage_account_name  = var.hub-backend_storage_account_name
    container_name        = var.hub-backend_container_name 
    key                   = var.hub-backend_key
    resource_group_name   = var.hub-backend_resource_group_name
  }
}
