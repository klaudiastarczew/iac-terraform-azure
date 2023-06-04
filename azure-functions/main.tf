resource "azurerm_resource_group" "app" {
  name     = var.name_resource_group
  location = var.location
}

resource "azurerm_storage_account" "app" {
  name                     = var.name_storage_account
  resource_group_name      = azurerm_resource_group.app.name
  location                 = azurerm_resource_group.app.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_app_service_plan" "app" {
  name                = var.name_app_service_plan
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name

  sku {
    tier = var.tier_sku
    size = var.size_sku
  }
}

resource "azurerm_linux_function_app" "app" {
  name                = var.name_linux_function_app
  resource_group_name = azurerm_resource_group.app.name
  location            = azurerm_resource_group.app.location

  storage_account_name = azurerm_storage_account.app.name
  service_plan_id      = azurerm_service_plan.app.id

  site_config {}
}

resource "azurerm_function_app_function" "app" {
  name                       = var.name_test_azure_functions
  id                         = var.id_function_app_function
  location                   = azurerm_resource_group.app.location
  resource_group_name        = azurerm_resource_group.app.name
  app_service_plan_id        = azurerm_app_service_plan.app.id
  storage_account_name       = azurerm_storage_account.app.name
  storage_account_access_key = azurerm_storage_account.app.primary_access_key
  config_json                = ""
  function_app_id            = ""
}
