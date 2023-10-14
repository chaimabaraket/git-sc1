FILE_PATH="${1:-"."}"
NAMESPACE="default"

# Config files
kubectl delete -f "$FILE_PATH/redis-cluster-configmap.yml"
echo "✅ Redis ConfigMap is deleted"
kubectl delete -f "$FILE_PATH/redis-cluster-init-configmap.yml" 
echo "✅ Redis scripts ConfigMap is deleted"
# Services
kubectl delete -f "$FILE_PATH/redis-cluster-service.yml"
echo "✅ Redis & Sentinel services are deleted"
# Redis and Sentinel StatefulSets
kubectl delete -f "$FILE_PATH/redis-cluster-sts.yml"
echo "✅ Redis & Sentinel statefulsets are deleted"
echo "Redis&Sentinel cluster deleted 💯"
