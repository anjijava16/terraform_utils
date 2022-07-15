# terraform_utils
terraform_utils for IAC Infrastructure as Code

# Terraform arch diagram
![image](https://user-images.githubusercontent.com/5849522/179147760-5191772f-64ba-49f5-bb33-f1e3eb79e7f3.png)

![image](https://user-images.githubusercontent.com/5849522/179147798-b6efa455-dc57-4282-8128-bac1517809ed.png)


# Certificate URL
1. https://www.hashicorp.com/certification/terraform-associate



## Commands used in the Course

### initialize

    terraform init

### preview terraform actions

    terraform plan

### apply configuration with variables

    terraform apply -var-file terraform-dev.tfvars

### destroy a single resource

    terraform destroy -target aws_vpc.myapp-vpc

### destroy everything fromtf files

    terraform destroy

### show resources and components from current state

    terraform state list

### show current state of a specific resource/data

    terraform state show aws_vpc.myapp-vpc    

### set avail_zone as custom tf environment variable - before apply

    export TF_VAR_avail_zone="eu-west-3a"


