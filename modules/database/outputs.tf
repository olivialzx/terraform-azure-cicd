output "sql_server_name" {
  description = "SQL logical server name"
  value       = azurerm_mssql_server.main.name
}

output "sql_server_id" {
  description = "SQL logical server ID"
  value       = azurerm_mssql_server.main.id
}

output "database_name" {
  description = "SQL database name"
  value       = azurerm_mssql_database.main.name
}

output "fully_qualified_domain_name" {
  description = "SQL server fully qualified domain name"
  value       = azurerm_mssql_server.main.fully_qualified_domain_name
}