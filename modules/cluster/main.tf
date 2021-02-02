data "intersight_organization_organization" "organization" {
  name = var.org_name
}

resource "intersight_kubernetes_cluster_profile" "cluster" {

  name        = "testCluster"
  status      = "Ready"
  description = "This Kubernetes Cluster profile has been created via Terraform"
  # action = "deploy"
  cluster_ip_pools {
    moid = intersight_ippool_pool.pool_10-139-12-0a.id
  }
  # container_runtime_config {
  #   moid = intersight_kubernetes_version_policy.IKS-version-1_18.id
  # }
  management_config {
    load_balancer_count = 1
    ssh_keys = [
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBl8AgXK9Ypm5prmzRnuhDs9WqExSDOsoduwQYVF6jSqheKnDv4ThPXTp2xWkVIhRFwOjFXuHYOF7E35cOy/c34= jusbarks@JUSBARKS-M-D2JU"
    ]
    ssh_user = "iksadmin"
  }

  addons {
    object_type = "kubernetes.AddonPolicy"
    moid        = intersight_kubernetes_addon_policy.IKS-no_addons.id
  }
  net_config {
    moid = intersight_kubernetes_network_policy.k8s_network_pod_policy.id
  }
  sys_config {
    moid = intersight_kubernetes_sys_config_policy.k8s_network_policy.id
  }

  tags {
    key   = "Managed_By"
    value = "Terraform"
  }
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.organization.moid
  }
}