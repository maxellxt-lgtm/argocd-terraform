variable "kube_context" {
  description = "Kubernetes context name from ~/.kube/config"
  type        = string
}

variable "chart_version" {
  description = "Helm Chart Version of ArgoCD: https://github.com/argoproj/argo-helm/releases"
  type        = string
  default     = "5.46.0"
}
