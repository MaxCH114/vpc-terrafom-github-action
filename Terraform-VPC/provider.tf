terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Specifies the AWS provider version
    }
  }

  backend "s3" {
    bucket = "my-terraform-backen"  # Name of the S3 bucket
    key    = "max/terraform.tfstate"  # Path to the state file inside the bucket
    region = "us-east-1"  # AWS region where the S3 bucket is located
  }
}