provider aws {
access_key=""
secret_key=""
region="us-east-1"
}
resource "aws_instance" "example"{
ami = "ami-049394993"
instance_type ="t2.mcro"
count = "2"
}