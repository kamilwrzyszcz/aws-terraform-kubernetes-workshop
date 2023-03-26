module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.3"

  name = "main"
  cidr = "172.16.0.0/16"
  /*
  Requirement:
  At least two subnets in different Availability Zones. The AWS Load Balancer Controller chooses one subnet from each Availability Zone. 
  When multiple tagged subnets are found in an Availability Zone, the controller chooses the subnet whose subnet ID comes first 
  lexicographically. Each subnet must have at least eight available IP addresses.
  */
  azs             = ["eu-central-1a", "eu-central-1b"]
  private_subnets = ["172.16.1.0/24", "172.16.2.0/24"]
  public_subnets  = ["172.16.3.0/24", "172.16.4.0/24"]

  # aws load balancer controller uses tags to discover subnets
  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }

  # single nat gateway setup
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Environment = "test"
  }
}