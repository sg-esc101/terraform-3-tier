# T2 — Errors & Concepts (simple notes)

> From failed `terraform init` — T2-multiple-providers

---

## Concepts I lagged

### 1. Three blocks — three jobs

Don't mix these up:

| Block | Job | Example |
|-------|-----|---------|
| `required_providers` | **Download** the plugin | `source`, `version` only |
| `provider` | **Configure** the plugin | `region`, `alias` |
| `resource` | **Create** something in the cloud | EC2, bucket, etc. |

**I put `region` in `required_providers` — wrong place.**  
Region goes in `provider`, not `required_providers`.

---

### 2. One AWS plugin, many regions = aliases

- You **cannot** name two providers `aws-mumbai` and `aws-osaka` in `required_providers`
- There is **one** AWS provider (`hashicorp/aws`) and **one version** per project
- To use 2 regions → same provider, different `alias`:

```hcl
provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "osaka"
  region = "ap-northeast-3"
}
```

In resources: `provider = aws.mumbai` (dot, not hyphen)

---

### 3. Resource names must be unique

```hcl
resource "aws_instance" "test-instance-1" { }  # first one — OK
resource "aws_instance" "test-instance-1" { }  # same name — ERROR
```

Each resource needs its **own name**:

```hcl
resource "aws_instance" "osaka" { }
resource "aws_instance" "mumbai" { }
```

---

### 4. One provider version per project

You **cannot** use AWS v5 in one region and v6 in another in the same folder.  
One Terraform project = one AWS provider version for all aliases.

---

## The errors

### Error 1 — Duplicate resource

```
Duplicate resource "aws_instance" configuration
Resource names must be unique per type in each module.
```

**Fix:** Use different names (`osaka`, `mumbai`).

---

### Error 2 — region in required_providers

```
required_providers objects can only contain "version", "source" and
"configuration_aliases" attributes.
```

**Fix:** Move `region` to `provider` blocks.

---

## Correct structure (copy this pattern)

```hcl
# providers.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.51.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 6.51.0"
    }
  }
}

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "osaka"
  region = "ap-northeast-3"
}

provider "google" {
  region = "us-central1"
}
```

```hcl
# main.tf
resource "aws_instance" "osaka" {
  ami           = "ami-xxx"
  instance_type = "t3.micro"
  provider      = aws.osaka
}

resource "aws_instance" "mumbai" {
  ami           = "ami-xxx"
  instance_type = "t3.micro"
  provider      = aws.mumbai
}
```

---

## Quick map

```
required_providers  →  download aws + google plugins
provider blocks     →  set region (use alias for 2nd AWS region)
resource blocks     →  create stuff (unique names, pick provider)
```

---

## Before next init — checklist

- [ ] `required_providers` = `source` + `version` only
- [ ] `region` is inside `provider` blocks
- [ ] Two AWS regions = two `provider "aws"` blocks with different `alias`
- [ ] Each resource has a unique name
- [ ] Use `provider = aws.mumbai` (dot syntax)

```bash
terraform init
terraform validate
terraform plan
```
