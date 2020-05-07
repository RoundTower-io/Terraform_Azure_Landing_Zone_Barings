//deploy a VM-Series Next-Generation Firewall from Palo Alto Networks appliance via Terraform 

/*
commands to Run Script....

1) az login 
2) az account set --subscription "b292aa20-51fb-41f8-a465-b0c790e1c14c"
3) az vm image accept-terms --plan "bundle2" --offer "vmseries1" --publish "paloaltonetworks" // VM with plan info accept azure terms
4) terraform init
5) terraform plan
6) terraform apply


Script explaination.

1) data function defines the existing resoures under azure environment and you are reusing it for creating new resources
2) resource function use for creating new resources 
3) three main variables of function are name, resourcegroup and location
4) you can change Name of any resource you want 


Palo Alto Offician Reference for terraform .
https://github.com/PaloAltoNetworks/terraform-templates/tree/master/azure_two_tier_sample 


*/
provider "azurerm" {
  version = "=2.0.0"
  features {}
}

data "azurerm_resource_group" "PAN_FW_RG" {
  name = "rg-hub-eastus"
}


data "azurerm_virtual_network" "PAN_FW_VNET" {
  name                = "vent-hub-eastus"
  resource_group_name = "rg-hub-eastus"
}
#refer to a subnet
data "azurerm_subnet" "PAN_FW_Subnet0" {
  name                 = "snet-management"
  virtual_network_name = "vent-hub-eastus"
  resource_group_name  = "rg-hub-eastus"
}
data "azurerm_subnet" "PAN_FW_Subnet1" {
  name                 = "snet-private"
  virtual_network_name = "vent-hub-eastus"
  resource_group_name  = "rg-hub-eastus"
}
data "azurerm_subnet" "PAN_FW_Subnet2" {
  name                 = "snet-public"
  virtual_network_name = "vent-hub-eastus"
  resource_group_name  = "rg-hub-eastus"
}


resource "azurerm_public_ip" "PublicIP_0" {
  name = "test-pip"
  resource_group_name = "${data.azurerm_resource_group.PAN_FW_RG.name}"
  allocation_method = "Dynamic"
  domain_name_label = "paloaltopip"
  location            = "${data.azurerm_resource_group.PAN_FW_RG.location}"
}


resource "azurerm_public_ip" "PublicIP_1" {
  name = "test-pip1"
  resource_group_name = "${data.azurerm_resource_group.PAN_FW_RG.name}"
  allocation_method = "Dynamic"
  domain_name_label = "paloaltopip1"
  location            = "${data.azurerm_resource_group.PAN_FW_RG.location}"
}

resource "azurerm_public_ip" "PublicIP_2" {
  name = "test-pip2"
  resource_group_name = "${data.azurerm_resource_group.PAN_FW_RG.name}"
  allocation_method = "Dynamic"
  domain_name_label = "paloaltopip2"
  location            = "${data.azurerm_resource_group.PAN_FW_RG.location}"
}

  //address_prefix = "${join("", list(var.IPAddressPrefix, ".2.0/24"))}"
resource "azurerm_network_interface" "VNIC0" {
  name                = "vnic0-nic"
 location            = "${data.azurerm_resource_group.PAN_FW_RG.location}"
  resource_group_name = "${data.azurerm_resource_group.PAN_FW_RG.name}"
  

  ip_configuration {
    name                          = "${join("", list("ipconfig", "0"))}"
    subnet_id                     = "${data.azurerm_subnet.PAN_FW_Subnet0.id}"
    //private_ip_address_allocation = "static"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = "${azurerm_public_ip.PublicIP_0.id}"
  }

  
}

resource "azurerm_network_interface" "VNIC1" {
  name                = "vnic0-nic1"
   location            = "${data.azurerm_resource_group.PAN_FW_RG.location}"
  resource_group_name = "${data.azurerm_resource_group.PAN_FW_RG.name}"
  //depends_on          = ["azurerm_virtual_network.PAN_FW_VNET"]

  enable_ip_forwarding = true
  ip_configuration {
    name                          = "${join("", list("ipconfig", "1"))}"
    subnet_id                     = "${data.azurerm_subnet.PAN_FW_Subnet1.id}"
   // private_ip_address_allocation = "static"
 private_ip_address_allocation = "Dynamic"
    public_ip_address_id = "${azurerm_public_ip.PublicIP_1.id}"
  }


}

resource "azurerm_network_interface" "VNIC2" {
  name                = "vnic0-nic2"
   location            = "${data.azurerm_resource_group.PAN_FW_RG.location}"
  resource_group_name = "${data.azurerm_resource_group.PAN_FW_RG.name}"
  //depends_on          = ["azurerm_virtual_network.PAN_FW_VNET"]

  enable_ip_forwarding = true
  ip_configuration {
    name                          = "${join("", list("ipconfig", "2"))}"
    subnet_id                     = "${data.azurerm_subnet.PAN_FW_Subnet2.id}"
    private_ip_address_allocation = "Dynamic"
public_ip_address_id = "${azurerm_public_ip.PublicIP_2.id}"
  }


}


resource "azurerm_virtual_machine" "testdeploy" {
 name                  = "D1WIN03P"
 location            = "${data.azurerm_resource_group.PAN_FW_RG.location}"
 resource_group_name = "${data.azurerm_resource_group.PAN_FW_RG.name}"
 //network_interface_ids = ["${azurerm_network_interface.testdeploy.id}"]
 vm_size               = "Standard_D3_v2"

 # Uncomment this line to delete the OS disk automatically when deleting the VM
 # delete_os_disk_on_termination = true

 # Uncomment this line to delete the data disks automatically when deleting the VM
 # delete_data_disks_on_termination = true
depends_on = ["azurerm_network_interface.VNIC0",
                "azurerm_network_interface.VNIC1",
                "azurerm_network_interface.VNIC2"
                ]
  plan {
    name = "bundle2"
    product = "vmseries1"
    publisher = "paloaltonetworks"
  }
 storage_image_reference {
   offer = "vmseries1"
    publisher = "paloaltonetworks"
  sku= "bundle2"
  version= "latest"
 }

 storage_os_disk {
   name              = "D1WIN03P-os"
   caching           = "ReadWrite"
   create_option     = "FromImage"
   managed_disk_type = "StandardSSD_LRS"
   disk_size_gb      = "200"
 }

 os_profile {
   computer_name  = "D1WIN03P"
   admin_username = "testadmin"
   admin_password = "Password1234!"
 }
 primary_network_interface_id = "${azurerm_network_interface.VNIC0.id}"
  network_interface_ids = ["${azurerm_network_interface.VNIC0.id}",
                           "${azurerm_network_interface.VNIC1.id}",
                           "${azurerm_network_interface.VNIC2.id}",
                         ]

  os_profile_linux_config {
    disable_password_authentication = false
  }
 #tags = {
 #  environment = "QA"
 #}
}

#resource "azurerm_managed_disk" "testdeploy" {
#  name                 = "D1WXAMst01P-data"
# location            = "${data.azurerm_resource_group.testdeploy.location}"
# resource_group_name = "${data.azurerm_resource_group.testdeploy.name}"
#  storage_account_type = "Standard_LRS"
#  create_option        = "Empty"
#  disk_size_gb         = 100
#}

#resource "azurerm_virtual_machine_data_disk_attachment" "testdeploy" {
#  managed_disk_id    = "${azurerm_managed_disk.testdeploy.id}"
 # virtual_machine_id = "${azurerm_virtual_machine.testdeploy.id}"
 # lun                = "0"
 # caching            = "ReadWrite"
#}

