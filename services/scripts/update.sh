#!/bin/bash

# Script para atualizar todos os microsserviços
kubectl apply -f ../services/user-service/deployment.yaml
kubectl apply -f ../services/book-service/deployment.yaml
kubectl apply -f ../services/loan-service/deployment.yaml
kubectl apply -f ../services/notification-service/deployment.yaml
kubectl apply -f ../services/auth-service/deployment.yaml

# Atualizar configurações de monitoramento
kubectl apply -f ../infra/monitoring/prometheus/prometheus-config.yaml
kubectl apply -f ../infra/monitoring/prometheus/prometheus-deployment.yaml
kubectl apply -f ../infra/monitoring/prometheus/prometheus-service.yaml
kubectl apply -f ../infra/monitoring/grafana/grafana-deployment.yaml
kubectl apply -f ../infra/monitoring/grafana/grafana-service.yaml

# Atualizar ingress
kubectl apply -f ../infra/networking/ingress.yaml