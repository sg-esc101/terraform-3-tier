# -----------------------------------------------------------------------------
# EC2 INSTANCE CONFIGURATION
# Maintained by: Central Infra Team
# Best Practice: This block relies entirely on variables to remain strictly 
# provider-agnostic. It will inherit the region and account configuration 
# dynamically from the application team's root module.
# -----------------------------------------------------------------------------
resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags          = var.tags
  
  # Note: Terraform does not allow provider selection through variables.
  # Do not hardcode or alias providers here; let the root module handle it.
  # provider = variable.provider
}