
```
# Atividade 1 - Provisionamento de Infraestrutura Web na AWS com Terraform

Este repositório contém a infraestrutura como código (IaC) para provisionar um ambiente web na AWS, utilizando boas práticas do Terraform (módulos, workspaces e state remoto).

## Pré-requisitos
* Terraform instalado na máquina local.
* Conta na AWS (AWS Academy Learner Lab).
* Credenciais da AWS configuradas no terminal.

## Configuração do Backend
O state remoto está configurado para utilizar um bucket S3. O bucket foi criado manualmente na AWS antes da inicialização do projeto.
* **Nome do Bucket utilizado:** tiago-terraform-backend
* **Região:** us-east-1

## Variáveis Necessárias
Antes de executar o projeto, é necessário criar um arquivo `terraform.tfvars` na raiz do projeto (que é ignorado pelo Git por segurança) contendo o seu IP público no formato CIDR (/32) para liberar o acesso SSH:

```hcl
meu_ip = "SEU_IP_AQUI/32"

```

## Como executar o projeto

1.  **Inicialize o Terraform:**
    

Bash

```
terraform init

```

2.  **Crie/Selecione os Workspaces:** Este projeto utiliza dois ambientes (dev e prod).
    

Bash

```
terraform workspace new dev
terraform workspace new prod

```

3.  **Aplique a infraestrutura:** Selecione o ambiente desejado e aplique as mudanças.
    

Bash

```
terraform workspace select dev
terraform apply

```

4.  **Destrua os recursos (Limpeza):**
    

Bash

```
terraform destroy

```

## Evidências

Todas as capturas de tela comprovando a criação, o funcionamento e a destruição da infraestrutura em ambos os workspaces (dev e prod) encontram-se na pasta `evidencias` deste repositório.
