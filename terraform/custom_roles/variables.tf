variable "projectId" {
  type        = string
  description = "The project ID to deploy to"
}

variable "stage" {
  type        = string
  description = "Current UBS environment"
}

variable "domain" {
  type        = string
  description = "Domain for user groups"
  default     = "@ubersuggest.com"
}
