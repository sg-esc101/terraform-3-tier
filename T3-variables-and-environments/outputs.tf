output "ami_id_osaka" {
    value = aws_instance.test-instance-osaka.ami
}

output "ami_id_mumbai" {
    value = aws_instance.test-instance-mumbai.ami
}
