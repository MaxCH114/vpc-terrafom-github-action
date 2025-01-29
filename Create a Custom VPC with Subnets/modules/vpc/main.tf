#vpc
resource "aws_vpc" "My_data_center_Cloud" { 
cidr_block = var.vpc_cidr
instance_tenancy = var.instance_tenancy
enable_dns_hostnames = var.enable_dns_hostnames

 tags = {
    Name = "${var.project_name}-Data_Center_In_the_Cloud"
       }  
}

data "aws_availability_zones" "availability_zones" {
}

#Internet Gateway
resource "aws_internet_gateway" "My_data_center_Cloud_internet_gateway" {       
 vpc_id = aws_vpc.My_data_center_Cloud.id

 tags = {
    Name = "${var.project_name}-Data_Center_In_the_Cloud"
       }  
}

#create public subnet us-east-1a
resource "aws_subnet" "public_subnet_az1_a" {
    vpc_id = aws_vpc.My_data_center_Cloud.id
    cidr_block = var.public_subnet_az1_a
    availability_zone       = data.aws_availability_zones.availability_zones.names[0] 
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.project_name}-Public-Subnet_az1_a"
    }
}

#create public subnet us-east-1b
resource "aws_subnet" "public_subnet_az1_b" {
    vpc_id = aws_vpc.My_data_center_Cloud.id
    cidr_block = var.public_subnet_az1_b
    availability_zone       = data.aws_availability_zones.availability_zones.names[1]
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.project_name}-Public-Subnet_az1_b"
    }
}

#create public subnet us-east-1c
resource "aws_subnet" "public_subnet_az1_c" {
    vpc_id = aws_vpc.My_data_center_Cloud.id
    cidr_block = var.public_subnet_az1_c
   availability_zone       = data.aws_availability_zones.availability_zones.names[2]
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.project_name}-Public-Subnet_az1_c"
    }
}

#create private subnet us-east-1a
resource "aws_subnet" "private_subnet_az1_a" {
    vpc_id = aws_vpc.My_data_center_Cloud.id
    cidr_block = var.private_subnet_az1_a
   availability_zone       = data.aws_availability_zones.availability_zones.names[0] 
    tags = {
        Name = "${var.project_name}-Private-Subnet_az1_a"
    }
}

#create private subnet us-east-1b
resource "aws_subnet" "private_subnet_az1_b" {
    vpc_id = aws_vpc.My_data_center_Cloud.id
    cidr_block = var.private_subnet_az1_b
    availability_zone       = data.aws_availability_zones.availability_zones.names[1]
    tags = {
        Name = "${var.project_name}-Private-Subnet-az1-b"
    }
}   

#create private subnet us-east-1c
resource "aws_subnet" "private_subnet_az1_c" {
    vpc_id = aws_vpc.My_data_center_Cloud.id
    cidr_block = var.private_subnet_az1_c
    availability_zone       = data.aws_availability_zones.availability_zones.names[2] 
    tags = {
        Name = "${var.project_name}-Private-Subnet-az1-c"
    }
}

#create route table and public route
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.My_data_center_Cloud.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.My_data_center_Cloud_internet_gateway.id
    }

    tags = {
        Name = "${var.project_name}-Public-Route-Table"
    }
}

#associate public subnet us-east-1a with public route table
resource "aws_route_table_association" "public_subnet_az1_a_association" {
    subnet_id = aws_subnet.public_subnet_az1_a.id
    route_table_id = aws_route_table.public_route_table.id
}

#associate public subnet us-east-1b with public route table
resource "aws_route_table_association" "public_subnet_az1_b_association" {
    subnet_id = aws_subnet.public_subnet_az1_b.id
    route_table_id = aws_route_table.public_route_table.id
}

#associate public subnet us-east-1c with public route table
resource "aws_route_table_association" "public_subnet_az1_c_association" {
    subnet_id = aws_subnet.public_subnet_az1_c.id
    route_table_id = aws_route_table.public_route_table.id
}

#create route table and private route
resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.My_data_center_Cloud.id

    tags = {
        Name = "${var.project_name}-Private-Route-Table"
    }
}

#associate private subnet us-east-1a with private route table
resource "aws_route_table_association" "private_subnet_az1_a_association" {
    subnet_id = aws_subnet.private_subnet_az1_a.id
    route_table_id = aws_route_table.private_route_table.id
}

#associate private subnet us-east-1b with private route table
resource "aws_route_table_association" "private_subnet_az1_b_association" {
    subnet_id = aws_subnet.private_subnet_az1_b.id
    route_table_id = aws_route_table.private_route_table.id
}

#associate private subnet us-east-1c with private route table
resource "aws_route_table_association" "private_subnet_az1_c_association" {
    subnet_id = aws_subnet.private_subnet_az1_c.id
    route_table_id = aws_route_table.private_route_table.id
}

