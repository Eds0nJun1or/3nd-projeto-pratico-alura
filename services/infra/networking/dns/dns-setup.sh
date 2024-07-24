#!/bin/bash

# Exemplo de script para configurar DNS usando AWS Route 53

# Defina as variáveis corretamente
HOSTED_ZONE_ID="Z3P5QSUBK4POTI"
RECORD_NAME="networking.k8s.io/v1"
SERVICE_NAME="aws-eks-k8s"
NAMESPACE="default"

# Obtenha o hostname do ELB criado pelo EKS
EKS_ELB_HOSTNAME=$(kubectl get svc -n $default $aws-eks-k8s -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')

# Verifique se o hostname foi obtido com sucesso
if [ -z "$EKS_ELB_HOSTNAME" ]; then
  echo "Erro: Não foi possível obter o hostname do ELB."
  exit 1
fi

# Atualize o registro DNS no Route 53
aws route53 change-resource-record-sets --hosted-zone-id $HOSTED_ZONE_ID --change-batch "
{
  \"Comment\": \"Atualizar registro para refletir o novo nome de host EKS ELB\",
  \"Changes\": [
    {
      \"Action\": \"UPSERT\",
      \"ResourceRecordSet\": {
        \"Name\": \"$RECORD_NAME\",
        \"Type\": \"CNAME\",
        \"TTL\": 300,
        \"ResourceRecords\": [
          {
            \"Value\": \"$EKS_ELB_HOSTNAME\"
          }
        ]
      }
    }
  ]
}
"