resource "kubernetes_manifest" "argocd_app" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = "proxima-centauri-cluster"
      namespace = "argocd"
    }
    spec = {
      project = "default"
      source = {
        repoURL        = "https://github.com/wojtacha/cluster.proxima-centauri.git"
        targetRevision = "master"
        path           = "cluster"
      }
      destination = {
        server    = "https://kubernetes.default.svc"
        namespace = "default"
      }
      syncPolicy = {
        automated = {
          prune      = true
          selfHeal   = true
          allowEmpty = false
        }

        retry = {
          limit = 5

          backoff = {
            duration    = "10s"
            factor      = 2
            maxDuration = "3m"
          }
        }

        syncOptions = [
          "CreateNamespace=true",
          "ApplyOutOfSyncOnly=true",
          "ServerSideApply=true",
          "PrunePropagationPolicy=foreground",
          "PruneLast=true"
        ]
      }
    }
  }
}
