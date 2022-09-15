variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "AWS profile"
  type        = string
  default     = "terraform-training"
}

variable "project" {
  description = "Terraform Training project"
  type        = string
  default     = "terraform-training"
}