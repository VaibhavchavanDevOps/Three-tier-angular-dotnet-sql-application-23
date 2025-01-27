output "sql_instance_name" {
  description = "The name of the SQL instance"
  value       = module.cloud_sql.sql_instance_name
}

output "sql_instance_public_ip" {
  description = "The public IP address of the SQL instance"
  value       = module.cloud_sql.sql_instance_public_ip
}