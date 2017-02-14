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

variable "private_subnet_id" {
  type = "string"
  description = "The Private Subnet ID in which to launch the ScaleSet machines"
}

variable "lb_backend_address_pool_id" {
  type = "string"
  description = "The ID of the Loadbalancer Backend Address Pool in which to launch the ScaleSet machines"
}

variable "vhd_containers" {
  type = "list"
  description = "The list of VHD Containers to use the the OS Disks"
}

variable "image_publisher" {
  type = "string"
  description = "The name of the Image publisher"
}

variable "image_name" {
  type = "string"
  description = "The name of the Image to launch"
}

variable "image_version" {
  type = "string"
  description = "The version of the image to launch"
}



