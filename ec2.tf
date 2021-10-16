resource "aws_instance" "public_ec2" {
  ami           = "ami-058e6df85cfc7760b"
  instance_type = "t2.micro"
  vpc_security_group_ids =  [aws_security_group.allow_ssh.id]
  subnet_id = aws_subnet.public_subnet_a.id
  key_name = ""

  tags = {
    Name = "My Public EC2 Instance"
  }

  depends_on = [aws_vpc.main_vpc, aws_subnet.public_subnet_a, aws_security_group.allow_ssh]
}


resource "aws_instance" "private_ec2" {
  ami           = "ami-058e6df85cfc7760b"
  instance_type = "t2.micro"
  vpc_security_group_ids =  [aws_security_group.allow_ssh.id]
  subnet_id = aws_subnet.private_subnet_a.id
  key_name = ""

  tags = {
    Name = "My Private EC2 Instance"
  }

  depends_on = [aws_vpc.main_vpc, aws_subnet.private_subnet_a, aws_security_group.allow_ssh]
}