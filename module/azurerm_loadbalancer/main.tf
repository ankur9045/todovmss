resource "azurerm_lb" "vmsslb" {
  for_each = var.load_balancer
  name                = each.value.loadbalancer_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configurations
    content {
      name                          = frontend_ip_configuration.value.name
      subnet_id                     = data.azurerm_subnet.subnet_id[each.key].id
      public_ip_address_id          = data.azurerm_public_ip.lb_public_ip[each.key].id
      private_ip_address_allocation = frontend_ip_configuration.value.private_ip_address_allocation
    }
  }
}