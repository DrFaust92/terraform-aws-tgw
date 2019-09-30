# AWS TGW Terraform module

Terraform module which creates Transit Gateway resources on AWS.

## Usage

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

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-vpc-att" {
  subnet_ids         = "${module.vpc.private_subnets}"
  transit_gateway_id = "${module.tgw.tgw_id}"
  vpc_id             = "${module.vpc.vpc_id}"
}
```



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allow\_external\_principals | Should be true to enable Allow External Principals | string | `"false"` | no |
| amazon\_side\_asn | The Autonomous System Number (ASN) for the Amazon side of the gateway. By default the TGW is created with the current default Amazon ASN. | string | `"64512"` | no |
| auto\_accept\_attachments | Whether resource attachment requests are automatically accepted | string | `"false"` | no |
| create\_tgw | Controls if TGW should be created (it affects almost all resources) | string | `"true"` | no |
| enable\_default\_route\_table\_association | Whether resource attachments are automatically associated with the default association route table | string | `"true"` | no |
| enable\_default\_route\_table\_propagation | Whether resource attachments automatically propagate routes to the default propagation route table | string | `"true"` | no |
| enable\_dns\_support | Should be true to enable DNS support in the TGW | string | `"true"` | no |
| name | Name to be used on all the resources as identifier | string | `""` | no |
| ram\_share\_principals | A list of principals to share TGW with. Possible values are an AWS account ID, an AWS Organizations Organization ARN, or an AWS Organizations Organization Unit ARN | list | `[]` | no |
| ram\_tags | Additional tags for the RAM | map | `{}` | no |
| share\_tgw | Whether to share your transit gateway with other accounts | string | `"true"` | no |
| tags | A map of tags to add to all resources | map | `{}` | no |
| tgw\_route\_table\_tags | Additional tags for the TGW route table | map | `{}` | no |
| tgw\_tags | Additional tags for the TGW | map | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| ram\_principal\_association | List of IDs of the RAM Principal Association |
| ram\_resource\_association | The ID of the RAM Resource Association |
| ram\_share\_arn | The ARN of the RAM Share |
| ram\_share\_id | The ID of the RAM Share |
| tgw\_arn | The ARN of the TGW |
| tgw\_id | The ID of the TGW |
| tgw\_route\_table\_id | The ID of the TGW route table |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache 2 Licensed. See LICENSE for full details.