# Podemos melhorar esse arquivo com a utilização de variáveis, para deixar o código reutilizável.

# Bloco de declaração das configurações do Terraform.
# Aqui pode ser definido a versão do terraform, o backend que será utilizado e os providers
# https://developer.hashicorp.com/terraform/language/terraform
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Declaração do bloco de provider da Digital Ocean
# Para gerar a API TOKEN de conexão, siga a documentação abaixo
# https://docs.digitalocean.com/reference/api/create-personal-access-token/
provider "digitalocean" {
  token = var.do_token
}

# Declaração do primeiro servidor
# Os valores de "image", "region", "size" podem ser consultados no link abaixo
# https://slugs.do-api.dev/
resource "digitalocean_droplet" "server1" {
  image    = var.imagem
  name     = "server-1"
  region   = var.regiao
  size     = var.size

  # Caminho para a chave pública que foi criada anteriormente. 
  # A função "file", faz com que seja utilizado o valor do arquivo em formato de texto.
  ssh_keys = file(var.chave_ssh)
}

# Declaração do segundo servidor
resource "digitalocean_droplet" "server2" {
  image    = var.imagem
  name     = "server-2"
  region   = var.regiao
  size     = var.size

  # Caminho para a chave pública que foi criada anteriormente. 
  # A função "file", faz com que seja utilizado o valor do arquivo em formato de texto.
  ssh_keys = file(var.chave_ssh)
}

# Declaração do Load Balancer
resource "digitalocean_loadbalancer" "lb-1" {
  name   = "loadbalancer-1"
  region = var.regiao

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  # IDs dos servidores criados que serão conectados ao Load Balancer
  droplet_ids = [
    digitalocean_droplet.server1,
    digitalocean_droplet.server2
  ]
}

variable "do_token" {
  default     = ""
  type        = string
  description = "API token de conexão com a Digital Ocean"
}

variable "imagem" {
  default     = "ubuntu-20-04-x64"
  type        = string
  description = "Imagem do SO que será utilizado nos servidores"
}

variable "regiao" {
  default     = "nyc1"
  type        = string
  description = "Região que será criado o recurso"
}

variable "size" {
  default     = "s-1vcpu-1gb"
  type        = string
  description = "Tamanho dos servidores"
}

variable "chave_ssh" {
  default = "DIRETORIO_ARQUIVO/chave-exercicio.pub"
}