# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.main_ig.id
    }

  tags = {
    Name = "Public Route Table"
  }

  depends_on = [aws_vpc.main_vpc, aws_internet_gateway.main_ig]
}


resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_rt.id

  depends_on = [aws_route_table.public_rt, aws_subnet.public_subnet_a]
}


# Private Route Table

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.main_ngw.id
    }

  tags = {
    Name = "Private Route Table"
  }

  depends_on = [aws_vpc.main_vpc, aws_nat_gateway.main_ngw]
}



resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_rt.id

  depends_on = [aws_route_table.public_rt, aws_subnet.private_subnet_a]
}

