variable "vpc_cidr_block" {
  description = "Give the Ip range"
  type = string 
}

variable "mainVpc_enable_dns_support" {
  description = "enable the dns true/false"
  type = bool
}

variable "mainVpc_enable_dns_hostnames" {
  description = "enable the dns true/false"
  type = bool
}

variable "vpcpublicSubnet1" {
  description = "define the subnet1 ip range"
  type = string 
}

variable "vpcpublicSubnet2" {
  description = "define the subnet2 ip range"
  type = string
}

variable "vpcAvailability_zone" {
  description = "select the availability zones"
  type = list(string)
}

