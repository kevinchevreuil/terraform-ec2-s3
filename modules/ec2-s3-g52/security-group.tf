#SSH security group
resource "aws_security_group" "ssh" {
  name        = "SSH"
  description = "Allow SSH outbound and inbound traffic"
  vpc_id      = aws_vpc.vpc_g52.id

  ingress {
    description = "Allow SSH inbound"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"

  }

  egress {
    description = "Allow SSH outbound"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"

  }

  tags = {
    Name = "SSH"
  }
}

#HTTP security group
resource "aws_security_group" "http" {
  name        = "HTTP"
  description = "Allow HTTP outbound and inbound traffic"
  vpc_id      = aws_vpc.vpc_g52.id

  ingress {
    description = "Allow HTTP inbound"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"

  }

  egress {
    description = "Allow HTTP outbound"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"

  }

  tags = {
    Name = "HTTP"
  }
}

#HTTPS security group
resource "aws_security_group" "https" {
  name        = "HTTPS"
  description = "Allow HTTPS outbound and inbound traffic"
  vpc_id      = aws_vpc.vpc_g52.id

  ingress {
    description = "Allow HTTPS inbound"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"

  }

  egress {
    description = "Allow HTTPS outbound"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"

  }

  tags = {
    Name = "HTTPS"
  }
}
