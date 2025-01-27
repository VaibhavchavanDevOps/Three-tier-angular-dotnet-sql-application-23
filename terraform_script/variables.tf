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