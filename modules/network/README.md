# addons - Intersight IKS Network Policy Terraform Module

## Usage

```hcl
module "iks_network_policies" {

  source = "CiscoDevNet/intersight-terraform-modules/terraform-intersight-iks/modules/network"

  # omitted...
}
```

This module will create the network policies as defined in the network_policy_list variable.  


These resources are created
* [network policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/kubernetes_network_policy)




<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14.5 |
| intersight | >= 0.1.5 |

## Providers

| Name | Version |
|------|---------|
| intersight | >= 0.1.5 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| network\_policy\_list | n/a | <pre>list(object({<br>    name                       = string<br>    network_pod_cidr_block     = string<br>    network_service_cidr_block = string<br>    ntp                        = list(string)<br>    dns                        = list(string)<br>    timezone                   = string<br>    domain_name                = string<br>  }))</pre> | n/a | yes |
| org\_name | Intersight Organization name | `string` | n/a | yes |
| tags | n/a | `list(map(string))` | `[]` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->