resource "google_project_iam_custom_role" "custom-role" {
  role_id     = "${var.team}CustomRole"
  title       = "${var.team} Custom Role"
  description = "Custom role created for ${var.team} in Terraform."
  permissions = var.permissions
}

resource "google_project_iam_member" "assign-role" {
  project = var.project_id
  role    = "roles/${google_project_iam_custom_role.custom-role.role_id}"
  member  = "group:${var.team}@ubersuggest.com"

  depends_on = [google_project_iam_custom_role.custom-role]
}
