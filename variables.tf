
variable "creation_token" {
  description = "Name to be used as specific creation token (see: https://docs.aws.amazon.com/efs/latest/ug/API_CreateFileSystem.html)"
  type        = string
  default     = null
}

variable "backup" {
  description = "If true, the AWS EFS Backup will be enabled"
  type        = bool
  default     = false
}

variable "enabled" {
  description = "Enable or disable AWS EFS"
  type        = bool
  default     = true
}

variable "encrypted" {
  description = "If true, the AWS EFS will be encrypted"
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "If set, use a specific KMS key for the AWS EFS"
  type        = string
  default     = null
}

variable "lifecycle_policy" {
  description = "Lifecycle Policy for the AWS EFS"
  type = list(object({
    transition_to_ia = string
  }))
  default = []
}

variable "name" {
  description = "Name to be used on all resources as prefix"
  type        = string
}

variable "performance_mode" {
  description = "AWS EFS performance mode."
  type        = string
  default     = null
}

variable "provisioned_throughput_in_mibps" {
  description = "The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with throughput_mode set to provisioned."
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "A list of VPC Subnet IDs to launch in"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "throughput_mode" {
  description = "Throughput mode for AWS EFS"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}