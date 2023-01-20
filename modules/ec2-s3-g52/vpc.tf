#Creation of a VPC
resource "aws_vpc" "vpc_g52" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-g52"
  }
}
#Network creation
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc_g52.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Subnet privé"
  }
}

#Gateway creation
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc_g52.id

  tags = {
    Name = "Gateway"
  }
}

#Routing
resource "aws_route_table" "publique_route" {
  vpc_id = aws_vpc.vpc_g52.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

}

#Routing association
resource "aws_route_table_association" "publique_route_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.publique_route.id
}
