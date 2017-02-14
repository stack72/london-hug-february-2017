variable "loadbalancer_name" {
  type = "string"
  description = "The name of the Loadbalancer resource"
}

variable "location" {
  type = "string"
  description = "The location for the Loadbalancer"
}

variable "resource_group_name" {
  type = "string"
  description = "The name of the resource group in which to create the loadbalancer"
}

variable "public_ip_id" {
  type = "string"
  description = "The ID of the public IP address in which to put the Loadbalancer"
}

variable "ip_address_allocation" {
  type = "string"
  description = "The IP address allocation type"
  default = "Dynamic"
}

output "lb_backend_address_pool_id" {
  value = "${azurerm_lb_backend_address_pool.london_hug.id}"
}