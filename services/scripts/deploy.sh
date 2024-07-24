#!/bin/bash

# Script de deploy para todos os microsserviços
kubectl apply -f ../services/user-service/deployment.yaml
kubectl apply -f ../services/user-service/service.yaml
kubectl apply -f ../services/user-service/hpa.yaml

kubectl apply -f ../services/book-service/deployment.yaml
kubectl apply -f ../services/book-service/service.yaml
kubectl apply -f ../services/book-service/hpa.yaml

kubectl apply -f ../services/loan-service/deployment.yaml
kubectl apply -f ../services/loan-service/service.yaml
kubectl apply -f ../services/loan-service/hpa.yaml

kubectl apply -f ../services/notification-service/deployment.yaml
kubectl apply -f ../services/notification-service/service.yaml
kubectl apply -f ../services/notification-service/hpa.yaml

kubectl apply -f ../services/auth-service/deployment.yaml
kubectl apply -f ../services/auth-service/service.yaml
kubectl apply -f ../services/auth-service/hpa.yaml

# Aplicar configurações de monitoramento
kubectl apply -f ../infra/monitoring/prometheus/prometheus-config.yaml
kubectl apply -f ../infra/monitoring/prometheus/prometheus-deployment.yaml
kubectl apply -f ../infra/monitoring/prometheus/prometheus-service.yaml

kubectl apply -f ../infra/monitoring/grafana/grafana-deployment.yaml
kubectl apply -f ../infra/monitoring/grafana/grafana-service.yaml

# Aplicar ingress
kubectl apply -f ../infra/networking/ingress.yaml
