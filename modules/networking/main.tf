/* locals {
  subnet_ids = { for subnet in google_compute_subnetwork.subnets : subnet.name => subnet.id }
}
 */

# Create the shared VPC network
resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.network_name
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

# Set up the shared VPC host project. This project will host the shared VPC network.
resource "google_compute_shared_vpc_host_project" "network_host" {
  project = var.project_id
}

/* # Create subnets as specified in the subnets variable
resource "google_compute_subnetwork" "subnets" {
  for_each                 = { for subnet in var.subnets : subnet.name => subnet }
  name                     = each.value.name
  ip_cidr_range            = each.value.ip_cidr_range
  region                   = each.value.region
  network                  = google_compute_network.vpc_network.id
  project                  = var.project_id
  private_ip_google_access = each.value.private_ip_google_access

  dynamic "log_config" {
    for_each = each.value.flow_logs_enabled ? [1] : []
    content {
      aggregation_interval = "INTERVAL_5_SEC"
      flow_sampling        = 0.5
      metadata             = "INCLUDE_ALL_METADATA"
    }
  }
} */