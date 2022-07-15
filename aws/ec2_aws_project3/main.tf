
# 1. Create VPC 
resource "aws_vpc" "prod-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Production"
  }
}

# resource "random_id" "id_num" {
  
  
# }
# 2. Create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "Prod"
  }
}

# 3. Create Custom Route Table

resource "aws_route_table" "prod-route" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "prod"
  }
}
# 4. Create a subnet
resource "aws_subnet" "subnet-1" {
    vpc_id = aws_vpc.prod-vpc.id
    # cidr_block = "10.0.1.0/24"
    cidr_block = var.subnet_prefix
  availability_zone = "us-east-1a"
  tags = {
    Name = "prod-subnet"
  }
}

# 5. Associate subnet with Route table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.prod-route.id
}
# 6. Create Security Group to allow 80,80,443

resource "aws_security_group" "allow_webs" {
  name        = "allow_web_traic"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    # cidr_blocks      = [aws_vpc.main.cidr_block]
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
   #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    # cidr_blocks      = [aws_vpc.main.cidr_block]
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
   #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    # cidr_blocks      = [aws_vpc.main.cidr_block]
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
   #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
# 7. Create a network interace with an ip n the subnet that was created step 4
resource "aws_network_interface" "web_network_interface" {
  subnet_id       = aws_subnet.subnet-1.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_webs.id]

#   attachment {
#     instance     = aws_instance.test.id
#     device_index = 1
#   }
}
# 8. Assign an Elastic IP to the network interface created in step 7
resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.web_network_interface.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [aws_internet_gateway.gw]
#  depends_on = aws_internet_gateway.gw
  
}
# 9. create ubntu server and install /enable apache2
resource "aws_instance" "ubuntu_instance" {
  ami = "ami-09d56f8956ab235b3"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  
  key_name = "welcome"
  
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.web_network_interface.id
  }


    user_data=<<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo bash -c 'echo yours first web server >  /var/www/html/index.html'
        EOF
    tags={
            Name="we server"
        }

}



# 10. create AWS bucket 
# 11. Push logs files bucket 
