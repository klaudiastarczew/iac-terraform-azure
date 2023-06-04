resource "azurerm_resource_group" "app" {
  name     = var.name_app_resources
  location = var.location
}

resource "azurerm_storage_account" "app" {
  name                     = var.name_storage_account
  resource_group_name      = azurerm_resource_group.app.name
  location                 = azurerm_resource_group.app.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_container" "app" {
  name                  = var.name_storage_container
  storage_account_name  = azurerm_storage_account.app.name
  container_access_type = var.access_container_type
}

resource "azurerm_storage_blob" "app" {
  name                   = var.name_storage_blob
  storage_account_name   = azurerm_storage_account.app.name
  storage_container_name = azurerm_storage_container.app.name
  type                   = var.type_storage_blob
  source                 = var.source_storage_blob
}

