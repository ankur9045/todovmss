data "azurerm_mssql_server" "mssql_id" {
    for_each = var.databases
  name                = each.value.sql_server_name
  resource_group_name = each.value.resource_group_name
}