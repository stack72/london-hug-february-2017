provider "azurerm" { }

variable "location" {
  type = "string"
  default = "UK South"
}

module "hug_resource_group" {
  source = "./modules/resource_group"

  name = "LondonHUG2017"
  location = "${var.location}"
}

module "hub_networking" {
  source = "./modules/networking"

  resource_group_name = "${module.hug_resource_group.name}"

  address_space = "10.0.0.0/16"
  location = "${var.location}"
  name = "LondonHUGVN"

  public_ip_name = "LondonHUGPublicIP"
}

module "hug_storage" {
  source = "./modules/storage"

  resource_group_name = "${module.hug_resource_group.name}"
  storage_account_name = "londonhugsa4000"
  location = "${var.location}"
  account_type = "Standard_LRS"

  container_access_type = "private"
  container_name = ["vhds"]
}

module "load_balancing" {
  source = "./modules/loadbalancing"

  loadbalancer_name = "LondonHUGLoadbalancer"
  location = "${var.location}"
  resource_group_name = "${module.hug_resource_group.name}"

  public_subnet_id = "${module.hub_networking.public_subnet_id}"
}

module "compute" {
  source = "./modules/compute"

  scale_set_name = "LondonHUGScaleSet"
  location = "${var.location}"
  resource_group_name = "${module.hug_resource_group.name}"

  compute_capacity = "3"
  compute_instance_type = "Standard_A0"

  os_profile_name_prefix = "scaleset-vm-"
  os_profile_admin_username = "myadmin"
  os_profile_admin_password = "Password1234!"

  vhd_containers = ["${module.hug_storage.primary_blob_endpoint}${module.hug_storage.main_container_name}}"]
  private_subnet_id = "${module.hub_networking.private_subnet_id}"
  lb_backend_address_pool_id = "${module.load_balancing.lb_backend_address_pool_id}"

  image_publisher = "Canonical"
  image_name = "UbuntuServer"
  image_version = "16.04.0-LTS"
}

output "loadbalancer_ip_address" {
  value = "${module.hub_networking.public_ip}"
}