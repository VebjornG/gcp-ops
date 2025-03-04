variable "network_project_id" {
  description = "GCP project ID for networking resources"
  type        = string
  default     = "shared-vpc"
}

variable "network_name" {
  description = "The name of the VPC network being created"
  type        = string
  default     = "shared-vpc"
}

variable "app_project_id" {
  description = "GCP project ID for application resources"
  type        = string
  default     = "app-project"
}

variable "region" {
  description = "The region to create the VPC network in"
  type        = string
  default     = "europe-west1"
}

variable "vm_instance_type" {
  description = "The type of VM instance to create"
  type        = string
  default     = "e2-micro"
}
