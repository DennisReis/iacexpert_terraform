provider "aws" {
  region = "us-east-1"
  version = "~>2.0"
}

terraform {
  backend "s3" {
    bucket         = "dmprlab-tfstates-terraform"
    key            = "terraform-test.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo"
    region         = "us-east-1"
    encrypt        = true
  }
}
