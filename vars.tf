variable "AWS_REGION" {
  description = "AWS region"
  default = "us-east-1"
}

variable "AWS_CLI_PROFILE" {
  description = "The profile configured for AWS cli"
  default     = "default"
}

variable "VPC_CIDR" {
  description = "Addresses range in VPC"
  default     = "172.30.0.0/16"
}

variable "ALB_TERMINATION_PROTECTION_ENABLED" {
  description = "If true, enables ALB Termination Protection"
  default     = false
  type        = bool
}

variable "ALB_HTTPS_CERTIFICATE" {
  description = "The certificate for ALB"
}

variable "DOMAIN_NAME" {
  description = "The domain name for Route53"
}

variable "ALB_DNS_RECORD_NAME" {
  description = "The record name for the ALB alias"
}