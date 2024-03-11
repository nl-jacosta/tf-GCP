variable "project_id" {
  type        = string
  description = "Project ID"
}

variable "roles" {
  type        = set(string)
  description = "List of native roles to assign"
}

variable "team" {
  type        = string
  description = "Team's name that will use this role in module"
}

variable "domain" {
  type        = string
  description = "Domain for user groups"
}
