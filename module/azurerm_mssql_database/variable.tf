variable "databases" {
  type = map(object({
    sql_server_name     = string
    resource_group_name = string
    sql_database_name   = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string
  }))
}