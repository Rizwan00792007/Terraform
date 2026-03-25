output "public_ips" {
  value = {
    for key,instance in aws_instance.vm :instance.tags["Name"] => instance.public_ip
  }
}


