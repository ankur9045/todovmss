variable "sql_servers" {
  type = map(object({
    sql_server_name                      = string
    resource_group_name                  = string
    location                             = string
    sql_server_version                   = string
    minimum_tls_version                  = string
    key_vault_name                       = string
    administrator_login_name             = string
    administrator_login_password_name    = string
    azuread_administrator_login_username = string
    
  }))
}
