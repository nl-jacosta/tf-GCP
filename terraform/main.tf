
module "custom-roles" {
  for_each = local.permissions

  source      = "./modules/iam_roles"
  project_id  = var.project_id
  team        = each.key
  permissions = each.value
}
