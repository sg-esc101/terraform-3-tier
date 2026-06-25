# -----------------------------------------------------------------------------
# INPUT VARIABLES
# Maintained by: Central Infra Team
# Best Practice: Do not provide default values for critical infrastructure 
# attributes (like AMI or Instance Type). This forces the application teams 
# to explicitly define their requirements in the root module.
# -----------------------------------------------------------------------------

variable "ami_id" {
  description = "The AMI ID to provision. Must be explicitly provided by the calling module and valid for the target region."
  type        = string
  # No default value provided. Deployment will fail if the caller does not supply this.
}

variable "instance_type" {
  description = "The EC2 instance type. Restricted to team-approved sizes."
  type        = string
  
  # Validation enforced by Infra Team to control costs and standardize deployments.
  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Invalid instance type. Allowed values are: t3.micro, t3.small, or t3.medium."
  }
  # No default value provided to ensure the caller explicitly chooses the size.
}

variable "tags" {
  description = "A map of custom tags to append to the resources created by this module."
  type        = map(string)
  default     = {}
}

# -----------------------------------------------------------------------------
# UNSUPPORTED CONFIGURATIONS
# -----------------------------------------------------------------------------

# Note: Terraform does not allow passing providers dynamically as string variables.
# Do not attempt to pass provider aliases here. Application teams must use the 
# `providers` meta-argument when calling this module.
# 
# variable "provider" {
#   description = "which provider u want to use, default is mumbai"
#   type = string
# }