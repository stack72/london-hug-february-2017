variable "name" {
  type = "string"
  description = "The name of the Virtual Network resource"
}

variable "public_ip_name" {
  type = "string"
  description = "Name to assign to the public IP address resource"
}

variable "location" {
  type = "string"
  description = "The location for the Virtual Network"
}

variable "resource_group_name" {
  type = "string"
  description = "The name of the resource group in which to create the virtual network"
}

variable "address_space" {
  type = "string"
  description = "The address space of the Virtual Network"
}

output "public_subnet_id" {
  value = "${azurerm_subnet.public.id}"
}

output "private_subnet_id" {
  value = "${azurerm_subnet.private.id}"
}

output "public_ip" {
  value = "${azurerm_public_ip.london_hug.ip_address}"
}