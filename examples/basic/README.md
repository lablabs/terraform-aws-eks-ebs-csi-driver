# Basic example

The code in this example shows how to use the module with basic configuration and minimal set of other resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ebs_csi_argo_helm"></a> [ebs\_csi\_argo\_helm](#module\_ebs\_csi\_argo\_helm) | ../../ | n/a |
| <a name="module_ebs_csi_argo_kubernetes"></a> [ebs\_csi\_argo\_kubernetes](#module\_ebs\_csi\_argo\_kubernetes) | ../../ | n/a |
| <a name="module_ebs_csi_disabled"></a> [ebs\_csi\_disabled](#module\_ebs\_csi\_disabled) | ../../ | n/a |
| <a name="module_ebs_csi_helm"></a> [ebs\_csi\_helm](#module\_ebs\_csi\_helm) | ../../ | n/a |
| <a name="module_ebs_without_irsa_policy"></a> [ebs\_without\_irsa\_policy](#module\_ebs\_without\_irsa\_policy) | ../../ | n/a |
| <a name="module_ebs_without_irsa_role"></a> [ebs\_without\_irsa\_role](#module\_ebs\_without\_irsa\_role) | ../../ | n/a |
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | cloudposse/eks-cluster/aws | 2.3.0 |
| <a name="module_eks_node_group"></a> [eks\_node\_group](#module\_eks\_node\_group) | cloudposse/eks-node-group/aws | 2.4.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.14.2 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
