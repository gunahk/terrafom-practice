
provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "terraform-lock" {
    name           = "terraform_state"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "DynamoDB Terraform State Lock Table"
    }
}


terraform {
  backend "s3" {
    bucket         = "terraformfordemo"
    key            = "guna/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
  }
}
