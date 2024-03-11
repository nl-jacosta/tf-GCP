variable "project_id" {
  type        = string
  description = "Project ID"
}

variable "permissions" {
  type        = set(string)
  description = "Permissions for the role"
}

variable "team" {
  type        = string
  description = "Team's name that will use this role in module"
}

variable "domain" {
  type        = string
  description = "Domain for user groups"
}
