terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.57.0"

        }
        
    }
}
provider "azurerm" {
    features {}
    subscription_id = "722e98bb-a107-4d7c-8537-ba8c2f35547f"
}