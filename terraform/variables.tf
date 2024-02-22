variable "project_id" {
  type        = string
  description = "The project ID to deploy to"
}

variable "permissions" {
  type        = map(set(string))
  description = "Permissions for the role"
}
