### NATIVE ROLE ASSIGN
resource "google_project_iam_member" "assign-role" {
  for_each = var.roles

  project = var.project_id
  role    = each.key
  member  = "group:${var.team}${var.domain}"
}
