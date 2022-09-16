data "aws_availability_zones" "available" {}

locals {
    cluster_name = "${var.environment}-Sirius_Cluster"
}

module vpc {
    source = "terraform-aws-modules/vpc/aws"
    version = "3.2.0"
    name = "${var.environment}-Sirius_vpc"
    cidr = "10.0.0.0/16"
    azs = data.aws_availability_zones.available.names
    private_subnets = var.ip_ranges.private_subnets
    public_subnets =  var.ip_ranges.public_subnets
    enable_nat_gateway = true
    single_nat_gateway = true
    enable_dns_hostnames = true
  
tags = {
    Name = "${var.environment}-Sirius_vpc"
   
}
public_subnet_tags = {
    Name = "${var.environment}-Public-Subnet"
    
}
private_subnet_tags = {
    Name = "${var.environment}-Private-Subnet"
   
}
}