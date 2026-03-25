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
      Name = "${each.value}-root-volume"
    }
  }

  tags = { Name = each.value
           Role = each.key
         }
}


resource "null_resource" "null-1" {
  for_each = aws_instance.vm
  depends_on = [aws_instance.vm]

  connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("C:/Users/khanr/Downloads/ans.pem")
      host = each.value.public_ip
      port = 22
  }

  provisioner "remote-exec" {
    inline = [
      # !! installing packages !!
       "sudo yum install -y wget",
       "sudo hostnamectl set-hostname ${each.key}",
       "wget https://github.com/prometheus/prometheus/releases/download/v3.10.0/prometheus-3.10.0.linux-amd64.tar.gz",
       "tar -zxvf prometheus-3.10.0.linux-amd64.tar.gz",
       "cd prometheus-3.10.0.linux-amd64 && ./prometheus &"
   ]
    
  }
}