resource "azurerm_resource_group" "vmss_rg" {
  for_each = var.resource_groups
  name     = each.value.resource_group_name
  location = each.value.location

}

