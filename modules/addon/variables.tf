variable "org_name" {
  type        = string
  description = "Intersight Organization name"
}

variable "addon_list" {
  type    = list(map(string))
  default = []
}

variable "addon_policy_name" {
  type        = string
  description = "Addon Name for Creation"
}
variable "tags" {
  type    = list(map(string))
  default = []
}