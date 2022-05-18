resource "ionoscloud_server" "server" {
  name = var.name
  datacenter_id = var.datacenter_id
  cores = 1
  ram = 2048
  availability_zone = "ZONE_1"
  cpu_family = var.cpu_family
  image_name ="ubuntu:latest"
  image_password = "Drz53jkds6s"
  volume {
    name = var.name
    size = 3
    disk_type = "SSD Standard"
  }
  nic {
    lan  = var.lan
    name = var.name
    dhcp = true
  }
}

