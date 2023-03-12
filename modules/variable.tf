variable "cluster_name" {
  type        = string
  description = "description"
}
variable "region" {
  type        = string
  description = "description"
}

variable "cluster_version" {
  type        = string
  description = "version to use for the EKS cluster"
}
variable "vpc_id" {
  type        = string
  default     = ""
  description = "ID of the VPC where the cluster and its nodes will be provisioned	"
}
variable "subnet_ids" {
  type        = list(string)
  description = " subnet_ids"
}
variable "iam_role_additional_policies" {
  type        = list(string)
  description = "Additional policies to be added to the IAM role"
}
variable "self_managed_node_groups" {
  type = any
}
variable "instance_type" {
  type = string

}
variable "cluster_endpoint_private_access" {
  type = bool

}
variable "cluster_endpoint_public_access" {
  type = bool
}








