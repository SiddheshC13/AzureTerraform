terraform {
  backend "azurerm" {
    resource_group_name  = "QA_storage"
    storage_account_name = "storageforqa1"
    container_name       = "qastorage"
    key                  = "terraform.tfstate"
  }
}