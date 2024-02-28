provider "google" {
  project = var.project_id
}

locals {
  devInfraRole = file("./modules/iam_roles/roles/devInfra")
  qaRole       = file("./modules/iam_roles/roles/qa")

  permissions = {
    devInfra = toset(split("\n", local.devInfraRole))
    qa       = toset(split("\n", local.qaRole))
  }
}
