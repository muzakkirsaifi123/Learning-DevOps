resource "azurerm_resource_group" "rg_name" {
    name = "${var.rg}"
    location = "${var.loc}"
 
}


resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  location            = azurerm_resource_group.rg_name.location
  resource_group_name = azurerm_resource_group.rg_name.name
  address_space       = ["175.25.0.0/24"]

  subnet {
    name           = "subnet-1"
    address_prefix = "175.25.0.0/26"
  }

  subnet {
    name           = "subnet-2"
    address_prefix = "175.25.0.64/28"
  }

  tags = {
    environment = "demo"
  }
}