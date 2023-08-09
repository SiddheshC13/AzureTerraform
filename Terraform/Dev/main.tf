module "ResourceGroup-Hub" {
  source = "../Modules/ResourceGroup"

}

# Call the Bastion Module for Hub Bastion Host
module "Bastion-Hub" {

  source              = "../Modules/AzureBastion"
  resource_group_name = module.ResourceGroup-Hub.name
  location            = module.ResourceGroup-Hub.location
  Hub-subnet-id       = module.Bastion-Hub.Bastion-subnet_id

}

# Call the NSG Module for Centralized NSG
module "Centralized-NSG" {
  source                    = "../Modules/NetworkSecurityGroup"
  NetworkSecurityGroup-name = var.NetworkSecurityGroup-Name
  ResourceGroup-name        = module.ResourceGroup-Hub.name
  location                  = module.ResourceGroup-Hub.location
  subnet_id                 = module.Bastion-Hub.Bastion-subnet_id
}

data "azurerm_resource_group" "ResourceGroup-Spoke1" {
  name = var.Spoke1-resource_group_name

}


# Call the VNet Module for Spoke VNet 1
module "VirtualNetwork-Spoke1" {
  source              = "../Modules/VirtualNetwork"
  virtualnetwork_name = var.Spoke1-VirtualNetwork_name
  resource_group_name = data.azurerm_resource_group.ResourceGroup-Spoke1.name
  location            = data.azurerm_resource_group.ResourceGroup-Spoke1.location
  address_space       = var.VirtualNetwork-Address_Spoke1
}

# Call the Subnet Module for Spoke Subnet 1
module "Subnet-Spoke1" {
  source              = "../Modules/Subnet"
  subnet_name         = var.Spoke1-subnet-name
  virtualnetwork_name = module.VirtualNetwork-Spoke1.VirtualNetwork_name
  resource_group_name = data.azurerm_resource_group.ResourceGroup-Spoke1.name
  address             = var.Spoke1-subnet_address


}

data "azurerm_resource_group" "ResourceGroup-Spoke2" {
  name = var.Spoke2-resource_group_name

}

# Call the VNet Module for Spoke VNet 2
module "VirtualNetwork-Spoke2" {
  source              = "../Modules/VirtualNetwork"
  virtualnetwork_name = var.Spoke2-VirtualNetwork_name
  resource_group_name = data.azurerm_resource_group.ResourceGroup-Spoke2.name
  location            = data.azurerm_resource_group.ResourceGroup-Spoke2.location
  address_space       = var.VirtualNetwork-Address_Spoke2
}

# Call the Subnet Module for Spoke Subnet 1
module "Subnet-Spoke2" {
  source              = "../Modules/Subnet"
  subnet_name         = var.Spoke2-subnet-name
  virtualnetwork_name = module.VirtualNetwork-Spoke2.VirtualNetwork_name
  resource_group_name = data.azurerm_resource_group.ResourceGroup-Spoke2.name
  address             = var.Spoke2-subnet_address

}



module "Global-Peering" {
  source                     = "../Modules/Peering"
  resource_group_name        = module.ResourceGroup-Hub.name
  VirtualNetwork_name-hub    = module.Bastion-Hub.Bastion-VirtualNetwork_name
  VirtualNetwork_id-spoke1   = module.VirtualNetwork-Spoke1.id
  VirtualNetwork_id-spoke2   = module.VirtualNetwork-Spoke2.id
  resource_group_name-spoke1 = data.azurerm_resource_group.ResourceGroup-Spoke1.name
  virtualnetworkname-spoke1  = module.VirtualNetwork-Spoke1.VirtualNetwork_name
  subnet_id_hub              = module.Bastion-Hub.Bastion-subnet_id
  resource_group_name-Spoke2 = data.azurerm_resource_group.ResourceGroup-Spoke2.name
  virtualnetwork_name-spoke2 = module.VirtualNetwork-Spoke2.VirtualNetwork_name

}

module "VirtualMachine-Spoke1" {
  source                    = "../Modules/VirtualMachine"
  virtualmachine_name       = var.VirtualMachine-Spoke1
  subnet_id                 = module.Subnet-Spoke1.subnet_id
  resource_group_name       = data.azurerm_resource_group.ResourceGroup-Spoke1.name
  location                  = data.azurerm_resource_group.ResourceGroup-Spoke1.location
  networksecuritygroup_name = var.NetworkSecurityGroup-Name


}


module "VirtualMachine-Spoke2" {
  source                    = "../Modules/VirtualMachine"
  virtualmachine_name       = var.VirtualMachine-Spoke2
  subnet_id                 = module.Subnet-Spoke2.subnet_id
  resource_group_name       = data.azurerm_resource_group.ResourceGroup-Spoke2.name
  location                  = data.azurerm_resource_group.ResourceGroup-Spoke2.location
  networksecuritygroup_name = var.NetworkSecurityGroup-Name

}


