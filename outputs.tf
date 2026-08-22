output "resource_group_name" {
  description = "Name of the Terraform resource group"
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Location of the Terraform resource group"
  value       = azurerm_resource_group.main.location
}

output "vm_name" {
  description = "Backend VM name"
  value       = module.compute.vm_name
}

output "public_ip_address" {
  description = "Backend VM public IP address"
  value       = module.compute.public_ip_address
}
output "storage_account_name" {
  description = "Storage Account name"
  value       = module.storage.storage_account_name
}

output "storage_container_name" {
  description = "Blob container name"
  value       = module.storage.container_name
}

output "sql_server_name" {
  description = "SQL server name"
  value       = module.database.sql_server_name
}

output "database_name" {
  description = "SQL database name"
  value       = module.database.database_name
}

output "sql_server_fqdn" {
  description = "SQL server FQDN"
  value       = module.database.fully_qualified_domain_name
}

output "monitoring_workspace_name" {
  description = "Log Analytics workspace name"
  value       = module.monitoring.workspace_name
}

output "monitoring_workspace_id" {
  description = "Log Analytics workspace ID"
  value       = module.monitoring.workspace_id
}