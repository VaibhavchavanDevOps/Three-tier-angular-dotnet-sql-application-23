variable "zone" {
  description = "The Google Cloud zone"
  type        = string
  default     = "us-central1-a"
}

variable "email" {
  description = "Service account email for GKE"
  type        = string
  default     = "451744325647-compute@developer.gserviceaccount.com"
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}