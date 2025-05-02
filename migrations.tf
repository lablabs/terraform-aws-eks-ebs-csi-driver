moved {
  from = helm_release.argo_application[0]
  to   = module.addon.helm_release.argo_application[0]
}

moved {
  from = aws_iam_role.this[0]
  to   = module.addon-irsa["ebs-csi-driver"].aws_iam_role.this[0]
}

moved {
  from = aws_iam_policy.this[0]
  to   = module.addon-irsa["ebs-csi-driver"].aws_iam_policy.this[0]
}

moved {
  from = aws_iam_role_policy_attachment.this[0]
  to   = module.addon-irsa["ebs-csi-driver"].aws_iam_role_policy_attachment.this[0]
}
