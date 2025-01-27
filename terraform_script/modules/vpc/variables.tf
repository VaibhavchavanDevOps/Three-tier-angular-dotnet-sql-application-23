variable "region" {
  description = "The Google Cloud region"
  type        = string
  default     = "us-central1"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}