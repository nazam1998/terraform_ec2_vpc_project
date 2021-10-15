resource "aws_subnet" "public_subnet_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "My Public Subnet A"
  }
  depends_on = [aws_vpc.main_vpc]
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.16.0/20"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "My Private Subnet A"
  }
  depends_on = [aws_vpc.main_vpc]
}