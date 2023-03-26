### Simple prometheus-grafana-postgres setup
Create cluster with terraform.  
Install prometheus stack with helm using provided values  
```
helm repo add prometheus-community \
https://prometheus-community.github.io/helm-charts

helm install monitoring \
prometheus-community/kube-prometheus-stack \
--values prometheus-values.yaml \
--version  45.7.1 \
--namespace monitoring \
--create-namespace
```
Install postgres with helm chart:   
```
helm repo add bitnami https://charts.bitnami.com/bitnami

helm install postgres \
bitnami/postgresql \
--values postgres-values.yaml \
--version 12.2.6 \
--namespace db \
--create-namespace
```
Deploy custom service monitor provided in `service-monitor` folder.  
Import grafana postgres dashboard: `9628`
You can port-forward services with: 
```
kubectl port-forward \
svc/monitoring-grafana 3000:80 \
-n monitoring 

kubectl port-forward \
svc/monitoring-grafana 3000:80 \
-n monitoring 
```
Clean up:
```
helm uninstall monitoring -n monitoring
helm uninstall postgres -n db
```