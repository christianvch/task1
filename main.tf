resource "google_container_cluster" "gke-cluster" {
  project     = "${var.project_name}"
  location    = "${var.region}"
  name = "gke-challenge"
  node_locations = [
    "${var.zone}"
  ]
  remove_default_node_pool = true
  initial_node_count = 1
}

resource "google_container_node_pool" "gke-node-pool" {
  name = "gke-challenge"
  project     = "${var.project_name}"
  location    = "${var.region}"
  cluster = google_container_cluster.gke-cluster.name
  node_count = 1

  node_config {
    machine_type = "${var.machine_type}"
    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      app = "gke"
    }
  }
}
