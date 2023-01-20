# Create an EC2 instance
resource "aws_instance" "ec2_g52" {
  count         = "1"
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  vpc_security_group_ids = [
    aws_security_group.ssh.id,
    aws_security_group.http.id,
    aws_security_group.https.id
  ]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.deployer.key_name
  tags = {
    Name = "ec2-g52"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.ssh_pubkey
}
