### PROVIDER CONFIG
provider "google" {
  project = var.projectId
}

### BACKEDN CONFIG FOR REMOTE TFSTATE (To be configured)
terraform {
  backend "gcs" {
    bucket = "j7ap-tfstate"

  }
}
