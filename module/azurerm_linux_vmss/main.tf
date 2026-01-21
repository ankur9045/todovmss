resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
    for_each = var.vmss_configs
  name                 = each.value.vmss_name
  resource_group_name  = each.value.resource_group_name
  location             = each.value.location
  sku                  = each.value.vmss_sku
  instances            = each.value.instances
  admin_username       = data.azurerm_key_vault_secret.admin_username[each.key].value
  admin_password       = data.azurerm_key_vault_secret.admin_password[each.key].value
  computer_name_prefix = each.value.computer_name_prefix

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }

  os_disk {
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
  }

  network_interface {
    name    = each.value.nic_name
    primary = each.value.nic_primary

    ip_configuration {
      name      = each.value.ip_configuration_name
      primary   = each.value.ip_configuration_primary
      load_balancer_inbound_nat_rules_ids = [data.azurerm_lb.lb_id[each.key].id]
      subnet_id = data.azurerm_subnet.subnet_id[each.key].id
    }
  }
}


    