provider "google"{
credentials= file("../welcome.json")
project ="iwinner-jobs"
region="east-us2"
zone ="east-a"
version="3.3"
}

resource "google_storage_bucket" "COLDLINE"{
name="akfkafka"
storage_class= "COLDLINE"
location="asia"
}