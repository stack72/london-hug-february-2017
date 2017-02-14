resource "azurerm_storage_account" "london_hug" {
  name                = "${var.storage_account_name}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  account_type        = "${var.account_type}"
}