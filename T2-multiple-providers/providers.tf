terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.51.0"
    }
    google = {
      source = "hashicorp/google"
      version = "7.37.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  alias  = "osaka"
  region = "ap-northeast-3"
}