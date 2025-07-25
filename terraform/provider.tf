locals {
  k8s_path = "~/.kube/k0s.yaml"
}

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.24" # Use whatever is current/stable for you
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0.2"
    }
  }
}
provider "helm" {
  kubernetes = {
    config_path = local.k8s_path
  }
}

provider "kubernetes" {
  config_path = local.k8s_path
}
