resource "azurerm_mssql_server" "sql_server" {
    for_each = var.sql_servers
  name                         = each.value.sql_server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.sql_server_version
  administrator_login          = data.azurerm_key_vault_secret.administrator_login[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.administrator_login_password[each.key].value
  minimum_tls_version          = each.value.minimum_tls_version

 dynamic "azuread_administrator" {
    for_each = var.sql_servers
    content {
      login_username = data.azurerm_key_vault_secret.login_username[each.key].value
      object_id      = data.azurerm_client_config.current.object_id
    }   
  }
}
