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
