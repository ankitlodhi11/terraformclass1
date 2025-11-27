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
  subscription_id = "0fed9206-7606-41d6-bea8-83033d2b432f"
}