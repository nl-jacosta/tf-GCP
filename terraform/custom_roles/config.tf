### PROVIDER CONFIG
provider "google" {
  project = var.projectId
}

### BACKEDN CONFIG FOR REMOTE TFSTATE (To be configured)
terraform {
  backend "gcs" {
    # bucket = "UBS-${var.stage}-tfstate" this value needs to be set in command time -backend-config="bucket=UBS-${var.stage}-tfstate"
    prefix = "terraform/state"
  }
}
