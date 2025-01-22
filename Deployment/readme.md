Install an Ingress Controller (if not already installed): If you don’t already have an ingress controller, you can use a lightweight ingress controller such as NGINX. You can install it by running:


kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml


kubectl get svc -n ingress-nginx
after add host ip address
