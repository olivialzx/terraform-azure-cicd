terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstatecontoso2026"
    container_name       = "tfstate"
    key                  = "contoso-dev.tfstate"
  }
}