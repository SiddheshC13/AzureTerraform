resource "azurerm_virtual_network" "vnet" {
  name                = var.virtualnetwork_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space]
}

output "id" {
  value = azurerm_virtual_network.vnet.id

}

output "VirtualNetwork_name" {
  value = azurerm_virtual_network.vnet.name

}

