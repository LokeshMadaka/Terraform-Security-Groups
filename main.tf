data "aws_vpc" "sg_vpc_info" {
  default = true
}
resource "aws_security_group" "demosg" {
  name="myopenallsg"
  description = "all network sg"
  vpc_id = data.aws_vpc.data_vpc_info.id
  
}
resource "aws_vpc_security_group_ingress_rule" "myingressrules" {
  security_group_id = aws_security_group.demosg.id
  from_port = 22
  to_port = 22
  ip_protocol="tcp"
  cidr_ipv4 = "0.0.0.0/0"
}