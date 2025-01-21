//vpc
resource "aws_vpc" "max_vpc" { 
 cidr_block = var.vpc_cidr
 instance_tenancy = "default"
 tags = {
    Name = "VPC-1"
        }  
}      
//Subnets
resource "aws_subnet" "subnets" {
  count                           =  length(var.subnet_cidr)      
  vpc_id                          = aws_vpc.max_vpc.id
  cidr_block                      = var.subnet_cidr[count.index]
  availability_zone               = data.aws_availability_zones.availability.names[count.index]
  map_public_ip_on_launch         = true
  tags                            = { 
    Name                          = var.subnet_names[count.index] 
  }
}


//Internet Gateway

resource "aws_internet_gateway" "internetGateway" {
  vpc_id = aws_vpc.max_vpc.id
  tags = {
    Name = "My internet Gateway"
  }
}

//Route table
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.max_vpc.id
  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.internetGateway.id
  }
}


// Route table Association
// Route table Association: Associates the route table with the subnets
resource "aws_route_table_association" "route_table_association" {
  count = length(var.subnet_cidr)
  subnet_id = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.route_table.id
}