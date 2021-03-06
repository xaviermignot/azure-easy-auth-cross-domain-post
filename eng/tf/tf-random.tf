resource "random_pet" "suffix" {
  length = 1
}

locals {
  suffix = "cross-post-${random_pet.suffix.id}"
}

output "random_suffix" {
  value = local.suffix
}
