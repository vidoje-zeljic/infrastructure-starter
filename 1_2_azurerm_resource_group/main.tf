terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-storage"
    storage_account_name = "vidoje"
    container_name       = "tfstate"
    key                  = "v1.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  location = "eastus"
  name     = "v1_group"
}