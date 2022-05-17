resource "ionoscloud_application_loadbalancer" "alb" {
  datacenter_id         = var.datacenter_id 
  name                  = var.name
  listener_lan          = var.listener_lan
  ips                   = var.ips
  target_lan            = var.target_lan
  lb_private_ips        = var.lb_private_ips
}