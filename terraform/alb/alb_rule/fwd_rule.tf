resource "ionoscloud_application_loadbalancer_forwardingrule" "alb_fr"{
 datacenter_id                  = var.datacenter_id
 application_loadbalancer_id    = var.application_loadbalancer_id 
 name                           = var.name
 protocol                       = var.protocol
 listener_ip                    = var.listener_ip
 listener_port                  = var.listener_port
 client_timeout                 = var.client_timeout
 server_certificates            = var.server_certificates
 http_rules {
   name                         = var.name
   type                         = var.type
   drop_query                   = var.drop_query
   location                     = var.location
   status_code                  = var.status_code
   conditions {
     type                       = var.type
     condition                  = var.condition
     negate                     = var.negate
     key                        = var.key
     value                      = var.value
   }
 }
}