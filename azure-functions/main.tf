resource "azurerm_resource_group" "klaudias" {
  name     = var.name_resource_group
  location = var.location
}

resource "azurerm_storage_account" "klaudias" {
  name                     = var.name_storage_account
  resource_group_name      = azurerm_resource_group.klaudias.name
  location                 = azurerm_resource_group.klaudias.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_app_service_plan" "klaudias" {
  name                = var.name_app_service_plan
  location            = azurerm_resource_group.klaudias.location
  resource_group_name = azurerm_resource_group.klaudias.name

  sku {
    tier = var.tier_sku
    size = var.size_sku
  }
}

resource "azurerm_linux_function_app" "klaudias" {
  name                = var.name_linux_function_app
  resource_group_name = azurerm_resource_group.klaudias.name
  location            = azurerm_resource_group.klaudias.location

  storage_account_name = azurerm_storage_account.klaudias.name
  service_plan_id      = azurerm_service_plan.klaudias.id

  site_config {}
}

resource "azurerm_function_app_function" "klaudias" {
  name                       = var.name_test_azure_functions
  id                         = var.id_function_app_function
  location                   = azurerm_resource_group.klaudias.location
  resource_group_name        = azurerm_resource_group.klaudias.name
  app_service_plan_id        = azurerm_app_service_plan.klaudias.id
  storage_account_name       = azurerm_storage_account.klaudias.name
  storage_account_access_key = azurerm_storage_account.klaudias.primary_access_key
  config_json                = ""
  function_app_id            = ""
}