provider "intersight" {
  apikey        = var.api_key
  secretkeyfile = var.secret_key
  endpoint      = var.endpoint
}
data "intersight_organization_organization" "organization" {
  name = var.organization
}

module "iks_worker_instance_type" {

  source               = "../modules/worker_profile"
  for_each             = { for instance in var.instance_type : instance.name => instance }
  org_name             = var.organization
  instance_type_name   = each.value.name
  instance_type_CPU    = each.value.cpu
  instance_type_disk   = each.value.disk
  instance_type_memory = each.value.memory
  tags                 = var.tags

}
module "iks_network_policies" {

  source   = "../modules/network"
  org_name = var.organization
  # Kubernetes Network Policy
  network_policy_list = var.network_policy_list
  tags                = var.tags

}
module "network_ip_pool" {
  source       = "../network"
  ip_pool_list = var.ip_pool_list
  org_name     = var.organization
  tags         = var.tags
}
module "iks_version" {
  source = "../modules/version"

  org_name         = var.organization
  k8s_version_list = var.k8s_version_list
  tags             = var.tags
}
module "iks_addon" {
  source            = "../modules/addon"
  org_name          = var.organization
  addon_list        = var.addon_list
  addon_policy_name = var.addon_policy_name
  tags              = var.tags
}
module "iks_infra_provider" {
  source     = "../modules/infra"
  org_name   = var.organization
  infra_list = var.infra_list
  tags       = var.tags

}