locals {
  k8s_path = "~/.kube/k0s.yaml"
}

provider "helm" {
  kubernetes = {
    config_path = local.k8s_path
  }
}

provider "kubernetes" {
  config_path = local.k8s_path
}
