resource "aws_network_acl" "my_nacl" {
  vpc_id = "${aws_vpc.redis_vpc.id}"
 } 
