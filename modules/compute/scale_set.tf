resource "azurerm_virtual_machine_scale_set" "test" {
  name                = "${var.scale_set_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  upgrade_policy_mode = "${var.upgrade_policy}"

  sku {
    name     = "${var.compute_instance_type}"
    tier     = "Standard"
    capacity = "${var.compute_capacity}"
  }

  os_profile {
    computer_name_prefix = "${os_profile_computer_name_prefix}"
    admin_username = "${os_profile_admin_username}"
    admin_password = "${os_profile_admin_password}"
  }

  network_profile {
    name    = "NetworkProfile"
    primary = true
    ip_configuration {
      name                                   = "IPConfiguration"
      subnet_id                              = "${var.private_subnet_id}"
      load_balancer_backend_address_pool_ids = [ "${var.lb_backend_address_pool_id}" ]
    }
  }

  storage_profile_os_disk {
    name 		   = "os-disk"
    caching        = "ReadWrite"
    create_option  = "FromImage"
    vhd_containers = [ "${azurerm_storage_account.test.primary_blob_endpoint}${azurerm_storage_container.test.name}" ]
  }

  storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "14.04.2-LTS"
    version   = "latest"
  }
}