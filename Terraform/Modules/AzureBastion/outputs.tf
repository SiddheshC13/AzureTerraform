output "Bastion-VirtualNetwork_name" {
  value = azurerm_virtual_network.bastion.name
}

output "Bastion-subnet_id" {
  value = azurerm_subnet.bastion.id
}
