locals {
  irsa_policy_enabled = var.irsa_policy_enabled != null ? var.irsa_policy_enabled : false
}

data "aws_iam_policy" "this" {
  count = var.enabled && var.irsa_policy == null && local.irsa_policy_enabled ? 1 : 0
  arn   = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

data "aws_iam_policy" "node" {
  count = var.enabled && var.node_irsa_policy == "" && var.node_irsa_policy_enabled ? 1 : 0
  arn   = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}
