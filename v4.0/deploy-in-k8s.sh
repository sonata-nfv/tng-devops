kubectl apply -f sonata-resources/services
kubectl apply -f sonata-resources/deployments
kubectl apply -f gatekeeper/services
kubectl apply -f gatekeeper/deployments
sleep 60
kubectl apply -f database-population/jobs
kubectl apply -f cat-mano-ia-monitoring/services
kubectl apply -f cat-mano-ia-monitoring/deployment
