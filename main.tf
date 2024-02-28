terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "google" {
  credentials = file("red-seeker-402716-bbcddac39cc7.json")
  project     = "red-seeker-402716"
  region      = "us-central1"  # Replace with your desired region
}

rresource "google_compute_instance" "app_server" {
  name         = "example-app-server"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20220720"
    }
  }

  network_interface {
    network = "default"
  }

  tags = ["example-app-server"]
}


