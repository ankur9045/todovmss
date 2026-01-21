variable "resource_groups" {
  type = map(object({
    resource_group_name = string
    location            = string
  }))
}

variable "storage_accounts" {
  type = map(object({
    storage_account_name     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "vnets" {
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    subnet_name          = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "public_ip" {
  type = map(object({
    public_ip_name      = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}

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

variable "key_vaults" {
  type = map(object({
    key_vault_name              = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
  }))
}

variable "key_vault_secret" {
  type = map(object({
    secret_name         = string
    secret_value        = string
    key_vault_name      = string
    resource_group_name = string
  }))
}

variable "bastion_hosts" {
  type = map(object({
    bastion_host_name     = string
    location              = string
    resource_group_name   = string
    ip_configuration_name = string
    subnet_name           = string
    virtual_network_name  = string
    public_ip_name        = string
  }))
}

variable "application_gateways" {
  type = map(object({
    application_gateway_name = string
    resource_group_name      = string
    location                 = string
    subnet_name              = string
    virtual_network_name     = string
    public_ip_name           = string


    sku_name     = string
    sku_tier     = string
    sku_capacity = number


    gateway_ip_configuration = list(object({
      name = string

    }))

    frontend_port = list(object({
      name = string
      port = number
    }))
    frontend_ip_configuration = list(object({
      name = string
    }))
    backend_address_pool = list(object({
      name = string
    }))
    backend_http_settings = list(object({
      name                  = string
      cookie_based_affinity = string
      path                  = string
      port                  = number
      protocol              = string
      request_timeout       = number
    }))
    http_listener = list(object({
      name                           = string
      frontend_ip_configuration_name = string
      frontend_port_name             = string
      protocol                       = string

    }))
    request_routing_rule = list(object({
      name                       = string,
      priority                   = number,
      rule_type                  = string,
      http_listener_name         = string,
      backend_address_pool_name  = string,
      backend_http_settings_name = string,

    }))

  }))

}


variable "load_balancer" {
  type = map(object({
    loadbalancer_name    = string
    location             = string
    resource_group_name  = string
    sku                  = string
    subnet_name          = string
    virtual_network_name = string
    public_ip_name       = string
    frontend_ip_configurations = list(object({
      name                          = string
      private_ip_address_allocation = string
    }))
  }))
}




variable "vmss_configs" {
  type = map(object({
    vmss_name            = string
    resource_group_name  = string
    location             = string
    vmss_sku             = string
    instances            = number
    computer_name_prefix = string

    image_publisher = string
    image_offer     = string
    image_sku       = string
    image_version   = string

    os_disk_storage_account_type = string
    os_disk_caching              = string

    nic_name    = string
    nic_primary = bool

    ip_configuration_name    = string
    ip_configuration_primary = bool

    subnet_name          = string
    virtual_network_name = string
    load_balancer_name   = string
    key_vault_name       = string
    au_name              = string
    ap_name              = string
  }))
}
