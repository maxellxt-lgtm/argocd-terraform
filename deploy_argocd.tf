module "argocd_dev" {
  source           = "./terraform_argocd_eks"
  kube_context     = "demo-dev"
  chart_version    = "5.46.7"
}


module "argocd_prod" {
  source           = "./terraform_argocd_eks"
  kube_context     = "demo-prod"
  chart_version    = "5.46.2"
}


# Can be deployed ONLY after ArgoCD deployment: depends_on = [module.argocd_dev]
module "argocd_dev_root" {
  source             = "./terraform_argocd_root_eks"
  kube_context       = "demo-dev"
  git_source_path    = "demo-dev/applications"
  git_source_repoURL = "git@github.com:maxellxt-lgtm/argocd.git"

  depends_on = [module.argocd_dev]
}

# Can be deployed ONLY after ArgoCD deployment: depends_on = [module.argocd_prod]
module "argocd_prod_root" {
  source             = "./terraform_argocd_root_eks"
  kube_context       = "demo-prod"
  git_source_path    = "demo-prod/applications"
  git_source_repoURL = "git@github.com:maxellxt-lgtm/argocd.git"

  depends_on = [module.argocd_prod]
}
