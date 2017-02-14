resource "azurerm_virtual_network" "hug_vn" {
  name 		        = "${var.name}"
  address_space       = ["${var.address_space}"]
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  subnet {
    name = "public_subnet"
    address_prefix = "${cidrsubnet(var.address_space, 8, 2)}"
  }

  subnet {
    name = "private_subnet"
    address_prefix = "${cidrsubnet(var.address_space, 8, 8)}"
  }
}

