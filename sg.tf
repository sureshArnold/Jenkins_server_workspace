

resource "aws_security_group" "jenkins" {
  count = length(var.sg_inbound_rules) + length(var.sg_outbound_rules) > 0 ? 1 : 0
  name  = var.security_group_name
  description = "Security group for Jenkins server"
}

resource "aws_security_group_rule" "inbound" {
  count = length(var.sg_inbound_rules)
  type              = "ingress"
  from_port         = var.sg_inbound_rules[count.index].from_port
  to_port           = var.sg_inbound_rules[count.index].to_port
  protocol          = var.sg_inbound_rules[count.index].protocol
  cidr_blocks       = var.sg_inbound_rules[count.index].cidr_blocks
  security_group_id = aws_security_group.jenkins[0].id
}

resource "aws_security_group_rule" "outbound" {
  count = length(var.sg_outbound_rules) 
  type              = "egress"
  from_port         = var.sg_outbound_rules[count.index].from_port
  to_port           = var.sg_outbound_rules[count.index].to_port
  protocol          = var.sg_outbound_rules[count.index].protocol
  cidr_blocks       = var.sg_outbound_rules[count.index].cidr_blocks
  security_group_id = aws_security_group.jenkins[0].id
}






