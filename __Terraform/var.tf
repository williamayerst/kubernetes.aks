variable "node_ssh-public-key" {
  description = "ssh-rsa XXXXXX format public key for logging into agent nodes"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxe4NWYMdV9Hdyk5UrKBhK5UdBYUG8cjrXAfJVw8Ekdw7UtTfJNAGsUUyCuqmlCgSMHJNhjcWbpmuHwuDQ812K3Cz2IRgXNb0hYrebRQaalSYZiMAEHhzWZ6veluluQ70IJ2a0l9uX3YQ5iH0+g89kgoAzsSvOZRVURcRRqs6hphaQ3XLU9cabioS/vjxD4TIsWYR6GtUc5w/4NfQgald4V1rk9dGkXHp3JyD26eEJDdIgZ1jNqKcKtMQezzPZPonEG6abXxMB3a+tddSKHMs0+G0Y/EVzkShBD38/TFXjuhsW7g8QO6DGwnuTxpzCI7smwMxc8zmbhKszNOHZW/ZB"
}

variable "node_username" {
  description = "username for logging into agent nodes"
  default     = "jbramwell"
}

variable "service-prefix" {
  description = "Tagging all objects with this prefix"
  default     = "aks"
}

variable "environment-prefix" {
  description = "Tagging all objects with this prefix"
  default     = "dev"
}


variable "tags" {
  type = "map"
  default = {
    environment = "Development"
    project = "MF-07"
    deploymentOwner = "William Ayerst"
  }
}

variable "cluster_clientid" {}
variable "cluster_clientsecret" {}


