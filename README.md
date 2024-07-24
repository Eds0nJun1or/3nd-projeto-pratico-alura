# 3º Projeto Prático - DevOps: Implementação de Microsserviços com Kubernetes (K8s) na AWS (EKS)

## Desafio

Este projeto prático tem como objetivo projetar e implementar uma aplicação utilizando arquitetura de microsserviços no Kubernetes (K8s) no provedor de nuvem da AWS (EKS). As etapas incluem:

a. **Design de Microsserviços**: Identificar os componentes da aplicação que serão implantados em microsserviços.

b. **Implementação no K8s**: Criar e implantar os microsserviços no Kubernetes da AWS (EKS).

c. **Escalabilidade e Tolerância a Falhas**: Configurar a escalabilidade automática e a tolerância a falhas para os microsserviços.

d. **Atualização e Monitoramento**: Implementar procedimentos de atualização e monitorar o desempenho dos microsserviços no K8s.

Este projeto visa demonstrar a habilidade de projetar, implementar e gerenciar uma aplicação em um ambiente de microsserviços utilizando ferramentas e práticas modernas de DevOps.

## Estrutura do Projeto

A estrutura do projeto é organizada da seguinte forma:

project-root/
├── services/
│   ├── user-service/
│   ├── book-service/
│   ├── loan-service/
│   ├── notification-service/
│   └── auth-service/
├── infra/
│   ├── eks/
│   ├── monitoring/
│   └── networking/
├── scripts/
├── .github/
│   └── workflows/
├── README.md
└── .gitignore

## Serviços

Cada microsserviço possui sua própria pasta dentro de `services/`, contendo:

- `src/`: Código-fonte do serviço.
- `Dockerfile`: Arquivo para construir a imagem Docker do serviço.
- `deployment.yaml`: Configuração de Deployment do Kubernetes.
- `service.yaml`: Configuração de Service do Kubernetes.
- `hpa.yaml`: Configuração do Horizontal Pod Autoscaler (HPA).

### Exemplo de Serviço

O serviço `user-service/` contém arquivos para configurar e implantar o microsserviço de gerenciamento de usuários.

## Infraestrutura

A pasta `infra/` contém configurações e scripts para:

- **EKS**: Configuração do cluster EKS e grupos de nós.
- **Monitoramento**: Configuração de Prometheus e Grafana para monitoramento e visualização de métricas.
- **Networking**: Configuração de Ingress e scripts de configuração de DNS.

## Scripts

Os scripts localizados em `scripts/` ajudam na automação das operações do projeto:

- `deploy.sh`: Implanta todos os microsserviços e configurações no Kubernetes.
- `teardown.sh`: Remove todos os microsserviços e configurações do Kubernetes.
- `update.sh`: Atualiza os microsserviços e configurações no Kubernetes.

## CI/CD

O workflow de CI/CD está configurado com GitHub Actions para automatizar o processo de build e deploy:

- **Arquivo**: `.github/workflows/build-and-deploy.yaml`

Este workflow realiza as seguintes etapas:

1. Checkout do código.
2. Configuração das credenciais AWS.
3. Instalação e configuração do `kubectl`.
4. Atualização do kubeconfig.
5. Deploy dos microsserviços e configurações no EKS.

## Configuração

### Pré-requisitos

Certifique-se de ter os seguintes pré-requisitos instalados e configurados:

- AWS CLI
- kubectl
- Docker
- EKS CLI (eksctl)
- GitHub Actions Secrets configurados (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`)

### Configuração do Cluster EKS

1. Crie o cluster EKS usando o arquivo `infra/eks/cluster.yaml`:
   ```sh
   eksctl create cluster -f infra/eks/cluster.yaml
   ```

2. Configure os grupos de nós usando o arquivo `infra/eks/nodegroup.yaml`:
   ```sh
   eksctl create nodegroup -f infra/eks/nodegroup.yaml
   ```

### Configuração do Monitoramento

1. Aplique a configuração do Prometheus e Grafana:
   ```sh
   kubectl apply -f infra/monitoring/prometheus/prometheus-config.yaml
   kubectl apply -f infra/monitoring/prometheus/prometheus-deployment.yaml
   kubectl apply -f infra/monitoring/prometheus/prometheus-service.yaml
   kubectl apply -f infra/monitoring/grafana/grafana-deployment.yaml
   kubectl apply -f infra/monitoring/grafana/grafana-service.yaml
   ```

### Configuração de DNS

1. Execute o script de configuração de DNS:
   ```sh
   bash infra/networking/dns/dns-setup.sh
   ```

## Deploy

Para implantar todos os microsserviços e configurações, execute o script `deploy.sh`:

```sh
bash scripts/deploy.sh
```

## Atualizações

Para atualizar os microsserviços e configurações, execute o script `update.sh`:

```sh
bash scripts/update.sh
```

## Teardown

Para remover todos os microsserviços e configurações, execute o script `teardown.sh`:

```sh
bash scripts/teardown.sh
```

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests para melhorias e correções.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
