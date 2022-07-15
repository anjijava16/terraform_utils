resource "azurerm_resource_group" "resource_gp" {
  name="iwinnerterraformgroup"
  location = "EAST US"
  tags = {
    "owner" = "welcome"
  }
}