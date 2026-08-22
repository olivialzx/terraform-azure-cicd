resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = var.environment
    project     = "contoso-retail"
    managed_by  = "terraform"
  }
}
module "networking" {
  source = "../../modules/networking"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  vnet_name          = "vnet-contoso-dev"
  vnet_address_space = ["10.10.0.0/16"]

  frontend_subnet_name           = "FrontendSubnet"
  frontend_subnet_address_prefix = "10.10.0.0/24"

  backend_subnet_name           = "BackendSubnet"
  backend_subnet_address_prefix = "10.10.1.0/24"
}
module "compute" {
  source = "../../modules/compute"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  subnet_id = module.networking.backend_subnet_id

  vm_name        = "vm-contoso-dev"
  vm_size        = "Standard_D2s_v3"
  admin_username = "azureuser"
}

module "storage" {
  source = "../../modules/storage"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  storage_account_name = "contosodevstorage2026"
  container_name       = "app-data"
}

module "monitoring" {
  source = "../../modules/monitoring"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  workspace_name = "contoso-dev-monitoring"
}