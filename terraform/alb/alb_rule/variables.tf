variable "datacenter_id" {
    type = string
    description = "The UUID of the datacenter"
}

variable "application_loadbalancer_id" {
    type = string 
}

variable "name" {
    type = string
    description = "The name of the LAN"
}

variable "protocol" {
    type = string
    description = "Balancing protocol."
}

variable "listener_ip" {
    type = string
    description = "Listening (inbound) IP."
}

variable "listener_port" {
    type = number
    description = "Listening (inbound) port number; valid range is 1 to 65535."
}

variable "client_timeout" {
    type = number
    description = "The maximum time in milliseconds to wait for the client to acknowledge or send data; default is 50,000 (50 seconds)."
}

variable "server_certificates" {
    type = list(string)
    description = "The maximum time in milliseconds to wait for the client to acknowledge or send data; default is 50,000 (50 seconds)."
}

variable "type" {
    type = string
    description = "Type of the HTTP rule."
}

variable "target_group" {
    type = string
    description = "The ID of the target group; mandatory and only valid for FORWARD actions."
}

variable "drop_query" {
    type = bool
    description = "Default is false; valid only for REDIRECT actions."
}

variable "location" {
    type = string
    description = "The location for redirecting; mandatory and valid only for REDIRECT actions."
}

variable "status_code" { 
    type = number
    description = "Valid only for REDIRECT and STATIC actions."
}

variable "response_message" { 
    type = string
    description = "The response message of the request; mandatory for STATIC actions."
}

variable "content_type" { 
    type = string
    description = "Valid only for STATIC actions."
}

variable "condition" { 
    type = string
    description = "Valid only for STATIC actions."
}

variable "negate" { 
    type = bool
    description = "Specifies whether the condition is negated or not; the default is False."
}

variable "key" { 
    type = string
}

variable "value" { 
    type = string
}
