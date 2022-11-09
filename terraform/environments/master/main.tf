provider "google" {
    project ="new-project-41941"
    region="us-central1"
    zone="us-central1-c"
}

# Create a single Compute Engine instance
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-c"
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"
  }
  allow_stopping_for_update = "true"
}