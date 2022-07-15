resource "random_pet" "my_pet" {
  prefix = var.prefix[0]
  
}
resource "local_file" "welcome" {
  filename = "C:/Tech_Learn_welcome/Dev_OPS/IAC_teraform/files/petsssss.txt"
  content=var.file-content["statement1"]  
}

