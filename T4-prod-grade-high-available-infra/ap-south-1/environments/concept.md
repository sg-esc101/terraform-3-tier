# Terraform Multi-Environment Setup

## Goal

Use the **same Terraform code** for multiple environments:

* Dev
* Staging
* Prod

Only the values change.

---

## Directory Structure

```text
.
├── main.tf
├── variables.tf
├── backend.tf
└── environments/
    ├── dev.tfvars
    ├── prod.tfvars
    └── backend/
        ├── dev.conf
        └── prod.conf
```

---

## variables.tf

Defines what inputs Terraform expects.

```text
variables.tf
    ↓
What values do I need?
```

Example:

```hcl
variable "instance_type" {
  type = string
}
```

---

## dev.tfvars

Development values.

```hcl
instance_type = "t2.micro"
```

## prod.tfvars

Production values.

```hcl
instance_type = "t3.micro"
```

Think:

```text
dev.tfvars
    ↓
Dev settings

prod.tfvars
    ↓
Prod settings
```

---

## Applying Dev

```bash
terraform apply \
  -var-file=environments/dev.tfvars
```

Result:

```text
Creates t2.micro instance
```

---

## Applying Prod

```bash
terraform apply \
  -var-file=environments/prod.tfvars
```

Result:

```text
Creates t3.micro instance
```

---

# Backend Configuration

Backend controls **where Terraform state is stored**.

## backend.tf

```hcl
terraform {
  backend "s3" {}
}
```

Think:

```text
backend.tf
    ↓
Use S3 for state storage
```

---

## dev.conf

```hcl
bucket = "terraform-state-bucket"
key    = "dev/terraform.tfstate"
```

## prod.conf

```hcl
bucket = "terraform-state-bucket"
key    = "prod/terraform.tfstate"
```

Think:

```text
dev.conf
    ↓
Store Dev state

prod.conf
    ↓
Store Prod state
```

---

## Initialize Dev Backend

```bash
terraform init \
  -backend-config=environments/backend/dev.conf
```

---

## Initialize Prod Backend

```bash
terraform init \
  -backend-config=environments/backend/prod.conf
```

---

# Easy Mental Model

```text
variables.tf
    ↓
What inputs are needed?

dev.tfvars / prod.tfvars
    ↓
What values should be used?

terraform apply -var-file=...
    ↓
Creates environment-specific resources
```

```text
backend.tf
    ↓
What backend should Terraform use?

dev.conf / prod.conf
    ↓
Where should state be stored?

terraform init -backend-config=...
    ↓
Initializes environment-specific state
```

---

# One-Line Summary

```text
.tfvars
    ↓
Changes resource values

.conf
    ↓
Changes state location
```
