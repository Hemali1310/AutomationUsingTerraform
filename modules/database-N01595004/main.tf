resource "azurerm_postgresql_server" "psql_server" {
  name                = "psqlserver5004"
  location            = var.rgroup-location
  resource_group_name = var.rgroup-name

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = var.db_username
  administrator_login_password = var.db_pass
  version                      = var.db_version
  ssl_enforcement_enabled      = true
  tags = {
    Assignment      = "CCGC 5502 Automation Assignment"
    Name            = "Hemali.Solanki"
    ExpirationDate  = "2024-12-31"
    Environment     = "Learning"
  }
}

resource "azurerm_postgresql_database" "postgre_database" {
  name                = "postgredatabase"
  resource_group_name = var.rgroup-name
  server_name         = azurerm_postgresql_server.psql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}