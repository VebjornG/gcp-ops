# Create a project for the app
resource "google_project" "app_project" {
  name       = "App Project"
  project_id = var.app_project_id
}

module "networking" {
  source         = "../../modules/networking"  # Path to networking module
  project_id     = var.network_project_id
  network_name   = var.network_name
  #subnet_names   = var.subnet_names  # List of subnet names
}

resource "google_compute_instance" "test_vm" {
    name         = "test-vm"
    machine_type = var.vm_instance_type # e2-micro
    zone         = "europe-west1-b"
    project      = var.app_project_id
    boot_disk {
        initialize_params {
        image = "debian-cloud/debian-9"
        }
    }
    network_interface {
        network = module.networking.network_name
        #subnetwork = module.networking.subnet_names[0]
        access_config {}  # Enables external IP (for testing)
    }
}