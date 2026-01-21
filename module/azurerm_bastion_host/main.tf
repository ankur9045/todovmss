resource "azurerm_bastion_host" "bastion_host" {
    for_each = var.bastion_hosts
  name                = each.value.bastion_host_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ip_configuration_name
    subnet_id            = data.azurerm_subnet.subnet_id[each.key].id
    public_ip_address_id = data.azurerm_public_ip.public_ip_id[each.key].id
  }
}
