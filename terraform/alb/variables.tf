variable "datacenter_id" {
    type = string
    description = "The UUID of the datacenter"
}

variable "listener_lan" {
    type = string
    description = "ID of the listening (inbound) LAN"
}

variable "ips" {
    type = list(string) 
    description = "ID of the listening (inbound) LAN."
}


variable "target_lan" {
    type = string
    description = "ID of the balanced private target LAN (outbound)."
}

variable "lb_private_ips" {
    type = list(string) 
    description = "Collection of private IP addresses with the subnet mask of the Application Load Balancer. IPs must contain valid a subnet mask. If no IP is provided, the system will generate an IP with /24 subnet."
}

### Target Group 

variable "target_ip1" {
    type = string
    description = "First target ip."

}

variable "target_ip2" {
    type = string
    description = "Second target ip."
}



