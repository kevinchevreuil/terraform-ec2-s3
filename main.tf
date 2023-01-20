provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key_instance
  secret_key = var.secret_key_instance
  token      = var.token_key_instance
}

module "ec2-s3-g52" {
    source = "./modules/ec2-s3-g52"
    ssh_pubkey = var.ssh_pubkey
    key_name = var.key_name
    access_key_instance = var.access_key_instance
    secret_key_instance = var.secret_key_instance
    token_key_instance = var.token_key_instance
}
