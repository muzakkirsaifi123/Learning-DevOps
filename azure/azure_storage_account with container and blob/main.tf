resource "azurerm_resource_group" "rg_name" {
    name = "${var.rg}"
    location = "${var.loc}"
  
}


resource "azurerm_storage_account" "storage_account" {
    name = "${var.s_account}"
    resource_group_name = azurerm_resource_group.rg_name.name
    location = azurerm_resource_group.rg_name.location
    account_tier = "Standard"
    account_replication_type = "GRS"

    tags = {
        environment = "prod"
    }

    depends_on = [

      azurerm_resource_group.rg_name
    ]

  
}
resource "azurerm_storage_container" "container_resource" {
  name                  = "containersa"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
  depends_on = [
    # azurerm_resource_group.rg_name
    azurerm_storage_account.storage_account
  ]
}

resource "azurerm_storage_blob" "first_bolb" {
  
  name = "sample_blob"
  storage_account_name = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.container_resource.name
  type = "Block"
  source = "sample.txt"
}