terraform {
  backend "s3" {
    bucket         = "jeremybucker-assignment3"
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "jeremytable-assignment3"
    encrypt        = true
  }
}
