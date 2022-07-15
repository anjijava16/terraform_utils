resource "azurerm_resource_group" "myrg1" {
  name     = "myrg-1"
  location = "EAST US"
}

// Resource2: Random String 
resource "random_string" "myrandom" {
  length  = 16
  special = false
  upper   = false
}

// Resource3 : Azure Storage Account 
resource "azurerm_storage_account" "example" {
  name                     = "mysa${random_string.myrandom.id}"
  resource_group_name      = azurerm_resource_group.myrg1.name
  location                 = azurerm_resource_group.myrg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
   account_encryption_source="Microsoft.Storage"

  tags = {
    environment = "staging"
  }
}