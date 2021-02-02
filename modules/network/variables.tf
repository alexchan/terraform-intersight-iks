variable "org_name" {
  type        = string
  description = "Intersight Organization name"
}


variable "network_policy_list" {
  type = list(object({
    name                       = string
    network_pod_cidr_block     = string
    network_service_cidr_block = string
    ntp                        = list(string)
    dns                        = list(string)
    timezone                   = string
    domain_name                = string
  }))
}
variable "tags" {
  type    = list(map(string))
  default = []
}