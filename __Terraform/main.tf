resource "azurerm_resource_group" "test" {
  name     = "${var.environment-prefix}${var.service-prefix}"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "test" {
  name                = "${azurerm_resource_group.test.name}clu"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  dns_prefix          = "${azurerm_resource_group.test.name}agt"

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

  tags {
    Owner       = "wa"
    Environment = "Development"
  }
}
