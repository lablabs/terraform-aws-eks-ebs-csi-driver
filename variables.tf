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
