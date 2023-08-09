output "nsg_id" {
  value = azurerm_network_security_group.bastion.id
}

output "nsgname" {
  value = azurerm_network_security_group.bastion.name
}

output "cnsg" {
  value = azurerm_network_security_group.bastion
}