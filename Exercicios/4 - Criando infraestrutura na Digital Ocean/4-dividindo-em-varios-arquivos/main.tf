# Podemos melhorar ainda mais a organização dos nossos arquivos, separando em outros arquivos, divididos por tipos de recursos.

# Também iremos utilizar o arquivo "terraform.tfvars", que permite que passemos valores alternativos aos valores "default" que foram declarados nos blocos das variáveis.
# Isso permite que nosso código fique todo reutilizável e customizável.

# Você pode dar outro nome ao arquivo ".tfvars", mas quando executar o comando "terraform plan" ou "terraform apply" é necessário passar o arquivo diretamente na linha de comando.
# Ex: terraform apply -var-file="valor.tfvars"
# Isso é necessário, pois o Terraform utiliza o arquivo "terraform.tfvars" como padrão.

# Utilizar diferentes arquivos ".tfvars" permite que trabalhemos com o conceito de workspaces, onde podemos ter vários ambientes com a mesma configuração mas com valores de variáveis diferentes.
# https://developer.hashicorp.com/terraform/language/state/workspaces
# https://developer.hashicorp.com/terraform/cli/workspaces

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}
