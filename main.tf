resource "azurerm_resource_group" "RG1" {
  name     = "terraformclass1"
  location = "japaneast"
}

resource "azurerm_storage_account" "st1" {
  name                     = "calss1storageaccount1"
  resource_group_name      = azurerm_resource_group.RG1.name
  location                 = azurerm_resource_group.RG1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "stc1" {
  name                  = "class1contaqiner"
  storage_account_id    = azurerm_storage_account.st1.id
  container_access_type = "blob"
}

resource "azurerm_virtual_network" "Vnet1" {
  name                = "ankit-vnet"
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
    
  }

  tags = {
    environment = "Production"
  }
}
# provider "azurerm" {
#   features {
#     key_vault {
#       purge_soft_delete_on_destroy    = true
#       recover_soft_deleted_key_vaults = true
#     }
#   }
# }

data "azurerm_client_config" "current" {}

# resource "azurerm_resource_group" "example" {
#   name     = "example-resources"
#   location = "West Europe"
# }

resource "azurerm_key_vault" "key1" {
  name                        = "class1keyvalt"
  location                    = azurerm_resource_group.RG1.location
  resource_group_name         = azurerm_resource_group.RG1.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}