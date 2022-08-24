resource "azurerm_resource_group" "RGAPP" {
  name     = "RGAPP"
  location = var.location
  tags     = var.tags
}



