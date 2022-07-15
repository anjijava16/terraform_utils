resource "azurerm_resource_group" "rg1" {
  name     ="welcomeiwinnerdbs"
  location = var.resource_group_location
  tags = {
    environment = "production"
  }
}
resource "azurerm_sql_server" "sqldb" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.rg1.name
  location                     = azurerm_resource_group.rg1.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_sql_database" "db" {
  name                = "terraform-sqldatabase20"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  server_name         = azurerm_sql_server.sqldb.name
}