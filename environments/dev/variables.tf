variable "network_project_id" {
  description = "GCP project ID for networking resources"
  type        = string
  default     = "shared-vpc-network"
}

variable "app_project_id" {
  description = "GCP project ID for application resources"
  type        = string
  default     = "app-project"
}