output "tgw_id" {
  description = "The ID of the TGW"
  value       = "${element(concat(aws_ec2_transit_gateway.tgw.id, list("")), 0)}"
}

output "tgw_arn" {
  description = "The ARN of the TGW"
  value       = "${element(concat(aws_ec2_transit_gateway.tgw.arn, list("")), 0)}"
}

output "tgw_route_table_id" {
  description = "The ID of the TGW route table"
  value       = "${element(concat(aws_ec2_transit_gateway_route_table.tgw.id, list("")), 0)}"
}

output "ram_share_id" {
  description = "The ID of the RAM Share"
  value       = "${element(concat(aws_ram_resource_share.ram_share.id, list("")), 0)}"
}

output "ram_share_arn" {
  description = "The ARN of the RAM Share"
  value       = "${element(concat(aws_ram_resource_share.ram_share.arn, list("")), 0)}"
}

output "ram_resource_association" {
  description = "The ID of the RAM Resource Association"
  value       = "${element(concat(aws_ram_resource_association.ram_resource_association.id, list("")), 0)}"
}

output "ram_principal_association" {
  description = "List of IDs of the RAM Principal Association"
  value       = ["${aws_ram_principal_association.ram_principal_association.*.id}"]
}
