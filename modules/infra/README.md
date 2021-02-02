# addons - Intersight IKS Infrastructure Provider Terraform Module

## Usage

```hcl
module "iks_infra_provider" {

  source = "CiscoDevNet/intersight-terraform-modules/terraform-intersight-iks/modules/infra"

  # omitted...
}
```

This module will lookup the infrastructure target (i.e. vCenter) via the target name.  It will then create a Kubernetes Infrastructure Provider using that target and the additional variables defined in infra_list.


These resources are created
* [infrastructure provider](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/kubernetes_virtual_machine_infrastructure_provider)



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
| infra\_list | n/a | <pre>list(object({<br>    name          = string<br>    instance_type = string<br>    device_name   = string<br>    cluster       = string<br>    interfaces    = list(string)<br>    datastore     = string<br>    passphrase    = string<br>    resource_pool = string<br><br>  }))</pre> | n/a | yes |
| org\_name | Intersight Organization name | `string` | n/a | yes |
| tags | n/a | `list(map(string))` | `[]` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->