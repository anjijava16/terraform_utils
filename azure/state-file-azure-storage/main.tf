terraform {
  backend "azurerm" {
    resource_group_name  = "welcome"
    storage_account_name = "welcomeiwinnerjobs"
    container_name       = "stateterraform"
    key                  = "Data.terraform.tfstate"
  }
}
resource "azurerm_resource_group" "rg" {
  name     = "welcom1235"
  location = "EAST US"
}
resource "azurerm_storage_account" "storage" {
  name                     = "welcometerraformbuck"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = "true"
}
resource "azurerm_storage_container" "container" {
  name                  = "welcome"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "container"
}