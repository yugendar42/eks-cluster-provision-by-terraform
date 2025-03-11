output "vpc_Id" {
  value = aws_vpc.mainVpc.id
}

output "public_subnet1_id" {
  value = aws_subnet.publicSubnet1.id
  
}

output "public_subnet2_id" {
  value = aws_subnet.publicSubnet2.id
  
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.vpcIgw.id
}

output "route_table_id" {
  value       = aws_route_table.vpcRtTable.id
}

output "route_table_association_1_id" {
  value       = aws_route_table_association.myrtAssociation1.id
}

output "route_table_association_2_id" {
  value       = aws_route_table_association.myrtAssociation2.id
}
