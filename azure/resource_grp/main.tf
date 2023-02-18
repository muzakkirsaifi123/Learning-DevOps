resource "azurerm_resource_group" "rg_name" {
    name = "${var.group_name}"
    location = "${var.location}"
  
}

output "rgroup_ouput" {

    value = "Your resource group name is ${azurerm_resource_group.rg_name.name}"
  
}