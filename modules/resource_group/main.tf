resource "azurerm_resource_group" "hug_resource_group" {
  name     = "${var.name}"
  location = "${var.location}"
}