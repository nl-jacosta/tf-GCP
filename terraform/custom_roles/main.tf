### CUSTOM ROLE CREATION AND ASSIGN DEPENDING ON THE STAGE
module "custom-roles" {
  source   = "../modules/iam_roles/custom_role"
  for_each = var.stage == "production" ? local.prodCustomRoles : local.devCustomRoles

  project_id  = var.projectId
  team        = each.key
  domain      = var.domain
  permissions = each.value
}
