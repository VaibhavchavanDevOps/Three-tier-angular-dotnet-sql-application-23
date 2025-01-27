resource "google_sql_database_instance" "instance" {
  name             = "sqlserver-instance"
  region           = "us-central1"
  database_version = "SQLSERVER_2019_STANDARD"
  root_password    = "vaibhavchavan"

  settings {
    tier = "db-custom-2-7680"

    ip_configuration {
      ipv4_enabled = true

      authorized_networks {
        name  = "AllowPublicAccess"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = false
}
output "sql_instance_name" {
  description = "The name of the SQL instance"
  value       = google_sql_database_instance.instance.name
}

output "sql_instance_public_ip" {
  description = "The public IP address of the SQL instance"
  value       = google_sql_database_instance.instance.public_ip_address
}