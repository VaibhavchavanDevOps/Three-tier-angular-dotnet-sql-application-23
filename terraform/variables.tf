variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
  default     = "my-project-dotnet-445205"
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

variable "gke_cluster_name" {
  description = "GKE Cluster name"
  type        = string
  default     = "my-gke-cluster"
}

variable "vm_instance_name" {
  description = "VM instance name"
  type        = string
  default     = "my-vm-instance-1"
}

variable "cloud_sql_instance_name" {
  description = "Cloud SQL instance name"
  type        = string
  default     = "my-cloud-sql-instance"
}

variable "db_username" {
  description = "Cloud SQL admin username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Cloud SQL admin password"
  type        = string
  default     = "vaibhavchavan"
}

variable "node_count" {
  description = "Number of nodes for GKE"
  type        = number
  default     = 3
}

variable "email" {
    description = "the service account email"
    type        =  string
    default     = "901521198393-compute@developer.gserviceaccount.com"
}