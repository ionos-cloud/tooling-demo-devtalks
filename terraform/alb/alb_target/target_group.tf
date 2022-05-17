# resource "ionoscloud_target_group" "target_group" {
#  name                   = var.name
#  algorithm              = var.algorithm
#  protocol               = var.protocol
#  targets {
#    ip                   = var.ip
#    port                 = var.port
#    weight               = var.weight
#    health_check_enabled = var.health_check_enabled
#    maintenance_enabled  = var.maintenance_enabled
#  }
#  health_check {
#      check_timeout      = var.check_timeout
#      check_interval     = var.check_interval
#      retries            = var.retries
#  }
#  http_health_check {
#      path               = var.path
#      method             = var.method
#      match_type         = var.match_type
#      response           = var.response
#      regex              = var.regex
#      negate             = var.negate
#    }
# }