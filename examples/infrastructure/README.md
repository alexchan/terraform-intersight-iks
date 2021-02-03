# Complete IKS required infrastructure deployment

Configuration in this directory creates all of the IKS requirements for provisioning IKS Clusters.  It does not provision the cluster.  This example will be added.

Data sources are used to discover existing resources such as vCenter Target.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which are consumed for IKS clusters.  Please make sure to undeploy and delete the cluster before destroying these resources with `terraform destroy`.
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
| infra\_list | n/a | <pre>list(object({<br>    name          = string<br>    device_name   = string<br>    cluster       = string<br>    interfaces    = list(string)<br>    datastore     = string<br>    passphrase    = string<br>    resource_pool = string<br><br>  }))</pre> | n/a | yes |
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