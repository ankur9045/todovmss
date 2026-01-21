data "azurerm_subnet" "subnet_id" {
  for_each = var.vmss_configs
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_lb" "lb_id" {
    for_each = var.vmss_configs
  name                = each.value.load_balancer_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault" "key_id" {
    for_each = var.vmss_configs
    name                = each.value.key_vault_name
    resource_group_name = each.value.resource_group_name
  
}
data "azurerm_key_vault_secret" "admin_username" {
    for_each = var.vmss_configs
    name         = each.value.au_name
    key_vault_id = data.azurerm_key_vault.key_id[each.key].id
}
data "azurerm_key_vault_secret" "admin_password" {
    for_each = var.vmss_configs
    name         = each.value.ap_name
    key_vault_id = data.azurerm_key_vault.key_id[each.key].id
}
data "azurerm_client_config" "current" {}