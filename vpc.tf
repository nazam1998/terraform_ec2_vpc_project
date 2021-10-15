resource "aws_vpc" "main_vpc" {

    cidr_block  = var.vpc_cidr
    
    instance_tenancy = "default"
    
    enable_dns_hostnames = true
    tags = {
        Name = "Main VPC"
    }
}

resource "aws_security_group" "allow_ssh"{
    name = "allow_ssh"
    description = "Allow SSH inbound traffic/ all outbound traffic"
    vpc_id = aws_vpc.main_vpc.id
    ingress {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
      description      = "All Outbound from VPC"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "My Security Group"
  }

  depends_on = [aws_vpc.main_vpc]
}

resource "aws_internet_gateway" "main_ig" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Main Internet Gateway"
  }

  depends_on = [aws_vpc.main_vpc]
}

resource "aws_eip" "main_eip" {
  vpc              = true
  tags = {
      Name = "My EIP"
  }
}

resource "aws_nat_gateway" "main_ngw" {
  allocation_id = aws_eip.main_eip.id
  subnet_id     = aws_subnet.public_subnet_a.id

  tags = {
    Name = "My Nat Gateway"
  }
  depends_on = [aws_eip.main_eip, aws_subnet.public_subnet_a]
}