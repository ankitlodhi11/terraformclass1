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