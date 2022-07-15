resource "azurerm_resource_group" "myrg1" {
  name     = "myrg-1"
  location = "EAST US"
}
resource "azurerm_virtual_network" "myvnet" {
  name                = "myvnet-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  tags = {
    "Name" = "myvent",
    "Env"  = "Dev"
  }

}

// Resource-3 : Create subnet
resource "azurerm_subnet" "mysubnet" {
  name                 = "mysubnet"
  resource_group_name  = azurerm_resource_group.myrg1.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

// Resource-4 Create Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  name                = "mypublicip"
  location            = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  allocation_method   = "Static"
  tags = {
    "Name" = "publicip",
    "Env"  = "DEV"
  }

}

// Resource-5 Create Network Interface
resource "azurerm_network_interface" "myvmninterface" {
  name                = "myvmninterface"
  location            = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypublicip.id
  }
}
