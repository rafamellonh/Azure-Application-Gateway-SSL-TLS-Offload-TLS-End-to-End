resource "azurerm_public_ip" "PIP-APPGW01" {
  name = "PIP-APPGW01"
  resource_group_name = azurerm_resource_group.RGAPP.name
  allocation_method = "Dynamic"
  location = var.location
}

