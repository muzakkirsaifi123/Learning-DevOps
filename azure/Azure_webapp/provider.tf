terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.38.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    
  features {}
}