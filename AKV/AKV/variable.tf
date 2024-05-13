variable "region" {
  description = "The Azure region where resources will be deployed."
  default     = "UK South"
}

variable "kv-name" {
  description = "Key vault name."
  default     = "aktestingvaultmay"
}

variable "RG" {
  description = "resource_group"
  default     = "vault-testing"
}
