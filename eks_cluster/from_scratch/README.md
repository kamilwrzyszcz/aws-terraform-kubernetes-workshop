### EKS-ALB-Autoscaler done from scratch with resources
Created to work on eu-central-1 region and availability zones. Region/zones can be easily modified (either in code or changed altogether to use variables).  
ALB deployed using helm chart from inside of terraform.  
Use output `eks_cluster_autoscaler_arn` to modify kubernetes autoscaler manifest in `kubernetes/manifests/autoscaler-manifest-from-scratch.yml`.  