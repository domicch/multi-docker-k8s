Step 1:
Buy a domain nam from domains.google.com

Step 2:
Install Cert manager to GCP cluster. This is for auto renew cert in the cluster
github.com/jetstack/cert-manager
Execute in GCP cloud console:

kubectl create namespace cert-manager
helm repo add jetstack https://charts.jetstack.io
helm repo update

helm install \
cert-manager jetstack/cert-manager \
--namespace cert-manager \
--version v1.1.0 \
# --set installCRDs=true

Step 3:
Create the configuration files of cert-manager according to domain acquired. 
Refer to k8s/project/cert-manager-issuer.yaml and cert-manager-certificate.yaml

Step 4:
Apply the yaml files to k8s cluster first to let the certificate verification done first

