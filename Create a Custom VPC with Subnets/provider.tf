terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  //backen to s3
  backend "s3" {
    bucket = "my-terraform-backen"
    key    = "Dev/terraform.tfstate"
    region = "us-east-1"
  }

}
provider "aws" {
  region = var.region
}
