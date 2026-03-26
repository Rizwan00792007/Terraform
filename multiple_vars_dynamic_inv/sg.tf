resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "EC2 security group"
  tags = {
    Name = "ec2-sg"
  }
}

resource "aws_security_group_rule" "tcp_all_ports" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
  
}

resource "aws_security_group_rule" "tcp_all_ports1" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
  
}