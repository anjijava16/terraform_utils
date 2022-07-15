provider "aws" {
  region = "us-east-1"
}

# resource "aws_instance" "aws_linux_server" {
#   ami = data.aws_ami.windows.id
#   instance_type = "t2.micro"
# }

# resource "aws_instance" "linux_welcome_server" {
#   ami="ami-0022f774911c1d690"
#   instance_type = "t2.micro"
#   tags = {
#     "env" = "dev",
#     "created_by"="anji"
#   }
# }

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}