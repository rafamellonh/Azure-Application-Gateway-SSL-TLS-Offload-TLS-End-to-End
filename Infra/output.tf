output "private-ip01" {
  value = azurerm_network_interface.NIC-VM01.private_ip_address
}

output "private-ip02" {
  value = azurerm_network_interface.NIC-VM02.private_ip_address
}