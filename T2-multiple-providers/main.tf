resource "aws_instance" "test-instance-osaka" {
    ami = "ami-0086ee55a149bd32e"
    instance_type = "t3.micro"
    tags = {
        Name = "test-instance-osaka"
    }
    provider = aws.osaka
}

resource "aws_instance" "test-instance-mumbai" {
    ami = "ami-01a00762f46d584a1"
    instance_type = "t3.micro"
    tags = {
        Name = "test-instance-mumbai"
    }
##will use default provider which is in providers.tf mumbai region
}