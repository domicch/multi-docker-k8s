#/bin/sh
kubectl create secret generic pgpassword --from-literal PGPASSWORD=postgres_password
