# ==============================================================================
# MODULE PROVIDER DEPENDENCIES (Maintained by Central Infra Team)
# ==============================================================================
# This block establishes the strict provider version floor/ceiling for the module.
# It explicitly omits runtime settings (regions, credentials) to ensure 100% reuse.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.51.0" # Enforced AWS version baseline
    }
    google = {
      source  = "hashicorp/google"
      version = "7.37.0" # Enforced GCP version baseline
    }
  }
}

# ==============================================================================
# ARCHITECTURAL GUARDRAIL: DO NOT CONFIGURE PROVIDERS HERE
# ==============================================================================
# Target regions, profiles, and authentication must be passed down dynamically 
# from the calling root module. Uncommenting the blocks below breaks multi-region reuse.

# provider "aws" {
#   region = "ap-south-1"
# }

# provider "aws" {
#   alias  = "osaka"
#   region = "ap-northeast-3"
# }