### CUSTOM ROLE CREATION
resource "google_project_iam_custom_role" "custom-role" {
  role_id     = "${var.team}CustomRole"
  title       = "${var.team}CustomRole"
  description = "Custom role created for ${var.team} in Terraform."
  permissions = var.permissions
}

### CUSTOM ROLE ASSIGN
resource "google_project_iam_member" "assign-role" {
  project = var.project_id
  role    = "projects/${var.project_id}/roles/${var.team}CustomRole"
  member  = "group:${var.team}${var.domain}"

  depends_on = [google_project_iam_custom_role.custom-role]
}
