# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
  shared_credentials_file = "/Users/rolan/.aws/creds"
#   profile                 = "roland"
}

terraform {
  backend "s3" {
    bucket = "rolatfstate"
    key    = "wordpress"
    region = "us-east-1"
  }
}
