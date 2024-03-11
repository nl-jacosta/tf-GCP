projectId = "npd-production"
stage     = "production"
nativeRoles = {
  "Data-UBS-Production"     = ["roles/viewer"]
  "DevOps-UBS-Production"   = ["roles/editor"]
  "Backend-UBS-Production"  = ["roles/viewer"]
  "Frontend-UBS-Production" = ["roles/viewer"]
  "QA-UBS-Production"       = ["roles/viewer"]
}
