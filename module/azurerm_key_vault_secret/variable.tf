variable "key_vault_secret" {
    type = map(object({
        secret_name         = string
        secret_value        = string
        key_vault_name      = string
        resource_group_name = string
    }))
}