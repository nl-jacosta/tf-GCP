### GROUPS AND PERMISSIONS

locals {
  # Map where the key is the GCP Group and the value is a set of permissions
  devCustomRoles = {
    Data-UBS-Development     = file("./roles/test")
    DevOps-UBS-Development   = file("./roles/test")
    Backend-UBS-Development  = file("./roles/test")
    Frontend-UBS-Development = file("./roles/test")
    QA-UBS-Development       = file("./roles/test")
  }

  prodCustomRoles = {
    Data-UBS-Production     = file("./roles/test")
    DevOps-UBS-Production   = file("./roles/test")
    Backend-UBS-Production  = file("./roles/test")
    Frontend-UBS-Production = file("./roles/test")
    QA-UBS-Production       = file("./roles/test")
  }
}
