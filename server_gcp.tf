provider "google" {
  project     = "techlanders-nov2024" # Replace with your GCP project ID
  region      = "europe-west4"
  zone        = "europe-west4-a"
}

resource "google_compute_instance" "mygcpserver" {
  name         = "raman-devops-batch-server"
  machine_type = "e2-micro"

  metadata = {
    ssh-keys = "${var.user}:${file(var.publickeypath)}"
  }

  tags = ["env-production", "owner-raman"]

  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20230509" # Corrected quotation marks
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral public IP
    }
  }

  labels = {
    owner = "raman"
    env   = "production"
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "The server's IP address is ${self.network_interface[0].access_config[0].nat_ip}" && \
      echo "${self.network_interface[0].access_config[0].nat_ip}" > /tmp/inv
    EOT
  }
}






variable "user" {
    type = string
    default= "admin"
}
variable "privatekeypath" {
    type = string
    default = "~/.ssh/id_rsa"
}
variable "publickeypath" {
    type = string
    default = "~/.ssh/id_rsa.pub"
}


