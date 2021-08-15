resource "aws_security_group" "server" {
  name = "server_access"
  vpc_id =  local.vpc_id

  ingress = [ {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  } ]

  ingress = [ {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  } ]

  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    security_groups = [ "value" ]
    to_port = 0
  } ]
}