# IMPORTANT: Add addon specific variables here
variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "storage_classes_create" {
  type        = bool
  default     = true
  description = "Whether to create Storage Classes"
}

variable "storage_classes" {
  type = list(any)
  default = [
    {
      "name" : "ebs-csi-gp3"
      "annotations" : {
        "storageclass.kubernetes.io/is-default-class" : "true"
      }
      "allowVolumeExpansion" : true
      "volumeBindingMode" : "WaitForFirstConsumer"
      "reclaimPolicy" : "Delete"
      "parameters" : {
        "type" : "gp3"
        "encrypted" : "true"
      }
    }
  ]
  description = "List of the custom Storage Classes definitions"
}

variable "node_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create IRSA role and annotate service account for the node"
}

variable "node_irsa_policy" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to node role. Where key is arbitrary id and value is policy arn"
}

variable "node_irsa_role_name_prefix" {
  type        = string
  default     = ""
  description = "IRSA role name prefix. Either `node_irsa_role_name_prefix` or `node_irsa_role_name` must be set. Defaults to `\"\"`."
}
