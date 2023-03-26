data "aws_iam_openid_connect_provider" "cluster_oidc_arn" {
  arn = module.eks.oidc_provider_arn
}
data "aws_iam_openid_connect_provider" "cluster_oidc_url" {
  url = "https://${module.eks.oidc_provider}"
}
