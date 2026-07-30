###  VPC RIO DE JANEIRO ###
resource "aws_vpc" "vpc_rj" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "vpc_rj"
  }
}

resource "aws_subnet" "net_rj" {
  vpc_id     = aws_vpc.vpc_rj.id
  cidr_block = "10.1.0.0/24"
  tags = {
    Name = "net_rj"
  }
}


###  VPC SAO PAULO CONFIGS ###

resource "aws_vpc" "vpc_sp" {
  #provider = aws.saopaulo (DISABLE FOR NOW)
  cidr_block = "10.2.0.0/16"
  tags = {
    Name = "vpc_sp"
  }
}

resource "aws_subnet" "net_sp" {
  vpc_id     = aws_vpc.vpc_sp.id
  cidr_block = "10.2.0.0/24"
  tags = {
    Name = "net_sp"
  }
}

###  VPC BASTION ACCESS ###

resource "aws_vpc" "vpc_bastion" {
  cidr_block = "10.100.0.0/16"
  tags = {
    Name = "bastion"
  }
}

resource "aws_subnet" "net_bastion" {
  vpc_id                  = aws_vpc.vpc_bastion.id
  cidr_block              = "10.100.0.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "net_bastion"
  }
}

###  INTERNET GATEWAYS AND ATTACHMENT###

#resource "aws_internet_gateway" "internet_gateway_rj" {
#  vpc_id = aws_vpc.vpc_rj.id
#  tags = {
#    Name = "internet_gateway_rj"
#  }
#}

#resource "aws_internet_gateway_attachment" "gwrj" {
#  internet_gateway_id = aws_internet_gateway.internet_gateway_rj.id
#  vpc_id              = aws_vpc.vpc_rj.id
#}


#resource "aws_internet_gateway" "internet_gateway_sp" {
#  vpc_id = aws_vpc.vpc_sp.id
#  tags = {
#    Name = "internet_gateway_sp"
#  }
#}

#resource "aws_internet_gateway_attachment" "gwsp" {
#  internet_gateway_id = aws_internet_gateway.internet_gateway_sp.id
#  vpc_id              = aws_vpc.vpc_sp.id
#}


resource "aws_internet_gateway" "internet_gateway_bastion" {
#  vpc_id = aws_vpc.vpc_bastion.id
  tags = {
    Name = "internet_gateway_bastion"
  }
}

resource "aws_internet_gateway_attachment" "gwbastion" {
  internet_gateway_id = aws_internet_gateway.internet_gateway_bastion.id
  vpc_id              = aws_vpc.vpc_bastion.id
}

###  TRANSIT GATEWAY ###

resource "aws_ec2_transit_gateway" "transit_gateway" {
  description                     = "Transit gateway para roteamento"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  tags = {
    Name = "transit_gateway"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgrj" {
  subnet_ids         = [aws_subnet.net_rj.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.vpc_rj.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgsp" {
  subnet_ids         = [aws_subnet.net_sp.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.vpc_sp.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgbastion" {
  subnet_ids         = [aws_subnet.net_bastion.id]
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.vpc_bastion.id
}

