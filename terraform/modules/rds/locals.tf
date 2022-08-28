locals {
  private_subnet_ids = (length(var.private_subnet_ids) > 1) ? var.private_subnet_ids : [var.private_subnet_ids[0], var.private_subnet_ids[0]]
}