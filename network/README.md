# addons - Intersight IP Pool Terraform Module

## Usage

```hcl
module "ip_pool" {

  source = "CiscoDevNet/intersight-terraform-modules/terraform-intersight-network/modules/ip_pools"

  # omitted...
}
```

This module will loop through all addons in addon_list and create addons for each.  It will then create an addon policy containing all of those addons for consumption in an IKS cluster.

####Current Available Addons
* kubernetes-dashboard
* ccp-monitor
* efk

These resources are created
* [addon](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/kubernetes_addon)
* [addon-policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/kubernetes_addon_policy)


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14.5 |
| intersight | = 0.1.5 |

## Providers

| Name | Version |
|------|---------|
| intersight | = 0.1.5 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ip\_pool\_list | n/a | `list(map(string))` | `[]` | no |
| org\_name | Intersight Organization name | `string` | n/a | yes |
| tags | n/a | `list(map(string))` | `[]` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->