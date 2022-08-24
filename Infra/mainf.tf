resource "azurerm_resource_group" "RGAPP" {
  name     = "RGAPP"
  location = var.location
  tags     = var.tags
}

## REDE
resource "azurerm_network_security_group" "NSG01" {
  name                = "NSG01"
  location            = var.location
  resource_group_name = azurerm_resource_group.RGAPP.name
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "NSG-TO-SUB-SRV" {
  subnet_id                 = azurerm_subnet.SUB-SRV.id
  network_security_group_id = azurerm_network_security_group.NSG01.id
}

resource "azurerm_virtual_network" "VNET01" {
  name                = "VNET01"
  resource_group_name = azurerm_resource_group.RGAPP.name
  location            = var.location
  tags                = var.tags
  address_space       = ["10.10.0.0/16"]
}

resource "azurerm_subnet" "SUB-SRV" {
  name                 = "SUB-SRV"
  resource_group_name  = azurerm_resource_group.RGAPP.name
  virtual_network_name = azurerm_virtual_network.VNET01.name
  address_prefixes     = ["10.10.1.0/24"]
}

resource "azurerm_subnet" "SUB-APPGW" {
  name                 = "SUB-APPGW"
  resource_group_name  = azurerm_resource_group.RGAPP.name
  virtual_network_name = azurerm_virtual_network.VNET01.name
  address_prefixes     = ["10.10.2.0/24"]
}

resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.RGAPP.name
  virtual_network_name = azurerm_virtual_network.VNET01.name
  address_prefixes     = ["10.10.250.0/26"]
}

resource "azurerm_network_interface" "NIC-VM01" {
  name                = "NIC-VM01"
  resource_group_name = azurerm_resource_group.RGAPP.name
  location            = var.location
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.SUB-SRV.id
    private_ip_address_allocation = "Dynamic"
  }
}

# SERVIDORES VIRTUAIS
resource "azurerm_windows_virtual_machine" "VM01" {
  name = "VM01"
  resource_group_name = azurerm_resource_group.RGAPP.name
  location = var.location
  tags = var.tags
  size = "Standard_D2s_V3"
  admin_username = "rafael.admin"
  admin_password = "@#abc,123@#"
  network_interface_ids = [ azurerm_network_interface.NIC-VM01.id, ]
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Premium_ZRS"
  }
  
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2022-Datacenter"
    version = "lastest"
  }

}
