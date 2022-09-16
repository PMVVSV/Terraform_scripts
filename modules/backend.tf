provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
    default_tags {
    tags = {
      Env = "${var.environment}"
    }
  }
}

data "aws_availability_zones" "azs" {
    state = "available"
}

resource "aws_s3_bucket" "terraform_state_s3_bucket" {
    bucket = "sirius-state"
 
    versioning {
      enabled = true
    }
 
    lifecycle {
      prevent_destroy = false
    }
 
    tags = {
      Name = "Terraform State File Storage"
    }      
}


terraform {
 backend "s3" {
 bucket = "sirius-state"
 key = "terraform.tfstate"
 region = "ap-south-1"
 }
}