variable "ami_id_osaka" {
  description = "AMI id for osaka"
  type = string
  default = "ami-0086ee55a149bd32e"
}

variable "ami_id_mumbai" {
  description = "AMI id for mumbai"
  type = string
  default = "ami-01a00762f46d584a1"
}

variable "instance_type" {
  description = "instance type"
  type = string
  default = "t3.micro"
}