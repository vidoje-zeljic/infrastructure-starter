provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "tf_group"
  location = "West Europe"
}

resource "azurerm_service_plan" "example" {
  name                = "tf_plan"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "F1"
}