

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
| instance\_type\_CPU | CPU Count for Worker Instance | `number` | n/a | yes |
| instance\_type\_disk | Instance Disk Size | `string` | n/a | yes |
| instance\_type\_memory | Instance Memory Size | `number` | n/a | yes |
| instance\_type\_name | Virtual Machine Instance Type Name | `string` | n/a | yes |
| org\_name | Intersight Organization name | `string` | n/a | yes |
| tags | n/a | `list(map(string))` | `[]` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->