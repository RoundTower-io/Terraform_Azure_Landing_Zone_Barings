#VPN1
resource "azurerm_local_network_gateway" "Landing_Zone_VPN1_LNG" {
  count               = var.Landing_Zone_VPN1_Enabled == true ? 1 : 0
  name                = "${var.Landing_Zone_VPN1_Name}-LNG"
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  gateway_address     = var.Landing_Zone_VPN1_Gateway_Address
  address_space       = var.Landing_Zone_VPN1_Address_Space
}

resource "azurerm_public_ip" "Landing_Zone_VPN1_Public_IP" {
  count               = var.Landing_Zone_VPN1_Enabled == true ? 1 : 0
  name                = "${var.Landing_Zone_VPN1_Name}-IP"
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "Landing_Zone_VPN1_VNG" {
  count               = var.Landing_Zone_VPN1_Enabled == true ? 1 : 0
  name                = "${var.Landing_Zone_VPN1_Name}-VNG"
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    public_ip_address_id          = azurerm_public_ip.Landing_Zone_VPN1_Public_IP[0].id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = module.Landing_Zone_vNet.vnet_subnets[0]
  }
}

resource "azurerm_virtual_network_gateway_connection" "Landing_Zone_VPN1" {
  count               = var.Landing_Zone_VPN1_Enabled == true ? 1 : 0
  name                = var.Landing_Zone_VPN1_Name
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.Landing_Zone_VPN1_VNG[0].id
  local_network_gateway_id   = azurerm_local_network_gateway.Landing_Zone_VPN1_LNG[0].id

  shared_key = var.Landing_Zone_VPN1_Shared_Key
}

#VPN2
resource "azurerm_local_network_gateway" "Landing_Zone_VPN2_LNG" {
  count               = var.Landing_Zone_VPN2_Enabled == true ? 1 : 0
  name                = "${var.Landing_Zone_VPN2_Name}-LNG"
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  gateway_address     = var.Landing_Zone_VPN2_Gateway_Address
  address_space       = var.Landing_Zone_VPN2_Address_Space
}

resource "azurerm_public_ip" "Landing_Zone_VPN2_Public_IP" {
  count               = var.Landing_Zone_VPN2_Enabled == true ? 1 : 0
  name                = "${var.Landing_Zone_VPN2_Name}-IP"
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "Landing_Zone_VPN2_VNG" {
  count               = var.Landing_Zone_VPN2_Enabled == true ? 1 : 0
  name                = "${var.Landing_Zone_VPN2_Name}-VNG"
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    public_ip_address_id          = azurerm_public_ip.Landing_Zone_VPN2_Public_IP[0].id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = module.Landing_Zone_vNet.vnet_subnets[0]
  }
}

resource "azurerm_virtual_network_gateway_connection" "Landing_Zone_VPN2" {
  count               = var.Landing_Zone_VPN2_Enabled == true ? 1 : 0
  name                = var.Landing_Zone_VPN2_Name
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.Landing_Zone_VPN2_VNG[0].id
  local_network_gateway_id   = azurerm_local_network_gateway.Landing_Zone_VPN2_LNG[0].id

  shared_key = var.Landing_Zone_VPN2_Shared_Key
}
