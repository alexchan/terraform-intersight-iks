data "intersight_organization_organization" "organization" {
  name = var.org_name
}

resource "intersight_kubernetes_network_policy" "k8s_network_pod_policy" {
  for_each = { for policy in var.network_policy_list : policy.name => policy }


  name             = each.value.name
  pod_network_cidr = each.value.network_pod_cidr_block
  service_cidr     = each.value.network_service_cidr_block

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.organization.moid
  }

  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}

resource "intersight_kubernetes_sys_config_policy" "k8s_network_policy" {
  for_each = { for policy in var.network_policy_list : policy.name => policy }

  name            = each.value.name
  dns_servers     = each.value.dns
  ntp_servers     = each.value.ntp
  timezone        = each.value.timezone
  dns_domain_name = each.value.domain_name

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.organization.moid
  }

  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}