sleep 20
EXTERNAL_IP=$(kubectl get svc --output=jsonpath='{.items[?(@.status.loadBalancer.ingress)].status.loadBalancer.ingress[0].ip}')
echo "REACT_APP_API_BASE_URL=http://$EXTERNAL_IP/" > ./Electronic/.env