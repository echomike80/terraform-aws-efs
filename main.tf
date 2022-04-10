resource "aws_efs_file_system" "this" {
  count             = var.enabled ? 1 : 0
  creation_token    = var.creation_token != null ? var.creation_token : var.name

  encrypted     = var.encrypted
  kms_key_id    = var.kms_key_id

  performance_mode                  = var.performance_mode
  provisioned_throughput_in_mibps   = var.provisioned_throughput_in_mibps
  throughput_mode                   = var.throughput_mode

  dynamic "lifecycle_policy" {
    for_each = var.lifecycle_policy
    content {
      transition_to_ia = lookup(lifecycle_policy.value, "transition_to_ia", null)
    }
  }

  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )
}

resource "aws_efs_mount_target" "this" {
  count             = var.enabled && length(var.subnet_ids) > 0 ? length(var.subnet_ids) : 0
  file_system_id    = aws_efs_file_system.this[0].id
  subnet_id         = var.subnet_ids[count.index]
  security_groups   = var.vpc_security_group_ids
}

resource "aws_efs_backup_policy" "this" {
  count             = var.enabled ? 1 : 0
  file_system_id    = aws_efs_file_system.this[0].id

  backup_policy {
    status = var.backup ? "ENABLED" : "DISABLED"
  }
}