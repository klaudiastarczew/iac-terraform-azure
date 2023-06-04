variable "name_app_resources" {
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

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "name_storage_container" {
  type    = string
  default = "example-storage-container"
}

variable "access_container_type" {
  type    = string
  default = "private"
}

variable "name_storage_blob" {
  type    = string
  default = "example-storage-blob"
}

variable "type_storage_blob" {
  type    = string
  default = "Block"
}

variable "source_storage_blob" {
  type    = string
  default = "/home/app/cloud-apps/file.txt"
}
