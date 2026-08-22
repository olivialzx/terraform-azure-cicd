variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "server_name" {
  description = "Azure SQL logical server name"
  type        = string
}

variable "database_name" {
  description = "Azure SQL database name"
  type        = string
}

variable "admin_username" {
  description = "SQL administrator username"
  type        = string
}

variable "admin_password" {
  description = "SQL administrator password"
  type        = string
  sensitive   = true
}