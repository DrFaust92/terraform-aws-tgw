output "tgw_id" {
  description = "The ID of the TGW"
  value       = "${element(concat(aws_ec2_transit_gateway.tgw.id), 0)}"
}

output "tgw_arn" {
  description = "The ARN of the TGW"
  value       = "${element(concat(aws_ec2_transit_gateway.tgw.arn), 0)}"
}

output "tgw_route_table_id" {
  description = "The ID of the TGW route table"
  value       = "${element(concat(aws_ec2_transit_gateway_route_table.tgw.id, list("")), 0)}"
}
