
resource "azurerm_virtual_network_peering" "example-2" {
  name                         = "peer1to2"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = var.VirtualNetwork_name-hub
  remote_virtual_network_id    = var.VirtualNetwork_id-spoke1
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false

}

resource "azurerm_virtual_network_peering" "hub_to_spoke2" {
  name                      = "peer1to3"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.VirtualNetwork_name-hub
  remote_virtual_network_id = var.VirtualNetwork_id-spoke2

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "spoke1_to_hub" {
  name                         = "peer2to1"
  resource_group_name          = var.resource_group_name-spoke1
  virtual_network_name         = var.virtualnetworkname-spoke1
  remote_virtual_network_id    = var.subnet_id_hub
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "spoke2_to_hub" {
  name                      = "peer3to1"
  resource_group_name       = var.resource_group_name-Spoke2
  virtual_network_name      = var.virtualnetwork_name-spoke2
  remote_virtual_network_id = var.subnet_id_hub

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}
