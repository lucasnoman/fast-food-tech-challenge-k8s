provider "azurerm" {
  resource_provider_registrations = "none"
  subscription_id                 = var.subscription_id
  features {}
}

resource "azurerm_resource_group" "rg-fiap-tech-challenge" {
  name     = "fiap_tf_test"
  location = "Brazil South"
}

resource "azurerm_kubernetes_cluster" "rg-fiap-tech-challenge" {
  name                = "aks-fiap-tech-challenge"
  location            = azurerm_resource_group.rg-fiap-tech-challenge.location
  resource_group_name = azurerm_resource_group.rg-fiap-tech-challenge.name
  dns_prefix          = "aks-fiap-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.rg-fiap-tech-challenge.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.rg-fiap-tech-challenge.kube_config_raw

  sensitive = true
}
