# Looking up Organization MOID
data "intersight_organization_organization" "organization" {
  name = var.org_name
}
# Looking up Asset Target MOID
data "intersight_asset_target" "infra_target" {
  for_each = { for device in var.infra_list : device.device_name => device }
  name     = each.value.device_name
}

resource "intersight_kubernetes_virtual_machine_infrastructure_provider" "infra_provider" {
  depends_on = [data.intersight_asset_target.infra_target]
  for_each   = { for name in var.infra_list : name.name => name }
  name       = each.value.name
  dynamic "infra_config" {
    for_each = var.infra_list
    content {
      object_type = "kubernetes.EsxiVirtualMachineInfraConfig"
      interfaces  = infra_config.value["interfaces"]
      additional_properties = jsonencode({
        Datastore    = infra_config.value["datastore"]
        Cluster      = infra_config.value["cluster"]
        Passphrase   = infra_config.value["passphrase"]
        ResourcePool = infra_config.value["resource_pool"]
      })
    }
  }

  target {
    object_type = "asset.DeviceRegistration"

    moid = data.intersight_asset_target.infra_target[each.value.device_name].registered_device[0].moid

  }

  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.organization.moid
  }
}