output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "resource_group_location" {
  value = azurerm_resource_group.main.location
}

output "vm_name" {
  value = module.compute.vm_name
}

output "public_ip_address" {
  value = module.compute.public_ip_address
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "monitoring_workspace_name" {
  value = module.monitoring.workspace_name
}