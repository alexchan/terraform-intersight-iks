variable "api_key" {
  type        = string
  description = "API Key"
}
variable "secret_key" {
  type        = string
  description = "Secret Key file location"
}
variable "endpoint" {
  type        = string
  description = "API Endpoint URL"
  default     = "https://www.intersight.com"
}
variable "organization" {
  type        = string
  description = "Organization Name"
  default     = "default"
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

variable "instance_type" {
  type = list(object({
    name   = string,
    cpu    = number,
    memory = number,
    disk   = string
  }))
}
variable "ip_pool_list" {
  type    = list(map(string))
  default = []
}

variable "k8s_version_list" {
  type = list(object({
    name    = string,
    version = string
  }))
}


variable "addon_list" {
  type    = list(map(string))
  default = []
}

variable "addon_policy_name" {
  type        = string
  description = "Addon Policy Name"
}

variable "infra_list" {
  # sensitive = true
  type = list(object({
    name          = string
    device_name   = string
    cluster       = string
    interfaces    = list(string)
    datastore     = string
    passphrase    = string
    resource_pool = string

  }))
}

variable "tags" {
  type    = list(map(string))
  default = []
}