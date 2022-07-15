resource "google_compute_instance" "app_server" {
  name="terraform-instance-network"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "${google_compute_network.vpc_network.self_link}"
    access_config {
      
    }
  
  }
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
  auto_create_subnetworks = "true"
}
