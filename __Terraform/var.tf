variable "node_ssh-public-key" {
  description = "ssh-rsa XXXXXX format public key for logging into agent nodes"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvHg1VQf7cOxVSSJuV1/v2ToewKe6eKcsCHRcRkiuGYaklT38hjdbgIOwBMrHMPKTP2e7NW0hpHWv7fm278hacXD7RPCshvFcos38GhlDJhrzGvBQ4/LzPmSSbBpWdBAxksibHTrJ82du8tznEqurtJJ8oLfhByffvVY2MbCekIn5Y+78ibztxUoeyLVS0b5xn76b8PO4rEbxXteyC8htuhm9YYAsnef32+kZ024umzyYB1/ADCmotSL5O8Tr1ttUXWJgh587g3qTwfrbCrL6cgSkoM1dMI6Fw5s/gep38IRH2eGsicWNBBB3QM2Ma0UY7rcVVTARKFPFBb1QOegup willa@DESKTOP-FE077PT"
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
  default     = "tst"
}

variable "cluster_clientid" {}
variable "cluster_clientsecret" {}
