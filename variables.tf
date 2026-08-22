variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}


variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be either dev or prod."
  }
}

variable "location" {
  description = "Azure region"
  type        = string
}
