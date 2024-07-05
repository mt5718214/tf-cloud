terraform {
  required_providers {
    google = {
      # the google provider's source is defined as hashicorp/google, which is shorthand for registry.terraform.io/hashicorp/google
      source = "hashicorp/google"
      # set version, if not set terraform will always use the latest version of the provider
      version = "5.36.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  credentials = var.gcp_credentials
}

# resource "google_service_account" "default" {
#   account_id   = "my-custom-sa"
#   display_name = "Custom SA for VM Instance"
# }

resource "google_compute_instance" "test" {
  name         = "my-instance-test"
  machine_type = "n2-standard-2"
  zone         = var.zone

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  # service_account {
  #   # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  #   email  = google_service_account.default.email
  #   scopes = ["cloud-platform"]
  # }
}