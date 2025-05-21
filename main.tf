/**
 * # AWS EKS EBS CSI driver Terraform module
 *
 * A terraform module to deploy the [AWS EBS CSI driver](https://github.com/kubernetes-sigs/aws-ebs-csi-driver) on Amazon EKS cluster.
 *
 * [![Terraform validate](https://github.com/lablabs/terraform-aws-eks-ebs-csi-driver/actions/workflows/validate.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-ebs-csi-driver/actions/workflows/validate.yaml)
 * [![pre-commit](https://github.com/lablabs/terraform-aws-eks-ebs-csi-driver/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-ebs-csi-driver/actions/workflows/pre-commit.yml)
 */

locals {
  addon = {
    name      = "ebs-csi-driver"
    namespace = "kube-system"

    helm_chart_name    = "aws-ebs-csi-driver"
    helm_chart_version = "2.39.3"
    helm_repo_url      = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  }

  addon_irsa = {
    (local.addon.name) = {
      irsa_role_name_prefix = var.irsa_role_name_prefix != null ? var.irsa_role_name_prefix : local.addon.name
      irsa_policy_enabled   = local.irsa_policy_enabled
      irsa_policy           = var.irsa_policy != null ? var.irsa_policy : try(data.aws_iam_policy.this[0].policy, "")
    }
  }

  addon_values = yamlencode({
    controller = {
      serviceAccount = {
        create = module.addon-irsa[local.addon.name].service_account_create
        name   = module.addon-irsa[local.addon.name].service_account_name
        annotations = module.addon-irsa[local.addon.name].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa[local.addon.name].iam_role_attributes.arn
        } : tomap({})
      }
    }
    node = {
      serviceAccount = {
        create = module.addon-irsa[local.addon.name].service_account_create
        name   = module.addon-irsa[local.addon.name].service_account_name
        annotations = module.addon-irsa[local.addon.name].irsa_role_enabled ? {
          "eks.amazonaws.com/role-arn" = module.addon-irsa[local.addon.name].iam_role_attributes.arn
        } : tomap({})
      }
    }
    storageClasses = var.storage_classes_create ? var.storage_classes : []
  })

  addon_depends_on = []
}
