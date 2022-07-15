output "server_output_ip" {
  value = aws_eip.one.public_ip
}

output "aws_instance_ips" {
    value = aws_instance.ubuntu_instance.private_ip
    
  
}