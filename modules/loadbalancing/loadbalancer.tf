resource "azurerm_lb" "london_hug" {
  name                = "${var.loadbalancer_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  frontend_ip_configuration {
    name                          = "default"
    subnet_id                     = "${var.public_subnet_id}"
    private_ip_address_allocation = "${var.ip_address_allocation}"
  }
}

resource "azurerm_lb_backend_address_pool" "london_hug" {
  name                = "lb_backend_address_pool"
  resource_group_name = "${var.resource_group_name}"
  loadbalancer_id     = "${azurerm_lb.london_hug.id}"
}