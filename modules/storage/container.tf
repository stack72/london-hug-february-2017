resource "azurerm_storage_container" "london_hug" {
  count                 = "${length(var.container_name)}"
  name                  = "${element(var.container_name, count.index)}"
  resource_group_name   = "${var.resource_group_name}"
  storage_account_name  = "${azurerm_storage_account.london_hug.name}"
  container_access_type = "${var.container_access_type}"
}