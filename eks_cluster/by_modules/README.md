### EKS-ALB-Autoscaler done with open-source modules
Along with example user and assumable role to control cluster.  
ALB deployed using helm chart from inside of terraform.
Auto scaler can be tested simply by creating more replicas of the example app deployment.  
Created to work on eu-central-1 region and availability zones. Region/zones can be easily modified (either in code or changed altogether to use variables).    