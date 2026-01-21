data "azurerm_subnet" "subnet_id" {
  for_each = var.application_gateways
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "lb_public_ip" {
  for_each = var.application_gateways
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}