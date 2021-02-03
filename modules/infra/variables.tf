
variable "org_name" {
  type        = string
  description = "Intersight Organization name"
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