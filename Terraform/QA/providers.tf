terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.68.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.serviceprincipal1.subs_id
  client_id       = var.serviceprincipal1.clientid
  client_secret   = var.serviceprincipal1.clientsecret
  tenant_id       = var.serviceprincipal1.tenantid
}
