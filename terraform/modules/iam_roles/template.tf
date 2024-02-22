### TEMPLATE ###

# resource "google_project_iam_custom_role" "team-custom-role" {
#   role_id     = "team-custom-role"
#   title       = this.role_id
#   description = "Custom role for X Team"
#   permissions = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
# }
#
# output "dev-infra-role" {
#   value = google_project_iam_custom_role.dev-infra-custom-role.role_id
# }
