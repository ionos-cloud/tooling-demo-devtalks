data "local_file" "user_data" {
  filename = "${path.module}/../../../scripts/cloud_init_script.sh"
}


resource "ionoscloud_server" "server" {
  name              = var.server_name
  datacenter_id     = var.datacenter_id
  cores             = 2
  ram               = 4096
  availability_zone = "AUTO"
  cpu_family        = var.cpu_family
  image_name        = var.image_name
  # image_password    = "DevTalks"
  # ssh_key_path      = ["/home/iulia/.ssh/id_rsa.pub"]
  volume {
    name            = var.volume_name
    size            = 10
    disk_type       = "HDD"
    # user_data       = data.local_file.user_data.content_base64
  }
  nic {
    lan             = var.private_lan
    ips             = var.private_ips
    dhcp            = true
    firewall_active = false
    firewall_type   = "INGRESS"
  }
}

# resource "ionoscloud_nic" "nic" {
#   datacenter_id     = var.datacenter_id
#   server_id         = ionoscloud_server.server.id
#   lan               = var.public_lan
#   ips               = var.public_ips
#   dhcp            = true
#   firewall_active = false
#   firewall_type   = "INGRESS"
# }

