variable "create_tgw" {
  description = "Controls if TGW should be created (it affects almost all resources)"
  default     = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the TGW"
  default     = true
}

variable "enable_default_route_table_association" {
  description = "Whether resource attachments are automatically associated with the default association route table"
  default     = true
}

variable "enable_default_route_table_propagation" {
  description = "Whether resource attachments automatically propagate routes to the default propagation route table"
  default     = true
}

variable "tgw_route_table_tags" {
  description = "Additional tags for the TGW route table"
  default     = {}
}

variable "share_tgw" {
  description = "Whether to share your transit gateway with other accounts"
  default     = true
}

variable "auto_accept_attachments" {
  description = "Whether resource attachment requests are automatically accepted"
  default     = false
}

variable "amazon_side_asn" {
  description = "The Autonomous System Number (ASN) for the Amazon side of the gateway. By default the TGW is created with the current default Amazon ASN."
  default     = "64512"
}

variable "allow_external_principals" {
  description = "Should be true to enable Allow External Principals"
  default     = false
}

variable "ram_share_principals" {
  description = "A list of principals to share TGW with. Possible values are an AWS account ID, an AWS Organizations Organization ARN, or an AWS Organizations Organization Unit ARN"
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "tgw_tags" {
  description = "Additional tags for the TGW"
  default     = {}
}

variable "ram_tags" {
  description = "Additional tags for the RAM"
  default     = {}
}
