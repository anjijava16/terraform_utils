resource "azurerm_resource_group" "myrg1" {
  name="myrg-1"
  location = "EAST US"
}
# Uses "provider2-westus provider "
resource "azurerm_resource_group" "myrg2" {
    name="myrg-2"
    location = "WEST US"
    provider = azurerm.provider2-westus
  
}