resource "ionoscloud_server" "server" {
  name              = var.server_name
  datacenter_id     = var.datacenter_id
  cores             = 2
  ram               = 4096
  availability_zone = "AUTO"
  cpu_family        = var.cpu_family
  image_name        = var.image_name
  volume {
    name            = var.volume_name
    size            = 10
    disk_type       = "HDD"
  }
  nic {
    lan             = var.lan
    ips             = var.ips
    dhcp            = true
    firewall_active = false
    firewall_type   = "INGRESS"
  }
}