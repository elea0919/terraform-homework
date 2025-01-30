terraform {
  backend "s3" {
    bucket = "kaizen-elea"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "lock-state"
  }
}