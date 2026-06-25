# -----------------------------------------------------------------------------
# MODULE OUTPUTS
# Maintained by: Central Infra Team
# Best Practice: Expose critical resource attributes back to the root module.
# This allows the application team to reference these values in other modules 
# (e.g., passing the EC2 ARN to an IAM policy or the IP to a DNS record).
# -----------------------------------------------------------------------------

output "ec2_public_ip" {
  description = "The public IP address assigned to the instance, if applicable."
  value       = aws_instance.ec2.public_ip
}

output "ec2_arn" {
  description = "The Amazon Resource Name (ARN) of the EC2 instance."
  value       = aws_instance.ec2.arn
}