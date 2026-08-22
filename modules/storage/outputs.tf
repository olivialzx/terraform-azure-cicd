output "storage_account_name" {
  description = "Storage Account name"
  value       = azurerm_storage_account.main.name
}

output "storage_account_id" {
  description = "Storage Account resource ID"
  value       = azurerm_storage_account.main.id
}

output "container_name" {
  description = "Blob container name"
  value       = azurerm_storage_container.main.name
}