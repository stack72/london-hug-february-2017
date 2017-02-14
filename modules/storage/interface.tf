variable "storage_account_name" {
  type = "string"
  description = "The name of the storage account to create"
}

variable "location" {
  type = "string"
  description = "The location in which to create the storage account"
}

variable "resource_group_name" {
  type = "string"
  description = "The name of the resource group in which to create the virtual network"
}

variable "account_type" {
  type = "string"
  description = "The Storage account type"
}

variable "container_name" {
  type = "list"
  description = "The list of containers to create"
}

variable "container_access_type" {
  type = "string"
  description = "The 'interface' for access the container provides"
}

output "primary_blob_endpoint" {
  value = "${azurerm_storage_account.london_hug.primary_blob_endpoint}"
}

output "main_container_name" {
  value = "${azurerm_storage_container.london_hug.name[0]}"
}