variable "datacenter_id" {
    type = string
    description = "The UUID of the datacenter"
}

variable "name" {
    type = string
    description = "The name of the LAN"
}

variable "listener_lan" {
    type = string
    description = "ID of the listening (inbound) LAN"
}

variable "ips" {
    type = list(string) 
    description = "ID of the listening (inbound) LAN"
}

variable "target_lan" {
    type = string
    description = "ID of the balanced private target LAN (outbound)."
}

variable "lb_private_ips" {
    type = list(string) 
    description = "Collection of private IP addresses with the subnet mask of the Application Load Balancer. IPs must contain valid a subnet mask. If no IP is provided, the system will generate an IP with /24 subnet."
}
