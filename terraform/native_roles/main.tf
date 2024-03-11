### NATIVE ROLES ASSIGNATION
module "assign-native-roles" {
  source   = "../modules/iam_roles/assign_role"
  for_each = var.nativeRoles

  project_id = var.projectId
  roles      = each.value
  team       = each.key
  domain     = var.domain
}
