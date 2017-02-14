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
}

module "hug_storage" {
  source = "./modules/storage"

  resource_group_name = "${module.hug_resource_group.name}"
  storage_account_name = "londonhugsa"
  location = "${var.location}"
  account_type = "Standard_LRS"

  container_access_type = "private"
  container_name = ["vhds"]
}


//
//resource "azurerm_storage_container" "test" {
//  name                  = "vhds"
//  resource_group_name   = "${azurerm_resource_group.test.name}"
//  storage_account_name  = "${azurerm_storage_account.test.name}"
//  container_access_type = "private"
//}
//
//resource "azurerm_lb" "test" {
//  name                = "acctestlb-%d"
//  location            = "southcentralus"
//  resource_group_name = "${azurerm_resource_group.test.name}"
//
//  frontend_ip_configuration {
//    name                          = "default"
//    subnet_id                     = "${azurerm_subnet.test.id}"
//    private_ip_address_allocation = "Dynamic"
//  }
//}
//
//resource "azurerm_lb_backend_address_pool" "test" {
//  name                = "test"
//  resource_group_name = "${azurerm_resource_group.test.name}"
//  location            = "southcentralus"
//  loadbalancer_id     = "${azurerm_lb.test.id}"
//}
//
//resource "azurerm_virtual_machine_scale_set" "test" {
//  name                = "acctvmss-%d"
//  location            = "southcentralus"
//  resource_group_name = "${azurerm_resource_group.test.name}"
//  upgrade_policy_mode = "Manual"
//
//  sku {
//    name     = "Standard_A0"
//    tier     = "Standard"
//    capacity = 1
//  }
//
//  os_profile {
//    computer_name_prefix = "testvm-%d"
//    admin_username = "myadmin"
//    admin_password = "Passwword1234"
//  }
//
//  network_profile {
//    name    = "TestNetworkProfile"
//    primary = true
//    ip_configuration {
//      name                                   = "TestIPConfiguration"
//      subnet_id                              = "${azurerm_subnet.test.id}"
//      load_balancer_backend_address_pool_ids = [ "${azurerm_lb_backend_address_pool.test.id}" ]
//    }
//  }
//
//  storage_profile_os_disk {
//    name 		   = "os-disk"
//    caching        = "ReadWrite"
//    create_option  = "FromImage"
//    vhd_containers = [ "${azurerm_storage_account.test.primary_blob_endpoint}${azurerm_storage_container.test.name}" ]
//  }
//
//  storage_profile_image_reference {
//    publisher = "Canonical"
//    offer     = "UbuntuServer"
//    sku       = "14.04.2-LTS"
//    version   = "latest"
//  }
//}