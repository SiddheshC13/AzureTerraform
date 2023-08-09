terraform {
  backend "azurerm" {
    resource_group_name  = "serviceprincipal"
    storage_account_name = "spstorage1233"
    container_name       = "storageforterraform"
    key                  = "terraform.tfstate"
  }
}
