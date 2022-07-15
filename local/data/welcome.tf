/*
module "aks-module" {
  source       = "git::https://github.com/sam-cogan/terraform-samcogan-aks.git"
  cluster_name = "AKS001"
  regions      = ["WESTEUROPE", "NORTHEUROPE"]
}

module "example" {
  source = "git::https://github.com/cloudposse/terraform-example-module.git?ref=master"
  example = "Hello world!"
}

*/


/*
module "example" {

source ="git::https://github.com/anjijava16/terraform-iws-modules.git"
#name                     ="welcomeone123"
#resource_group_name      = "welcomeone1"
#location                 = "EAST US"
#account_tier             = "Standard"
#account_replication_type = "LRS"
#allow_blob_public_access = "true"
resource_group_name="welcomeone123"
location="EAST US"
storage_account_name="storageiwinnerutilsapp"
storage_container_name="welcome"

}
*/

terraform {
  backend "azurerm" {
    resource_group_name  = "StorageAccount-ResourceGroup"
    storage_account_name = "abcd1234"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

module "example" {
source ="git::https://github.com/anjijava16/terraform-iws-modules.git?ref=azure-storage"
#name                     ="welcomeone1234"
#resource_group_name      = "welcomeone1"
#location                 = "EAST US"
#account_tier             = "Standard"
#account_replication_type = "LRS"
#allow_blob_public_access = "true"
resource_group_name="welcomeone1234"
location="EAST US"
storage_account_name="storageiwspwelcome"
storage_container_name="welcome"

}