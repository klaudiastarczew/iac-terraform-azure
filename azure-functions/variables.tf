variable "name_resource_group" {
  type    = string
  default = "example-resource-group"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "name_storage_account" {
  type    = string
  default = "example-storage-account"
}

variable "storage_account_tier" {
  type    = string
  default = "Standard"
}

variable "storage_account_replication_type" {
  type    = string
  default = "LRS"
}

variable "name_app_service_plan" {
  type    = string
  default = "example-app-service-plan"
}

variable "tier_sku" {
  type    = string
  default = "Standard"
}

variable "size_sku" {
  type    = string
  default = "S1"
}

variable "name_linux_function_app" {
  type    = string
  default = "example-linux-function-app"
}

variable "name_test_azure_functions" {
  type    = string
  default = "example-azure-functions"
}

variable "id_function_app_function" {
  type    = string
  default = "example-function-app-function"
}
