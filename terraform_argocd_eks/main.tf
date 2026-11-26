provider "helm" {
  kubernetes {
    config_path    = pathexpand("~/.kube/config")
    config_context = var.kube_context
  }
}

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm" # Official Chart Repo
  chart            = "argo-cd"                              # Official Chart Name
  namespace        = "argocd"
  version          = var.chart_version
  create_namespace = true
  values           = [file("${path.module}/argocd.yaml")]
  timeout = 900
}
