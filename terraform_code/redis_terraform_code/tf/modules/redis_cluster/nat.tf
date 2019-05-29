resource "aws_eip" "my_eip" {
  vpc = true
}

resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = "${aws_vpc.redis_vpc.id}"
}

resource "aws_nat_gateway" "my_nat_gateway" {
  count = 1
  allocation_id = "${aws_eip.my_eip.id}"
  subnet_id = "${aws_subnet.redis_subnet_pub1.id}"
  
  depends_on = [ 
    "aws_internet_gateway.my_internet_gateway",
    "aws_eip.my_eip"
 ]

}

resource "aws_route_table" "my_route_table" {
  vpc_id = "${aws_vpc.redis_vpc.id}"
#  route {
#    cidr_block = "10.0.0.0/16"
#    nat_gateway_id = "${aws_nat_gateway.my_nat_gateway.id}"
#     vpc_peering_connection_id = "pcx-b73585cd"
#  }

 tags {
    Name = "route_table_new1"
  }

}

resource "aws_route_table_association" "rt_for_private_sub1" {
  subnet_id = "${aws_subnet.redis_subnet_priv1.id}"
  route_table_id = "${aws_route_table.my_route_table.id}"
}

resource "aws_route_table_association" "rt_for_private_sub2" {
  subnet_id = "${aws_subnet.redis_subnet_priv2.id}"
  route_table_id = "${aws_route_table.my_route_table.id}"
}
