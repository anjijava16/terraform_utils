resource "azurerm_resource_group" "rg" {
  name    ="welcomdemo"
  location = var.location
}
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
   account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = "true"
}
resource "azurerm_storage_container" "container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "container"
}
resource "azurerm_storage_blob" "blob" {
  name                   = "sample-file.sh"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source                 = "commands.sh"
}
