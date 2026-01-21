resource "azurerm_key_vault_secret" "key_secret" {
  for_each     = var.key_vault_secret
  name         = each.value.secret_name
  value        = each.value.secret_value
  key_vault_id = data.azurerm_key_vault.key_vault_id[each.key].id
}

