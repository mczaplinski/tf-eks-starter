resource "random_password" "argocd" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "bcrypt_hash" "argo" {
  cleartext = random_password.argocd.result
}

module "k8s-addons" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints//modules/kubernetes-addons"

  eks_cluster_id       = module.eks.cluster_name
  eks_cluster_endpoint = module.eks.cluster_endpoint
  eks_oidc_provider    = module.eks.oidc_provider
  eks_cluster_version  = module.eks.cluster_version

  enable_argocd = true

  argocd_helm_config = {
    set_sensitive = [
      {
        name  = "configs.secret.argocdServerAdminPassword"
        value = bcrypt_hash.argo.id
      }
    ]
  }

  keda_helm_config = {
    values = [
      {
        name  = "serviceAccount.create"
        value = "false"
      }
    ]
  }

  argocd_manage_add_ons = true

  argocd_applications = {
    addons = {
      path               = "app/hello/chart"
      repo_url           = "https://github.com/mczaplinski/tf-eks-starter.git"
      add_on_application = true
    }
  }

  enable_amazon_eks_aws_ebs_csi_driver  = false
  enable_aws_for_fluentbit              = false
  aws_for_fluentbit_create_cw_log_group = false
  enable_cert_manager                   = false
  enable_cluster_autoscaler             = false
  enable_karpenter                      = false
  enable_keda                           = false
  enable_metrics_server                 = false
  enable_prometheus                     = false
  enable_traefik                        = false
  enable_vpa                            = false
  enable_yunikorn                       = false
  enable_argo_rollouts                  = false

  # tags = local.tags
}