# -----------------------------------------------------------------------------
# ROOT MODULE VARIABLES
# Maintained by: Application Team
# Best Practice: Do not hardcode environment-specific values or use a generic 
# terraform.tfvars file. Supply values dynamically at runtime based on your 
# target environment. 
#
# Example Usage:
# terraform plan -var-file="./environments/dev.tfvars"
# terraform apply -var-file="./environments/prod.tfvars"
# -----------------------------------------------------------------------------

variable "ami_id" {
  description = "The AMI ID for the target region. Value should be injected via an environment-specific .tfvars file."
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type. Value should be injected via an environment-specific .tfvars file."
  type        = string
}

variable "tags" {
  description = "A map of custom tags to apply to the resources (e.g., Environment, Project, Owner)."
  type        = map(string)
  default     = {}
}