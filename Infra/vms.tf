# SERVIDORES VIRTUAIS
resource "azurerm_windows_virtual_machine" "VM01" {
  name                  = "VM01"
  resource_group_name   = azurerm_resource_group.RGAPP.name
  location              = var.location
  tags                  = var.tags
  size                  = "Standard_D2s_V3"
  admin_username        = "rafael.admin"
  admin_password        = "@#abc,123@#"
  network_interface_ids = [azurerm_network_interface.NIC-VM01.id, ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-g2"
    version   = "latest"
  }

}

resource "azurerm_windows_virtual_machine" "VM02" {
  name                  = "VM02"
  resource_group_name   = azurerm_resource_group.RGAPP.name
  location              = var.location
  tags                  = var.tags
  size                  = "Standard_D2s_V3"
  admin_username        = "rafael.admin"
  admin_password        = "@#abc,123@#"
  network_interface_ids = [azurerm_network_interface.NIC-VM02.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-g2"
    version   = "latest"
  }

}

resource "azurerm_virtual_machine_extension" "EXT-IIS01" {
  name                 = "IIS01"
  virtual_machine_id   = azurerm_windows_virtual_machine.VM01.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  protected_settings = <<PROTECTED_SETTINGS
  {
    "commandToExecute": "powershell.exe -Command \"./iis.ps1; exit 0;\""
  }
  PROTECTED_SETTINGS

  settings = <<SETTINGS
    {
        "fileUris": [
          "https://raw.githubusercontent.com/rafamellonh/Azure-Application-Gateway-SSL-TLS-Offload-TLS-End-to-End/main/Infra/iis.ps1?token=GHSAT0AAAAAABVTLGP447UQ4FAL6BAHEKW4YYGMWOA"
        ]
    }
  SETTINGS
}

resource "azurerm_virtual_machine_extension" "EXT-IIS02" {
  name                 = "IIS02"
  virtual_machine_id   = azurerm_windows_virtual_machine.VM02.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  protected_settings = <<PROTECTED_SETTINGS
  {
    "commandToExecute": "powershell.exe -Command \"./iis.ps1; exit 0;\""
  }
  PROTECTED_SETTINGS

  settings = <<SETTINGS
    {
        "fileUris": [
          "https://raw.githubusercontent.com/rafamellonh/Azure-Application-Gateway-SSL-TLS-Offload-TLS-End-to-End/main/Infra/iis.ps1?token=GHSAT0AAAAAABVTLGP447UQ4FAL6BAHEKW4YYGMWOA"
        ]
    }
  SETTINGS
}

