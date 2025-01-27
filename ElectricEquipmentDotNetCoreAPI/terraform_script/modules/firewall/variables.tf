variable "project_id" {
  description = "The Google Cloud project ID"
  type        = string
  default     = "poc-cluster-443705"
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "allowed_ports" {
  description = "Ports to allow through the firewall"
  type        = list(string)
}