#!/usr/bin/env bash
#
# Este script permite el despliegue de OpenFaaS a través de la 
# herramienta 'kubectl'
#
# Author: John Sanabria - john.sanabria@correounivalle.edu.co
# Date: 2020-06-11
# References:
# - https://docs.openfaas.com/deployment/kubernetes/
#
git clone https://github.com/openfaas/faas-netes
kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml
# generate a random password
PASSWORD=$(head -c 12 /dev/urandom | shasum| cut -d' ' -f1)

kubectl -n openfaas create secret generic basic-auth \
--from-literal=basic-auth-user=admin \
--from-literal=basic-auth-password="$PASSWORD"

