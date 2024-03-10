provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "psql-group"
  location = "West Europe"
}

resource "azurerm_postgresql_flexible_server" "tf-psql" {
  name                = "psql-vidoje"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"

  sku_name     = "B_Standard_B1ms"
  version      = "16"
  storage_mb   = 32768
  storage_tier = "P4"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "example" {
  name             = "psql-allow-all"
  server_id        = azurerm_postgresql_flexible_server.tf-psql.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}