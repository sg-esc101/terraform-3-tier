resource "aws_instance" "test-instance-osaka" {
    ami = var.ami_id_osaka
    instance_type = var.instance_type
    tags = {
        Name = "test-instance-osaka"
    }
    provider = aws.osaka
}

resource "aws_instance" "test-instance-mumbai" {
    ami = var.ami_id_mumbai
    instance_type = var.instance_type
    tags = {
        Name = "test-instance-mumbai"
    }
##will use default provider which is in providers.tf mumbai region
}