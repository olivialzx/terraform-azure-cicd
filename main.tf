resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = "production"
    project     = "contoso-retail"
    managed_by  = "terraform"
  }
}

module "networking" {
  source = "./modules/networking"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  vnet_name          = "vnet-contoso-production"
  vnet_address_space = ["10.0.0.0/16"]

  frontend_subnet_name           = "snet-frontend"
  frontend_subnet_address_prefix = "10.0.0.0/24"

  backend_subnet_name           = "snet-backend"
  backend_subnet_address_prefix = "10.0.1.0/24"
}

module "compute" {
  source = "./modules/compute"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  subnet_id = module.networking.backend_subnet_id

  vm_name        = "vm-contoso-backend"
  vm_size        = "Standard_D2s_v3"
  admin_username = "azureuser"
}

module "storage" {
  source = "./modules/storage"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  storage_account_name = "contosoterraformolivia"
  container_name       = "app-data"
}

module "database" {
  source = "./modules/database"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  server_name   = "contoso-sql-server-olivia"
  database_name = "contoso-production-db"

  admin_username = "sqladmin"
  admin_password = "ChangeMe123!SqlPassword"
}

module "monitoring" {
  source = "./modules/monitoring"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  workspace_name = "contoso-monitoring-olivia"
}