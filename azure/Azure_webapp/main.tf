# Create a resource group
resource "azurerm_resource_group" "stagging-rg" {
  name     = var.rg
  location =  var.loc
}

# Create app service plan
resource "azurerm_app_service_plan" "service-plan" {
  name = var.web-name
  location = azurerm_resource_group.stagging-rg.location
  resource_group_name = azurerm_resource_group.stagging-rg.name
  kind = var.os
  reserved = true
  depends_on = [
    azurerm_resource_group.stagging-rg
  ]
  sku {
    tier = "Standard"
    size = "S1"
  }
  tags = {
    environment = "stagging-environment"
  }
}

# Create JAVA app service
resource "azurerm_app_service" "app-service" {
  name = "test-demo-app-svc"
  location = azurerm_resource_group.stagging-rg.location
  resource_group_name = azurerm_resource_group.stagging-rg.name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id

site_config {
    linux_fx_version = "TOMCAT|9.0-java11"
  }
tags = {
    environment = "stagging-environment"
  }
}