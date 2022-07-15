provider "azurerm" {
  features {}

}
# provider "azurerm" {
#   features {
#     virtual_machine {
#       delete_os_disk_on_deletion = false
#     }
#   }
#   alias = "provider2-westus"
#   #  client_id = ""
#   #  client_secret = ""
#   #  subscription_id = ""

# }
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "1.44.0"
    }
  }
}
