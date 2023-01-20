variable "region_instance" {
  description = "AWS region used"
  type        = string
  default     = "us-east-1"
}

variable "access_key_instance" {
  description = "AWS Access Key"
  type        = string
}

variable "secret_key_instance" {
  description = "AWS secret key"
  type        = string
}

variable "token_key_instance" {
  description = "AWS token key"
  type        = string
}

variable "ssh_pubkey" {
  description = "The SSH public key for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH public key for the EC2 instance"
  type        = string
}
