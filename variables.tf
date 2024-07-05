variable "project" {
  default = "gosky-dev"
}

# variable "credentials_file" {}
variable "gcp_credentials" {
  type = string
  sensitive = true
  description = "Google Cloud personal credentials"
}

variable "region" {
  default = "asia-east1"
}

variable "zone" {
  default = "asia-east1-b"
}