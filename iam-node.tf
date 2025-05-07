data "aws_iam_policy" "node" {
  count = var.enabled && var.node_irsa_policy == null && var.node_irsa_policy_enabled ? 1 : 0
  arn   = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}
