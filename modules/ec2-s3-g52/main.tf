provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key_instance
  secret_key = var.secret_key_instance
  token      = var.token_key_instance
}
