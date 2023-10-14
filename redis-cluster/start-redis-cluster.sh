FILE_PATH="${1:-"."}"
NAMESPACE="default"

# Config files
kubectl apply -f "$FILE_PATH/redis-cluster-configmap.yml"
echo "✅ Redis ConfigMap is created"
kubectl apply -f "$FILE_PATH/redis-cluster-init-configmap.yml" 
echo "✅ Redis Init ConfigMap is created"
# Services
kubectl apply -f "$FILE_PATH/redis-cluster-service.yml"
echo "✅ Redis & Sentinel services are created"
# Redis and Sentinel StatefulSets
kubectl apply -f "$FILE_PATH/redis-cluster-sts.yml"
echo "✅ Redis & Sentinel statefulsets are created"

kubectl wait --namespace=default \
             --for=condition=ready pod \
             --selector=app=redis \
             --timeout=280s
echo "Redis&Sentinel cluster created 💯"
