resource "ionoscloud_application_loadbalancer" "alb" {
  datacenter_id         = var.datacenter_id 
  name                  = "AlbDevTalksTerraform"
  listener_lan          = var.listener_lan
  ips                   = var.ips
  target_lan            = var.target_lan
  lb_private_ips        = var.lb_private_ips
}

resource "ionoscloud_target_group" "target_group" {
 name                   = "TGDevTalksTerraform"
 algorithm              = "ROUND_ROBIN"
 protocol               = "HTTP"
 targets {
   ip                   = var.target_ip1
   port                 = 80
   weight               = 1
   health_check_enabled = false
   maintenance_enabled  = false
 }
 targets {
   ip                   = var.target_ip2
   port                 = 80
   weight               = 1
   health_check_enabled = false
   maintenance_enabled  = false
 }
}

resource "ionoscloud_application_loadbalancer_forwardingrule" "alb_fr" {
 datacenter_id                  = var.datacenter_id
 application_loadbalancer_id    = ionoscloud_application_loadbalancer.alb.id
 name                           = "Rule"
 protocol                       = "HTTP"
 listener_ip                    = one(ionoscloud_application_loadbalancer.alb.ips)
 listener_port                  = 80
 client_timeout                 = 100000
 http_rules {
        name                    = "redirect"
        type                    = "REDIRECT"
        drop_query              = true
        location                =  "https://ionos.com"
        status_code             =  301
        conditions {
            type                = "QUERY"
            condition           = "ENDS_WITH"
            negate              = false
            key                 = "goto"
            value               = "onos"
        }
    }
  http_rules {
      name                    = "alb_to_webserver"
      type                    = "FORWARD"
      target_group            = ionoscloud_target_group.target_group.id
  }
}