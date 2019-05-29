resource "aws_security_group" "my_security_group" {
  description = "Rules to allow incoming requests"
  vpc_id = "${aws_vpc.redis_vpc.id}"
}
