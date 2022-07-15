provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "remote" {
    hostname="app.terraform.io"
    organization = "iwinner"
    workspaces {
      name="getting-started"
    }
  }
  
}
## Project
