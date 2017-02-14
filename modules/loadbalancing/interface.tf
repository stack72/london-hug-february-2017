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

variable "public_subnet_id" {
  type = "string"
  description = "The ID of the public subnet in which to put the Loadbalancer"
}

variable "ip_address_allocation" {
  type = "string"
  description = "The IP address allocation type"
  default = "Dynamic"
}