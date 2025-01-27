resource "google_container_cluster" "primary" {
  name               = "my-cluster"
  location           = var.zone
  initial_node_count = 2
  node_config {
    service_account = var.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      foo = "bar"
    }
    tags = ["foo", "bar"]
  }
  network = var.network_name
  subnetwork = var.subnet_name
  timeouts {
    create = "30m"
    update = "40m"
  }
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}