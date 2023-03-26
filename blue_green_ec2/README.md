### Blue-green deployment on EC2 instances using target groups and alb default forward action.
Controled with variables inside `variables.tf` and locals in `main.tf`.  
It creates EC2 instances (blue and green) with nginx and static html page (with `blue version 1.0 - <instance number>!` and `green version 1.1 - <instance number>!` messages respectively).  
`loop_command.sh` can be used to hit the instances and check traffic split configured by specifying one of the values present in locals during `terraform apply`.  
So for example run it with: `terraform apply -var enable_green_env=true -var blue_instance_count=1 -var green_instance_count=1 -var traffic_distribution=split` and then run `./loop_command.sh`.  