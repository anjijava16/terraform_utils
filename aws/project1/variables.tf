#AMI Filter for Windows Server 2019 Base

data "aws_ami" "windows" {
     most_recent = true

     filter {
        name   = "name"
        values = ["Windows_Server-2019-English-Full-Base-*"]

 }

     filter {
       name   = "virtualization-type"
       values = ["hvm"]

 }

     owners = ["801119661308"] # Canonical

 }