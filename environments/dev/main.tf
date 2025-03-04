module "networking" {
  source         = "../../modules/networking"  # Path to networking module
  project_id     = var.project_id
  network_name   = var.network_name
  #subnet_names   = var.subnet_names  # List of subnet names
}

resource "google_compute_instance" "test_vm" {
    name         = "test-vm"
    machine_type = "e2-micro"
    zone         = "europe-west1-b"
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