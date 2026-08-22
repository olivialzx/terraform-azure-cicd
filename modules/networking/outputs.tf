output "vnet_id" {
  description = "Virtual network ID"
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.main.name
}

output "frontend_subnet_id" {
  description = "Frontend subnet ID"
  value       = azurerm_subnet.frontend.id
}

output "backend_subnet_id" {
  description = "Backend subnet ID"
  value       = azurerm_subnet.backend.id
}

output "backend_nsg_id" {
  description = "Backend network security group ID"
  value       = azurerm_network_security_group.backend.id
}