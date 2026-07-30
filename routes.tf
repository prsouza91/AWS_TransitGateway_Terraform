### VPC RJ ROUTES ###

resource "aws_route_table" "rt_rj" {
  vpc_id = aws_vpc.vpc_rj.id

  tags = {
    Name = "rt_rj"
  }
}

resource "aws_route_table_association" "rj" {
  subnet_id      = aws_subnet.net_rj.id
  route_table_id = aws_route_table.rt_rj.id
}

resource "aws_route" "route_rj_bastion" {
  route_table_id         = aws_route_table.rt_rj.id
  destination_cidr_block = "10.100.0.0/16"
  transit_gateway_id     = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_route" "route_rj_sp" {
  route_table_id         = aws_route_table.rt_rj.id
  destination_cidr_block = "10.2.0.0/16"
  transit_gateway_id     = aws_ec2_transit_gateway.transit_gateway.id
}

### VPC SP ROUTES ###

resource "aws_route_table" "rt_sp" {
  vpc_id = aws_vpc.vpc_sp.id

  tags = {
    Name = "rt_sp"
  }
}

resource "aws_route_table_association" "sp" {
  subnet_id      = aws_subnet.net_sp.id
  route_table_id = aws_route_table.rt_sp.id
}


resource "aws_route" "route_sp_bastion" {
  route_table_id         = aws_route_table.rt_sp.id
  destination_cidr_block = "10.100.0.0/16"
  transit_gateway_id     = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_route" "route_sp_rj" {
  route_table_id         = aws_route_table.rt_sp.id
  destination_cidr_block = "10.1.0.0/16"
  transit_gateway_id     = aws_ec2_transit_gateway.transit_gateway.id
}

### VPC BASTION ROUTES ###

resource "aws_route_table" "rt_bastion" {
  vpc_id = aws_vpc.vpc_bastion.id

  tags = {
    Name = "rt_bastion"
  }
}

resource "aws_route_table_association" "bastion" {
  subnet_id      = aws_subnet.net_bastion.id
  route_table_id = aws_route_table.rt_bastion.id
}


resource "aws_route" "route_bastion_sp" {
  route_table_id         = aws_route_table.rt_bastion.id
  destination_cidr_block = "10.2.0.0/16"
  transit_gateway_id     = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_route" "route_bastion_rj" {
  route_table_id         = aws_route_table.rt_bastion.id
  destination_cidr_block = "10.1.0.0/16"
  transit_gateway_id     = aws_ec2_transit_gateway.transit_gateway.id
}

resource "aws_route" "route_bastion_default" {
  route_table_id         = aws_route_table.rt_bastion.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway_bastion.id
}


