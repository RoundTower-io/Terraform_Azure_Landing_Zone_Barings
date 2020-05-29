module "Landing_Zone_vNet" {
  source              = "Azure/network/azurerm"
  version             = "2.0.0"
  location            = var.Landing_Zone_Location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
  address_space       = var.vNet_IP_Space
  dns_servers         = var.vNet_DNS
  subnet_names        = [var.Subnet_1_Name, var.Subnet_2_Name, var.Subnet_3_Name, "AzureBastionSubnet", var.Subnet_5_Name, var.Subnet_6_Name, var.Subnet_7_Name]
  subnet_prefixes     = [var.Subnet_1_address_prefix, var.Subnet_2_address_prefix, var.Subnet_3_address_prefix, var.AzureBastionSubnet_address_prefix, var.Subnet_5_address_prefix, var.Subnet_6_address_prefix, var.Subnet_7_address_prefix]
}

//Landing Zone NSG
resource "azurerm_network_security_group" "Azure_Landing_Zone_NSG" {
  name                = var.Landing_Zone_NSG_Name
  location            = azurerm_resource_group.Landing_Zone_RG.location
  resource_group_name = azurerm_resource_group.Landing_Zone_RG.name
}


resource "azurerm_network_security_rule" "Security_Rule_1" {
  name                        = "Azure Landing Zone Rule 1"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.Landing_Zone_RG.name
  network_security_group_name = azurerm_network_security_group.Azure_Landing_Zone_NSG.name
}
