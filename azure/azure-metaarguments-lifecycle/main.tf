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
  # Add Expicit Depedency to have this resource created only after virtual network and subnets
  depends_on = [
    azurerm_virtual_network.myvnet,
    azurerm_subnet.mysubnet
  ]
  name                = "mypublicip"
  location            = azurerm_resource_group.myrg1.location
  resource_group_name = azurerm_resource_group.myrg1.name
  allocation_method   = "Static"
  domain_name_label = "app1-vm-${random_string.myrandom.id}"
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

resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  name="mylinuxvm-1"
  computer_name = "devlinux-vm1"
  resource_group_name = azurerm_resource_group.myrg1.name
  location = azurerm_resource_group.myrg1.location
  size="Standard_DS1_v2"
  admin_username = "azureuser"
  network_interface_ids = [azurerm_network_interface.myvmninterface.id]
  admin_ssh_key {
    username = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
  os_disk {
    name = "osdisk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }
  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}
# Lifecycle Block inside a Resource
  lifecycle {
    create_before_destroy = true
  }

