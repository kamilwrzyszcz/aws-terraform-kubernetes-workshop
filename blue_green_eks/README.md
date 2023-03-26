### Simple EKS cluster with assumable admin role and blue-green traffic split
Simple EKS cluster provisioned with terraform and blue-green traffic split defined in ingress yaml manifest.  
Set images in deployments. Any echo server will do.  
Traffic split done by annotation action in ingress manifest. Percentage can be modified there.  