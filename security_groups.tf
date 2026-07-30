### SG RJ ###

resource "aws_security_group" "sg_rj" {
  name        = "sg_rj"
  description = "Security Group para RJ Transit Gateway"
  vpc_id      = aws_vpc.vpc_rj.id


  ingress {
    description = "ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

### SG SP ###

resource "aws_security_group" "sg_sp" {
  name        = "sg_sp"
  description = "Security Group para SP Transit Gateway"
  vpc_id      = aws_vpc.vpc_sp.id


  ingress {
    description = "ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

### SG BASTION ###

resource "aws_security_group" "sg_bastion" {
  name        = "sg_bastion"
  description = "Security Group para SP Transit Gateway"
  vpc_id      = aws_vpc.vpc_bastion.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["177.74.230.93/32"]
  }

  ingress {
    description = "ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["177.74.230.93/32"]
  }

  ingress {
    description = "ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}