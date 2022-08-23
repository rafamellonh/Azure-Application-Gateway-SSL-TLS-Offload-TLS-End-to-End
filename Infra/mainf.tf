resource "azurerm_resource_group" "RGAPP" {
  name = "RGAPP"
  location = var.location
  tags = var.tags
}

resource "azurerm_virtual_network" "VNET01" {
  name = "VNET01"
  resource_group_name = azurerm_resource_group.RGAPP.name
  location = var.location
  tags = var.tags
  address_space = [ "10.10.0.0/16" ]
  
  subnet = {
    name = "SUB-APPGW"
    address_prefix = "10.10.2.0/24"
  }

  subnet = {
    name = "SUB-SRV"
    address_prefix = "10.10.1.0/24"
  }

  subnet = {
    name = "AzureBastionSubnet"
    address_prefix = "10.10.250.0/26"
  }
}