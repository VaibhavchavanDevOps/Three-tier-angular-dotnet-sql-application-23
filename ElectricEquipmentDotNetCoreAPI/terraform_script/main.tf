variable "project_id" {
  description = "google project id"
  type        = string
  default     = "poc-cluster-443705"
}

variable "region" {
  description = "The region for resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone for resources"
  type        = string
  default     = "us-central1-a"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  default     = "10.0.0.0/24"
}

variable "firewall_ports" {
  description = "Ports to allow through the firewall"
  type        = list(string)
  default     = ["80", "81", "9000", "8080", "1433"]
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "vpc-network"
}

variable "gke_cluster_name" {
  description = "GKE cluster name"
  type        = string
  default     = "my-gke-cluster"
}

variable "node_count" {
  description = "Number of nodes for GKE cluster"
  default     = 2

}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "subnet"
}

variable "email" {
  description = "The name of the subnet"
  type        = string
  default     = "451744325647-compute@developer.gserviceaccount.com"
}

variable "sql_root_password" {
  description = "The root password for the Cloud SQL instance"
  type        = string
  default     = "vaibhavchavan"
}vrchavan02@base:~/terraform_script$ ls
Jenkinsfile  key.json  modules    provider.tf        terraform.tfstate.backup  update_all.py     variables.tf
README.md    main.tf   output.tf  terraform.tfstate  update.py                 update_secret.py
vrchavan02@base:~/terraform_script$ cat output.tf 
output "sql_instance_name" {
  description = "The name of the SQL instance"
  value       = module.cloud_sql.sql_instance_name
}

output "sql_instance_public_ip" {
  description = "The public IP address of the SQL instance"
  value       = module.cloud_sql.sql_instance_public_ip
}vrchavan02@base:~/terraform_script$ ls
Jenkinsfile  key.json  modules    provider.tf        terraform.tfstate.backup  update_all.py     variables.tf
README.md    main.tf   output.tf  terraform.tfstate  update.py                 update_secret.py
vrchavan02@base:~/terraform_script$ cat main.tf 
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