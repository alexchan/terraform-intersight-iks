# Looking up Organization MOID
data "intersight_organization_organization" "organization" {
  name = var.org_name
}
# Looking up addon definitions
data "intersight_kubernetes_addon_definition" "addon_def" {
  for_each = { for addon in var.addon_list : addon.name => addon }
  name     = each.value.name
}
# Looping through addon definitions to create addons
resource "intersight_kubernetes_addon" "addon" {
  for_each         = { for addon in var.addon_list : addon.name => addon }
  name             = each.value.name
  upgrade_strategy = each.value.upgrade_strategy
  addon_definition {
    moid = data.intersight_kubernetes_addon_definition.addon_def[each.value.name].moid
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

# Creating addon Policy by default all addons created are added to policy. 
resource "intersight_kubernetes_addon_policy" "addon_policy" {
  name = var.addon_policy_name
  dynamic "addons" {
    for_each = intersight_kubernetes_addon.addon
    content {
      moid = addons.value["id"]
    }
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