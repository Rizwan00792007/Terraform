ami_type = "ami-09e973f123c32cf86"
ec2_type = "t2.micro"
instances = {
  vm-1 = {
    server_name = "prometheus-server"
    role        = "prometheus"
    environment = "dev"
    team        = "devops"
  }

  vm-2 = {
    server_name = "node-exporter1"
    role        = "node_exporter"
    environment = "dev"
    team        = "devops"
  }

}