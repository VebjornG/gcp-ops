terraform {
  backend "gcs" {
    bucket = "gcp-ops-terraform-state"
    prefix = "terraform/dev/state"
  }
}