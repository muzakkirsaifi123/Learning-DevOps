resource "azurerm_resource_group" "stagging_rg_name" {
    name = "${var.stagging_rg}"
    location = "${var.stagging_loc}"
 
}


resource "azurerm_virtual_network" "stagging_vnet" {
  name                = "${var.stagging_vnet_name}"
  location            = azurerm_resource_group.stagging_rg_name.location
  resource_group_name = azurerm_resource_group.stagging_rg_name.name
  address_space       = ["< -- >"]   # you can add your address
  tags = {
    environment = "stagging-environment"
  }
  depends_on = [
    azurerm_resource_group.stagging_rg_name
  ]
}



resource "azurerm_subnet" "stagging_subnet-1" {
  name                 = "${var.stagging_subnet_name}"
  resource_group_name  = azurerm_resource_group.stagging_rg_name.name
  virtual_network_name = azurerm_virtual_network.stagging_vnet.name
  address_prefixes     = ["<--->"]  # # you can add your subnet 
  depends_on = [
    azurerm_virtual_network.stagging_vnet
  ]

}
