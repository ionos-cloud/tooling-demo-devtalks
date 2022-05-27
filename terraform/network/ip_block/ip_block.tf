resource "ionoscloud_ipblock" "ip_block" {
  location = var.location
  size = 1
  name = "DevTalksIpBlock"
}

