kubectl create namespace sonata
kubectl apply -n sonata -f sonata-resources/services
kubectl apply -n sonata -f sonata-resources/deployments
kubectl apply -n sonata -f gatekeeper/services
kubectl apply -n sonata -f gatekeeper/deployments
kubectl apply -n sonata -f cat-mano-ia-monitoring/services
kubectl apply -n sonata -f cat-mano-ia-monitoring/deployments
