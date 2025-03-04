variable "network_project_id" {
  description = "GCP project ID for networking resources"
  type        = string
  default     = "shared-vpc"
}

variable "network_name" {
  description = "The name of the VPC network being created"
  type        = string
  default     = "shared-vpc-network"
}

variable "region" {
    description = "The region to create the VPC network in"
    type        = string
    default     = "europe-west1"
}

/* variable "subnets" {
  description = "The list of subnets being created"
  type = list(object({
    name                    = string
    ip_cidr_range           = string
    region                  = string
    private_ip_google_access = bool
    flow_logs_enabled       = bool
  }))
  default = [] # The default value is an empty list, but you can provide a list of objects to create subnets. 
  #It should contain the name, ip_cidr_range, region, private_ip_google_access, and flow_logs_enabled attributes.
} */

/* variable "firewall_rules" {
  description = "List of firewall rules to apply to the network"
  type = list(object({
    name                    = string
    description             = string
    direction               = string
    priority                = number
    ranges                  = list(string)
    source_tags             = list(string)
    source_service_accounts = list(string)
    target_tags             = list(string)
    target_service_accounts = list(string)
    allow = list(object({
      protocol = string
      ports    = list(string)
    }))
    deny = list(object({
      protocol = string
      ports    = list(string)
    }))
  }))
  default = []
}
 */
variable "service_project_ids" {
  description = "The project IDs to attach to the shared VPC"
  type        = list(string)
  default     = []
}