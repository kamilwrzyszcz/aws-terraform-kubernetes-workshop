#!/bin/bash
for i in {1..10};
    do curl $(terraform output -raw lb_dns_name);
 done