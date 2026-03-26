resource "aws_instance" "vm" {
  for_each = var.instances
  ami      = var.ami_type 
  instance_type = var.ec2_type
  key_name = "ans"
  vpc_security_group_ids = [ aws_security_group.ec2_sg.id ]

  root_block_device {
    volume_size = 15
    volume_type = "gp3"
    delete_on_termination = true
    encrypted = true
    tags = {
      Name = "${each.value.server_name}-root-volume"
    }
  }

  tags = {
    Name = each.value.server_name
    Role = each.value.role
    Env  = each.value.environment
    Team = each.value.team
         }
}

