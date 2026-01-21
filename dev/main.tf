module "vmss_rg" {
  source              = "../module/azurerm_resource_group"
  resource_groups = var.resource_groups
 }

 module "vmss_sg" {
   source = "../module/azurerm_storage_account"
    depends_on = [ module.vmss_rg ]
   storage_accounts = var.storage_accounts
 }

 module "vmss_vnet" {
   source = "../module/azurerm_vnet"
    depends_on = [ module.vmss_rg ]
   vnets = var.vnets 
 }

 module "vmss_snet" {
   source = "../module/azurerm_subnet"
    depends_on = [ module.vmss_vnet ]
   subnets = var.subnets
 }

 module "vmss_pip" {
   source = "../module/azurerm_public_ip"
    depends_on = [ module.vmss_rg ]
   public_ip = var.public_ip
 }

 module "vmss_sql_server" {
  source = "../module/azurerm_mssql_server"
   depends_on = [ module.vmss_rg ]
   sql_servers = var.sql_servers
 }

 module "vmss_sql_data" {
   source = "../module/azurerm_mssql_database"
    depends_on = [ module.vmss_sql_server ]
   databases = var.databases
 }

 module "vmss_key_vault" {
   source = "../module/azurerm_key_vault"
    depends_on = [ module.vmss_rg ]
   key_vaults = var.key_vaults
 }

 module "vmss_key_secret" {
   source = "../module/azurerm_key_vault_secret"
    depends_on = [ module.vmss_key_vault ]
   key_vault_secret = var.key_vault_secret
 }

 module "vmss_bastion_host" {
   source = "../module/azurerm_bastion_host"
    depends_on = [ module.vmss_snet, module.vmss_pip ]
   bastion_hosts = var.bastion_hosts
 }

 module "vmss_app_gateway" {
  source = "../module/azurerm_application_gateway"
    depends_on = [ module.vmss_rg, module.vmss_snet, module.vmss_pip ]
   application_gateways = var.application_gateways
 }

 module "vmss_lb" {
  source = "../module/azurerm_loadbalancer"
   depends_on = [ module.vmss_rg ]
  load_balancer = var.load_balancer
   
 }

 module "vmss_linux" {
  source = "../module/azurerm_linux_vmss"
   depends_on = [ module.vmss_rg, module.vmss_snet, module.vmss_lb, ]
  vmss_configs = var.vmss_configs
 }