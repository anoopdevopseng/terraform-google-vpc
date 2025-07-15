# Module usage examples

# Module usage examples

- **Example of valid values**  
    `myapp`, `myApp`, `Myapp`, `MyApp`, `my-app`, `my_app`

- **Example of produced values**  
    `my-app`


## Minimal example

This creates a VPC network with two subnets, one having secondary ranges.

```hcl
module "vpc" {
    source      = "git::https://github.com/anoopdevopseng/terraform-google-vpc.git?ref=v0.1.0"
    project_id  = "my-project"
    name        = "my-vpc"
    subnets = {
        sub1 = {
            ip_range = "10.1.0.0/16"
        },
        sub2 = {
            ip_range            = "10.2.0.0/16",
            secondary_ip_ranges = [
                {
                    name     = "gke-pod-range"
                    ip_range = "10.3.0.0/16"
                },
                {
                    name     = "gke-svc-range"
                    ip_range = "10.4.0.0/16"
                },
            ]
        }
    }
    build_project_self_link = "https://googleapis.com/123413defghj"
}
```

### Example creating subnet for internal load balancer

This creates a VPC with two subnets. One of them is used for creating internal load balancers and hence has the purpose `REGIONAL_MANAGED_PROXY`.

```hcl
module "vpc" {
    source      = "git::https://github.com/anoopdevopseng/terraform-google-vpc.git?ref=v0.1.0"
    project_id  = "my-project"
    name        = "my-vpc"
    subnets = {
        standard-subnet = {
            ip_range = "10.1.0.0/16"
        },
        proxy-only-subnet = {
            ip_range = "10.2.0.0/23",
            purpose  = "REGIONAL_MANAGED_PROXY",
        }
    }
    build_project_self_link = "https://googleapis.com/123413defghj"
}
```
