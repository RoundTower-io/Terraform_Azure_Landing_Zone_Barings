#Will need to modify once we see what exists in the subscription already

#Express Route 1
resource "azurerm_virtual_wan" "Landing_Zone_ExpressRoute1_VWAN" {
  count               = var.Landing_Zone_ExpressRoute1_Enabled == true ? 1 : 0
  name                = var.Landing_Zone_ExpressRoute1_VWAN_Name
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
}

resource "azurerm_virtual_hub" "Landing_Zone_ExpressRoute1_VHUB" {
  count               = var.Landing_Zone_ExpressRoute1_Enabled == true ? 1 : 0
  name                = var.Landing_Zone_ExpressRoute1_VHUB_Name
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  virtual_wan_id      = azurerm_virtual_wan.Landing_Zone_ExpressRoute1_VWAN.id
  address_prefix      = var.Landing_Zone_ExpressRoute1_VHUB_Address_Prefix
}

resource "azurerm_express_route_gateway" "Landing_Zone_ExpressRoute1_Gateway" {
  count               = var.Landing_Zone_ExpressRoute1_Enabled == true ? 1 : 0
  name                = var.Landing_Zone_ExpressRoute1_Gateway_Name
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  virtual_hub_id      = azurerm_virtual_hub.example.id
  scale_units         = var.Landing_Zone_ExpressRoute1_Gateway_Scale_Units
}

#Express Route 2
resource "azurerm_virtual_wan" "Landing_Zone_ExpressRoute2_VWAN" {
  count               = var.Landing_Zone_ExpressRoute2_Enabled == true ? 1 : 0
  name                = var.Landing_Zone_ExpressRoute2_VWAN_Name
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
}

resource "azurerm_virtual_hub" "Landing_Zone_ExpressRoute2_VHUB" {
  count               = var.Landing_Zone_ExpressRoute2_Enabled == true ? 1 : 0
  name                = var.Landing_Zone_ExpressRoute2_VHUB_Name
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  virtual_wan_id      = azurerm_virtual_wan.Landing_Zone_ExpressRoute2_VWAN.id
  address_prefix      = var.Landing_Zone_ExpressRoute2_VHUB_Address_Prefix
}

resource "azurerm_express_route_gateway" "Landing_Zone_ExpressRoute2_Gateway" {
  count               = var.Landing_Zone_ExpressRoute2_Enabled == true ? 1 : 0
  name                = var.Landing_Zone_ExpressRoute2_Gateway_Name
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  virtual_hub_id      = azurerm_virtual_hub.example.id
  scale_units         = var.Landing_Zone_ExpressRoute2_Gateway_Scale_Units
}