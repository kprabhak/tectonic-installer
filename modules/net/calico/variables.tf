variable "container_images" {
  description = "Container images to use"
  type        = "map"
}

variable "cluster_cidr" {
  description = "A CIDR notation IP range from which to assign pod IPs"
  type        = "string"
}

variable "enabled" {
  description = "If set true, calico networking will be deployed"
}

variable "mtu" {
  type    = "string"
  default = 1500
}

variable "tigera_pull_secret_path" {
  type        = "string"
  description = "path to Tigera Essentials pull secret"
  default     = "/dev/null"
}
