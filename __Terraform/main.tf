resource "random_pet" "name" {
  length = 1
  prefix = "${var.environment-prefix}${var.service-prefix}"
}

resource "azurerm_resource_group" "rg" {
  name     = "${random_pet.name.id}"
  location = "West Europe"
  tags = "${var.tags}"
} 

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  dns_prefix          = "${azurerm_resource_group.rg.name}agt"

  linux_profile {
    admin_username = "${var.node_username}"

    ssh_key {
      key_data = "${var.node_ssh-public-key}"
    }
  }

  agent_pool_profile {
    name            = "default"
    count           = 2
    vm_size         = "Standard_D2_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "${var.cluster_clientid}"
    client_secret = "${var.cluster_clientsecret}"
  }

  tags = "${var.tags}"
}
