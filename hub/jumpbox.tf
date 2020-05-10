module "windows_jump_server_prod" {
  source              = "Modules/azurerm-compute"
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  is_windows_image    = true
  vm_hostname         = "WindowsJumpServer-Prod"
  admin_password      = "ComplxP@ssw0rd!"
  vm_os_simple        = "WindowsServer"
  vnet_subnet_id      = module.network.vnet_subnets[3]
  nb_public_ip        = "0"
}

module "windows_jump_server_dev" {
  source              = "Modules/azurerm-compute"
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  is_windows_image    = true
  vm_hostname         = "WindowsJumpServer-Dev"
  admin_password      = "ComplxP@ssw0rd!"
  vm_os_simple        = "WindowsServer"
  vnet_subnet_id      = module.network.vnet_subnets[3]
  nb_public_ip        = "0"
}

//Bastion Service Setup
resource "azurerm_public_ip" "bastion_public_ip" {
  name                = "bastion_public_ip"
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "Azure_Landing_Zone_bastion_host" {
  name                = "BastionService"
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = module.network.vnet_subnets[3]
    public_ip_address_id = azurerm_public_ip.bastion_public_ip.id
  }
}