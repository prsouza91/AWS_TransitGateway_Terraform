
resource "aws_instance" "server_bastion" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t2.micro"
  subnet_id     =  aws_subnet.net_bastion.id
  vpc_security_group_ids = [aws_security_group.sg_bastion.id]
  key_name = "key_ec2"
  
  
  tags = {
    Name = "server_bastion"
  }
}

resource "aws_instance" "server_sp" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t2.micro"
  subnet_id     =  aws_subnet.net_sp.id
  vpc_security_group_ids = [aws_security_group.sg_sp.id]
  
  
  
  tags = {
    Name = "server_sp"
  }
}


resource "aws_instance" "server_rj" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t2.micro"
  subnet_id     =  aws_subnet.net_rj.id
  vpc_security_group_ids = [aws_security_group.sg_rj.id]
  
  
  
  tags = {
    Name = "server_rj"
  }
}