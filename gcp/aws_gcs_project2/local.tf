resource "local_file" "pet"{
filename="C:/Tech_Learn_welcome/Dev_OPS/IAC_teraform/files/pets.txt"
content="we love pets"
}


 #resource "aws_iam_user" "users"{
  #bucket ="iwinner-temp-mybs"

 #}
 resource "google_storage_bucket" "mybucket"{
 name="iwinner-temp-mybs"
 bucket ="iwinner-temp-mybs"

 }
