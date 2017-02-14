variable "scale_set_name" {
  type = "string"
  description = "The name of the ScaleSet resource"
}

variable "location" {
  type = "string"
  description = "The location for the ScaleSet"
}

variable "resource_group_name" {
  type = "string"
  description = "The name of the resource group in which to create the ScaleSet"
}

variable "upgrade_policy" {
  type = "string"
  default = "Manual"
}

variable "compute_instance_type" {
  type = "string"
  description = "The size of the instances in the ScaleSet"
}

variable "compute_capacity" {
  type = "string"
  description = "The number of instances in the ScaleSet"
}