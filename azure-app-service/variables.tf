variable "resource_group_name" {
  type    = string
  default = "example-resource-group"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "app_service_plan_name" {
  type    = string
  default = "example-app-service-plan"
}

variable "app_service_plan_sku_tier" {
  type    = string
  default = "Standard"
}

variable "app_service_plan_sku_size" {
  type    = string
  default = "S1"
}

variable "function_app_name" {
  type    = string
  default = "example-function-app"
}

variable "storage_account_name" {
  type    = string
  default = "example-storage-account"
}
