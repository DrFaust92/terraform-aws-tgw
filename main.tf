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
