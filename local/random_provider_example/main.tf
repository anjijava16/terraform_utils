resource "local_file" "welcome" {
  filename = "C:/Tech_Learn_welcome/Dev_OPS/IAC_teraform/files/onepets.txt"
  content = "Welcome to sample file "
}

resource "random_pet" "my-pet" {
  prefix = "Mr"
  separator = "."
  length = "1"
}