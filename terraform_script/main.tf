provider "google-beta" {
  project = var.project_id
  region  = var.region
}
module "vpc" {
  source     = "./modules/vpc"
  region     = var.region
  subnet_cidr = var.subnet_cidr
}

module "firewall" {
  source        = "./modules/firewall"
  project_id    = var.project_id
  network_name  = module.vpc.network_name
  allowed_ports = var.firewall_ports
}

module "cloud_sql" {
  source            = "./modules/cloud_sql"
  region            = var.region
  project_id   = var.project_id
}


module "gke" {
  source       = "./modules/gke"
  zone         = var.zone
  email        = var.email
  network_name = module.vpc.network_name
  subnet_name  = module.vpc.subnet_name
}
output "vpc_network_name" {
  value = module.vpc.network_name
}

output "subnet_name" {
  value = module.vpc.subnet_name
}

output "firewall_rule_name" {
  value = module.firewall.firewall_name
}

output "cloud_sql_instance_name" {
  description = "The name of the SQL instance"
  value       = module.cloud_sql.sql_instance_name
}

output "cloud_sql_instance_public_ip" {
  description = "The public IP address of the SQL instance"
  value       = module.cloud_sql.sql_instance_public_ip
}
