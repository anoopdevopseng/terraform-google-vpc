# Terraform module for creating VPCs

This module can be used to create a Google Virtual Private Cloud (VPC) networks and subnets.

Check out the [`examples`](/examples) directory for usage examples.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_network_peering.build_to_customer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering) | resource |
| [google_compute_network_peering.customer_to_build](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering) | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_build_project_self_link"></a> [build\_project\_self\_link](#input\_build\_project\_self\_link) | The self link of the project hosting the internal GitHub runners, allows private connectivity | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Base name for the vpc. Must not contain '-' or '\_' | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The GCP project ID in which the resources will be created | `string` | n/a | yes |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | n/a | `string` | `"GLOBAL"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | All subnets that will be created | <pre>map(object({<br/>    ip_range = string,<br/>    purpose  = optional(string, "PRIVATE")<br/>    private_ip_google_access = optional(bool, true)<br/>    secondary_ip_ranges = optional(list(object({<br/>      name     = string,<br/>      ip_range = string,<br/>    }, )), [])<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | The created subnets for the VPC network |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | The created VPC network |
<!-- END_TF_DOCS -->
