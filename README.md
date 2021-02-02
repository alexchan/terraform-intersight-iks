# intersight-terraform-modules

The Cisco Intersight Terraform Provider is available in the Terraform Registry at https://registry.terraform.io/providers/CiscoDevNet/intersight/latest.  This repository contains example modules that use the provider to create 

A terraform module to create a managed Kubernetes clusters using Intersight Kubernetes Service (IKS). Available through the [Terraform registry](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest).
<!-- Inspired by and adapted from [this doc](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs) -->
and its [source code](https://github.com/CiscoDevNet/terraform-provider-intersight).

## Assumptions

* You want to create an IKS cluster on your on-premises infrastructure using Intersight.
* These resources will be provided using Intersight and VMware vCenter 6.7.
* You've claimed vCenter using the Intersight Assist Appliance.
* You are a member of the Early Access Pilot.

## Important Note

This platform is currently in Early Access and comes with no support.  Please contact your Cisco Sales Representative regarding any issues/feature requests.

**Always check [Kubernetes Release Notes](https://kubernetes.io/docs/setup/release/notes/) before updating the major version.**

## Usage Example


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
| addon\_list | n/a | `list(map(string))` | `[]` | no |
| addon\_policy\_name | Addon Policy Name | `string` | n/a | yes |
| api\_key | API Key | `string` | n/a | yes |
| endpoint | API Endpoint URL | `string` | `"https://www.intersight.com"` | no |
| infra\_list | n/a | <pre>list(object({<br>    name          = string<br>    instance_type = string<br>    device_name   = string<br>    cluster       = string<br>    interfaces    = list(string)<br>    datastore     = string<br>    passphrase    = string<br>    resource_pool = string<br><br>  }))</pre> | n/a | yes |
| instance\_type | n/a | <pre>list(object({<br>    name   = string,<br>    cpu    = number,<br>    memory = number,<br>    disk   = string<br>  }))</pre> | n/a | yes |
| ip\_pool\_list | n/a | `list(map(string))` | `[]` | no |
| k8s\_version\_list | n/a | <pre>list(object({<br>    name    = string,<br>    version = string<br>  }))</pre> | n/a | yes |
| network\_policy\_list | n/a | <pre>list(object({<br>    name                       = string<br>    network_pod_cidr_block     = string<br>    network_service_cidr_block = string<br>    ntp                        = list(string)<br>    dns                        = list(string)<br>    timezone                   = string<br>    domain_name                = string<br>  }))</pre> | n/a | yes |
| organization | Organization Name | `string` | `"default"` | no |
| secret\_key | Secret Key file location | `string` | n/a | yes |
| tags | n/a | `list(map(string))` | `[]` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->