## Example

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.51"
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

resource "aws_instance" "mumbai" {
  ami           = "ami-xxx"
  instance_type = "t3.micro"
}

resource "aws_instance" "osaka" {
  provider      = aws.osaka
  ami           = "ami-xxx"
  instance_type = "t3.micro"
}
```

## Mental Model

```text
Terraform
    ↓
Downloads Provider Plugin

Provider Block
    ↓
Configures Provider

Alias
    ↓
Creates Multiple Provider Configurations

Resource
    ↓
Uses a Specific Provider Configuration
```
