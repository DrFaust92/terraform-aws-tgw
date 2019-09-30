resource "aws_ec2_transit_gateway" "tgw" {
  count = "${var.create_tgw ? 1 : 0}"

  description                     = "Transit Gateway for ${var.name}"
  default_route_table_association = "${var.enable_default_route_table_association ? enable : disable}"
  default_route_table_propagation = "${var.enable_default_route_table_propagation ? enable : disable}"
  auto_accept_shared_attachments  = "${var.auto_accept_attachments ? enable : disable}"
  dns_support                     = "${var.enable_dns_support}"
  amazon_side_asn                 = "${var.amazon_side_asn}"

  tags = "${merge(map("Name", format("%s", var.name)), var.tags, var.tgw_tags)}"
}

resource "aws_ec2_transit_gateway_route_table" "tgw" {
  count = "${var.create_tgw ? 1 : 0}"

  transit_gateway_id = "${aws_ec2_transit_gateway.tgw.id}"
  tags               = "${merge(map("Name", format("%s", var.name)), var.tags, var.tgw_route_table_tags)}"
}

resource "aws_ram_resource_share" "ram_share" {
  count = "${var.create_tgw && var.share_tgw ? 1 : 0}"

  name                      = "${var.name}"
  allow_external_principals = "${var.allow_external_principals}"

  tags = "${merge(map("Name", format("%s", var.name)), var.tags, var.ram_share_principals)}"
}

resource "aws_ram_resource_association" "ram_resource_association" {
  count = "${var.create_tgw && var.share_tgw ? 1 : 0}"

  resource_arn       = "${aws_ec2_transit_gateway.tgw.arn}"
  resource_share_arn = "${aws_ram_resource_share.ram_share.id}"
}

resource "aws_ram_principal_association" "ram_principal_association" {
  count = "${var.create_tgw && var.share_tgw && length(var.ram_share_principals) > 0 ? length(var.ram_share_principals) : 0}"

  principal          = "${var.ram_share_principals[count.index]}"
  resource_share_arn = "${aws_ram_resource_share.ram_share.arn}"
}
