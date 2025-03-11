resource "aws_vpc" "mainVpc" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = "default"
  enable_dns_support = var.mainVpc_enable_dns_support
  enable_dns_hostnames = var.mainVpc_enable_dns_hostnames

  tags = {
    Name = "main-vpc"
  }
  
}

resource "aws_subnet" "publicSubnet1" {
  vpc_id = aws_vpc.mainVpc.id
  cidr_block = var.vpcpublicSubnet1
  availability_zone = var.vpcAvailability_zone[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet1"
  }
}
 resource "aws_subnet" "publicSubnet2" {
  vpc_id = aws_vpc.mainVpc.id
  cidr_block = var.vpcpublicSubnet2
  availability_zone = var.vpcAvailability_zone[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet2"
  }
}

resource "aws_internet_gateway" "vpcIgw" {
  vpc_id = aws_vpc.mainVpc.id
  tags = {
    Name = "main_vpcIgw"
  }
  
}
resource "aws_route_table" "vpcRtTable" {
  vpc_id = aws_vpc.mainVpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpcIgw.id
  }

  tags = {
    Name = "vpc_rtTable"
  }
  
}

resource "aws_route_table_association" "myrtAssociation1" {
  route_table_id =  aws_route_table.vpcRtTable.id
  subnet_id = aws_subnet.publicSubnet1.id

}

resource "aws_route_table_association" "myrtAssociation2" {
  route_table_id =  aws_route_table.vpcRtTable.id
  subnet_id = aws_subnet.publicSubnet2.id
}
