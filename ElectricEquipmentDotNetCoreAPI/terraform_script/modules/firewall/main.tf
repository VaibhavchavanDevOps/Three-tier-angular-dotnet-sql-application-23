resource "google_compute_firewall" "allow_http_https" {
  name    = "allow-http-https"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = var.allowed_ports
  }

  source_ranges = ["0.0.0.0/0"]
}

output "firewall_name" {
  value = google_compute_firewall.allow_http_https.name

}