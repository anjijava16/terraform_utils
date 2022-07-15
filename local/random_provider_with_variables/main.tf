resource "local_file" "welcome" {
  filename = var.filename
  content =var.contentone
}

resource "random_pet" "my-pet" {
  prefix = var.prefix
  separator = var.separator
  length = var.length
}