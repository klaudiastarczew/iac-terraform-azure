resource "azurerm_resource_group" "function_app" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_app_service_plan" "function_app" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.function_app.location
  resource_group_name = azurerm_resource_group.function_app.name

  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
  }
}

resource "azurerm_function_app" "function_app" {
  name                = var.function_app_name
  resource_group_name = azurerm_resource_group.function_app.name
  location            = azurerm_resource_group.function_app.location
  app_service_plan_id = azurerm_app_service_plan.function_app.id

  storage_account_name = var.storage_account_name

  site_config {}
  storage_account_access_key = ""
}
