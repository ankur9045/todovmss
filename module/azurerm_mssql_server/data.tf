data "azurerm_key_vault" "key_vault_id" {
    for_each = var.sql_servers
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault_secret" "administrator_login" {
    for_each = var.sql_servers
  name         = each.value.administrator_login_name
  key_vault_id = data.azurerm_key_vault.key_vault_id[each.key].id
}
data "azurerm_key_vault_secret" "administrator_login_password" {
    for_each = var.sql_servers
  name         = each.value.administrator_login_password_name
  key_vault_id = data.azurerm_key_vault.key_vault_id[each.key].id
  
}
data "azurerm_key_vault_secret" "login_username" {
    for_each = var.sql_servers
  name         = each.value.azuread_administrator_login_username
  key_vault_id = data.azurerm_key_vault.key_vault_id[each.key].id 
  
}
data "azurerm_client_config" "current" {}