data "azurerm_subnet" "subnet_id" {
  for_each = var.bastion_hosts
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "public_ip_id" {
  for_each = var.bastion_hosts
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}