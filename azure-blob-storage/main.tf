resource "azurerm_resource_group" "klaudias" {
  name     = var.name_klaudias_resources
  location = var.location
}

resource "azurerm_storage_account" "klaudias" {
  name                     = var.name_storage_account
  resource_group_name      = azurerm_resource_group.klaudias.name
  location                 = azurerm_resource_group.klaudias.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_container" "klaudias" {
  name                  = var.name_storage_container
  storage_account_name  = azurerm_storage_account.klaudias.name
  container_access_type = var.access_container_type
}

resource "azurerm_storage_blob" "klaudias" {
  name                   = var.name_storage_blob
  storage_account_name   = azurerm_storage_account.klaudias.name
  storage_container_name = azurerm_storage_container.klaudias.name
  type                   = var.type_storage_blob
  source                 = var.source_storage_blob
}

