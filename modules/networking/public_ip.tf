resource "azurerm_public_ip" "london_hug" {
  name = "${var.public_ip_name}"
  location = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  public_ip_address_allocation = "static"
}