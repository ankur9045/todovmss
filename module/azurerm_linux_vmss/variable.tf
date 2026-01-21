
variable "vmss_configs" {
  type = map(object({
    vmss_name                    = string
    resource_group_name          = string
    location                     = string
    vmss_sku                     = string
    instances                    = number
    computer_name_prefix         = string

    image_publisher              = string
    image_offer                  = string
    image_sku                    = string
    image_version                = string

    os_disk_storage_account_type = string
    os_disk_caching              = string

    nic_name                     = string
    nic_primary                  = bool

    ip_configuration_name        = string
    ip_configuration_primary     = bool

    subnet_name                  = string
    virtual_network_name         = string
    load_balancer_name           = string
    key_vault_name               = string
    au_name                      = string
    ap_name                      = string
  }))
}
