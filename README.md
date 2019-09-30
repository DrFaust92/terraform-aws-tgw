# AWS TGW Terraform module

Terraform module which creates Transit Gateway resources on AWS.

```hcl
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "tgw" {
  source = "..."

  name                    = "my-tgw"
  auto_accept_attachments = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-att-vpc-1" {
  subnet_ids         = "${module.vpc.private_subnets}"
  transit_gateway_id = "${module.tgw.tgw_id}"
  vpc_id             = "${module.vpc.vpc_id}"
}
```



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| amazon\_side\_asn | The Autonomous System Number (ASN) for the Amazon side of the gateway. By default the TGW is created with the current default Amazon ASN. | string | `"64512"` | no |
| auto\_accept\_attachments | Whether resource attachment requests are automatically accepted | string | `"false"` | no |
| create\_tgw | Controls if TGW should be created (it affects almost all resources) | string | `"true"` | no |
| enable\_default\_route\_table\_association | Whether resource attachments are automatically associated with the default association route table | string | `"true"` | no |
| enable\_default\_route\_table\_propagation | Whether resource attachments automatically propagate routes to the default propagation route table | string | `"true"` | no |
| enable\_dns\_support | Should be true to enable DNS support in the TGW | string | `"true"` | no |
| name | Name to be used on all the resources as identifier | string | `""` | no |
| tags | A map of tags to add to all resources | map | `{}` | no |
| tgw\_route\_table\_tags | Additional tags for the TGW route table | map | `{}` | no |
| tgw\_tags | Additional tags for the TGW | map | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| tgw\_arn | The ARN of the TGW |
| tgw\_id | The ID of the TGW |
| tgw\_route\_table\_id | The ID of the TGW route table |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->