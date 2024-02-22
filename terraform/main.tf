
module "custom-roles" {
  source = "./modules/iam_roles"
}

### TEMPLATE ###

# resource "google_project_iam_member" "team" {
#   project = var.project_id
#   role    = "roles/${module.custom-roles.team}"
#   member  = "group:team@ubersuggest.com"
#
#   depends_on = [module.custom-roles]
# }

resource "google_project_iam_member" "dev-infra" {
  project = var.project_id
  role    = "roles/${module.custom-roles.dev-infra-role}"
  member  = "group:devinfra-team@ubersuggest.com"

  depends_on = [module.custom-roles]
}
