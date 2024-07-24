#!/bin/bash

# Script para desmontar todos os recursos

# Remover serviços
kubectl delete -f ../services/user-service/deployment.yaml
kubectl delete -f ../services/user-service/service.yaml
kubectl delete -f ../services/user-service/hpa.yaml

kubectl delete -f ../services/book-service/deployment.yaml
kubectl delete -f ../services/book-service/service.yaml
kubectl delete -f ../services/book-service/hpa.yaml

kubectl delete -f ../services/loan-service/deployment.yaml
kubectl delete -f ../services/loan-service/service.yaml
kubectl delete -f ../services/loan-service/hpa.yaml

kubectl delete -f ../services/notification-service/deployment.yaml
kubectl delete -f ../services/notification-service/service.yaml
kubectl delete -f ../services/notification-service/hpa.yaml

kubectl delete -f ../services/auth-service/deployment.yaml
kubectl delete -f ../services/auth-service/service.yaml
kubectl delete -f ../services/auth-service/hpa.yaml

# Remover configurações de monitoramento
kubectl delete -f ../infra/monitoring/prometheus/prometheus-deployment.yaml
kubectl delete -f ../infra/monitoring/prometheus/prometheus-service.yaml
kubectl delete -f ../infra/monitoring/grafana/grafana-deployment.yaml
kubectl delete -f ../infra/monitoring/grafana/grafana-service.yaml

# Remover ingress
kubectl delete -f ../infra/networking/ingress.yaml