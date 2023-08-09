

resource "azurerm_subnet" "subnetinfo" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtualnetwork_name
  address_prefixes     = [var.address]

}


output "subnet_id" {
  value = azurerm_subnet.subnetinfo.id
}





