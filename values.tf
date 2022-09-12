locals {
  values_default = yamlencode({
    "controller" : {
      "serviceAccount" : {
        "create" : var.service_account_create
        "name" : var.service_account_name
        "annotations" : {
          "eks.amazonaws.com/role-arn" : local.irsa_role_create ? aws_iam_role.this[0].arn : ""
        }
      }
    }
    "node" : {
      "serviceAccount" : {
        "create" : false
        "name" : var.service_account_name
        "annotations" : {
          "eks.amazonaws.com/role-arn" : local.irsa_role_create ? aws_iam_role.this[0].arn : ""
        }
      }
    }
    "storageClasses" : var.storage_classes_create ? var.storage_classes : []
  })
}

data "utils_deep_merge_yaml" "values" {
  count = var.enabled ? 1 : 0
  input = compact([
    local.values_default,
    var.values
  ])
}
