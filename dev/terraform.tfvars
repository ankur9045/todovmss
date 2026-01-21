resource_groups = {
  "rg1" = {
    resource_group_name = "dev-rg1"
    location            = "centralus"
  }
}

storage_accounts = {
  "sg1" = {
    storage_account_name     = "devsg1"
    resource_group_name      = "dev-rg1"
    location                 = "centralus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

vnets = {
  "vnet1" = {
    vnet_name           = "dev-vnet1"
    location            = "centralus"
    resource_group_name = "dev-rg1"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  "snet1" = {
    subnet_name          = "dev-snet1"
    resource_group_name  = "dev-rg1"
    virtual_network_name = "dev-vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }
   "snet2" = {
    subnet_name          = "dev-snet2"
    resource_group_name  = "dev-rg1"
    virtual_network_name = "dev-vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

public_ip = {
  "pip1" = {
    public_ip_name      = "dev-pip1"
    location            = "centralus"
    resource_group_name = "dev-rg1"
    allocation_method   = "Dynamic"
  }
}

sql_servers = {
  "sql1" = {
    sql_server_name                      = "dev-sql1"
    resource_group_name                  = "dev-rg1"
    location                             = "centralus"
    sql_server_version                   = "12.0"
    minimum_tls_version                  = "1.2"
    key_vault_name                       = "dev-keyvault1"
    administrator_login_name             = "sqladminuser"
    administrator_login_password_name    = "sqladminpassword"
    azuread_administrator_login_username = "aadadminuser"
  }
}

databases = {
  "sqldata1" = {
    sql_server_name     = "dev-sql1"
    resource_group_name = "dev-rg1"
    sql_database_name   = "dev-sqldata1"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "Basic"
    enclave_type        = "VBS"
  }
}

key_vaults = {
  "key_vault1" = {
    key_vault_name              = "dev-keyvault1"
    location                    = "centralus"
    resource_group_name         = "dev-rg1"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 90
    purge_protection_enabled    = false
    sku_name                    = "standard"
  }
}

key_vault_secret = {
  "secret1" = {
    secret_name         = "dev-secret1"
    secret_value        = "mySecretValue123!"
    key_vault_name      = "dev-keyvault1"
    resource_group_name = "dev-rg1"
  }
    "secret2" = {
    secret_name         = "dev-secret2"
    secret_value        = "mySecretValue123"
    key_vault_name      = "dev-keyvault1"
    resource_group_name = "dev-rg1"
  }
}

bastion_hosts = {
  "bastion1" = {
    bastion_host_name     = "dev-bastion1"
    location              = "centralus"
    resource_group_name   = "dev-rg1"
    ip_configuration_name = "dev-ipconfig1"
    subnet_name           = "dev-snet1"
    virtual_network_name  = "dev-vnet1"
    public_ip_name        = "dev-pip1"
  }
}

application_gateways = {
  "aap_gateway1" = {
    application_gateway_name = "dev-aapgateway1"
    resource_group_name      = "dev-rg1"
    location                 = "centralus"
    subnet_name              = "dev-snet1"
    virtual_network_name     = "dev-vnet1"
    public_ip_name           = "dev-pip1"

    sku_name     = "Standard_v2"
    sku_tier     = "Standard_v2"
    sku_capacity = 2


    gateway_ip_configuration = [{
      name = "dev-gatewayipconfig1"
    }]
    frontend_port = [{
      name = "dev-frontendport1"
      port = 80
    }]
    frontend_ip_configuration = [{
      name = "dev-frontendipconfig1"
    }]
    backend_address_pool = [{
      name = "dev-backendaddresspool1"
    }]
    backend_http_settings = [{
      name                  = "dev-backendhttpsettings1"
      cookie_based_affinity = "Disabled"
      path                  = "/"
      port                  = 80
      protocol              = "Http"
      request_timeout       = 20
    }]
    http_listener = [{
      name                           = "dev-httplistener1"
      frontend_ip_configuration_name = "dev-frontendipconfig1"
      frontend_port_name             = "dev-frontendport1"
      protocol                       = "Http"
    }]

    request_routing_rule = [{
      name                       = "dev-requestroutingrule1",
      priority                   = 100,
      rule_type                  = "Basic",
      http_listener_name         = "dev-httplistener1",
      backend_address_pool_name  = "dev-backendaddresspool1",
      backend_http_settings_name = "dev-backendhttpsettings1",
    }]
  }
}

load_balancer = {
  "lb1" = {
    loadbalancer_name    = "dev-lb1"
    location             = "centralus"
    resource_group_name  = "dev-rg1"
    sku                  = "Standard"
    subnet_name          = "dev-snet1"
    virtual_network_name = "dev-vnet1"
    public_ip_name       = "dev-pip1"
    frontend_ip_configurations = [{
      name                          = "dev-frontendipconfig1"
      private_ip_address_allocation = "Dynamic"
    }]
  }
}

vmss_configs = {
  "vmss1" = {
    vmss_name            = "dev-vmss1"
    location             = "centralus"
    resource_group_name  = "dev-rg1"
    vmss_sku             = "Standard_DS1_v2"
    instances            = 2
    computer_name_prefix = "devvmss"

    image_publisher = "Canonical"
    image_offer     = "UbuntuServer"
    image_sku       = "18.04-LTS"
    image_version   = "latest"

    os_disk_storage_account_type = "Standard_LRS"
    os_disk_caching              = "ReadWrite"

    nic_name    = "dev-nic1"
    nic_primary = true

    ip_configuration_name    = "dev-ipconfig1"
    ip_configuration_primary = true

    subnet_name          = "dev-snet1"
    virtual_network_name = "dev-vnet1"
    load_balancer_name   = "dev-lb1"
    key_vault_name       = "dev-keyvault1"
    au_name              = "admin_username"
    ap_name              = "admin_password"
  }
  "vmss2" = {
    vmss_name            = "dev-vmss2"
    location             = "centralus"
    resource_group_name  = "dev-rg1"
    vmss_sku             = "Standard_DS1_v2"
    instances            = 2
    computer_name_prefix = "devvmss"

    image_publisher = "Canonical"
    image_offer     = "UbuntuServer"
    image_sku       = "18.04-LTS"
    image_version   = "latest"

    os_disk_storage_account_type = "Standard_LRS"
    os_disk_caching              = "ReadWrite"

    nic_name    = "dev-nic1"
    nic_primary = true

    ip_configuration_name    = "dev-ipconfig1"
    ip_configuration_primary = true

    subnet_name          = "dev-snet2"
    virtual_network_name = "dev-vnet1"
    load_balancer_name   = "dev-lb1"
    key_vault_name       = "dev-keyvault1"
    au_name              = "admin_username"
    ap_name              = "admin_password"
  }
}
