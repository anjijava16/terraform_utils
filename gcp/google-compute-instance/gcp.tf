resource "google_compute_instance" "appserver" {
    name="iwinner-terraformserver"
    machine_type = "f1-micro"
    zone = "us-east1-b"  
    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-9"
        # labels = for_each ={
        #     "key" = "terraform",
        #     "env"="dev"
        # }
      }

    }
    network_interface {
      network = "default"
    }
}

