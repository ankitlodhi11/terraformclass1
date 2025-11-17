terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraformclass1"
    storage_account_name = "calss1storageaccount1"
    container_name       = "tfstate"
    key                  = "tfstate"
}
 
  }
provider "azurerm" {
  features {}
  subscription_id = "1d3588c8-af2c-442c-bdc3-7fc3b65594b9"
}