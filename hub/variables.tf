//Variables

//Landing Zone Location
variable "Landing_Zone_Location" {
  default = "East US"
}

//Landing Zone Tags
variable "Landing_Zone_Tag" {
  default = "Prod"
}

//Landing Zone Resource Group Name
variable "Resource_Group_Name" {
  default = "Default_Azure_RG"
}

//vNet Name
variable "vNet_Name" {
  default = "Default_Azure_vNet"
}

//vNet Name
variable "vNet_IP_Space" {
  default = ["10.0.0.0/16"]
}

//vNet Name
variable "vNet_DNS" {
  default = ["8.8.8.8", "8.8.4.4"]
}

//AzureBastionSubnet
variable "AzureBastionSubnet_address_prefix" {
  default = "10.0.0.0/24"
}

//SubNet 1 Name
variable "Subnet_1_Name" {
  default = "Default_Azure_SubNet_1"
}
variable "Subnet_1_address_prefix" {
  default = "10.0.20.0/24"
}

//SubNet 2 Name
variable "Subnet_2_Name" {
  default = "Default_Azure_SubNet_2"
}
variable "Subnet_2_address_prefix" {
  default = "10.0.30.0/24"
}

//SubNet 3 Name
variable "Subnet_3_Name" {
  default = "Default_Azure_SubNet_3"
}
variable "Subnet_3_address_prefix" {
  default = "10.0.40.0/24"
}

variable "Landing_Zone_NSG_Name" {
  default = "Landing_Zone_NSG"
}

variable "Landing_Zone_Storage_Account_Name" {
  default = "Landing_Zone_Storage_Account"
}