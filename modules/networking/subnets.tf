resource "azurerm_subnet" "public" {
  name = "hug_public_subnet"
  resource_group_name = "${var.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.hug_vn.name}"
  address_prefix = "${cidrsubnet(var.address_space, 8, 2)}"
}

resource "azurerm_subnet" "private" {
  name = "hug_private_subnet"
  resource_group_name = "${var.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.hug_vn.name}"
  address_prefix = "${cidrsubnet(var.address_space, 8, 8)}"
}