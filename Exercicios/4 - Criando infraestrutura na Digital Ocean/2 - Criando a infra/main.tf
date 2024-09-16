# Após a criação da chave ssh, iremos declarar nossa infraestrutura.

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
  token = "API TOKEN DE CONEXÃO COM A DIGITAL OCEAN"
}

# Declaração do primeiro servidor
# Os valores de "image", "region", "size" podem ser consultados no link abaixo
# https://slugs.do-api.dev/
resource "digitalocean_droplet" "server1" {
  image    = "ubuntu-20-04-x64"
  name     = "server-1"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"

  # Caminho para a chave pública que foi criada anteriormente. 
  # A função "file", faz com que seja utilizado o valor do arquivo em formato de texto.
  ssh_keys = file("./chave-exercicio.pub") 
}

# Declaração do segundo servidor
resource "digitalocean_droplet" "server2" {
  image    = "ubuntu-20-04-x64"
  name     = "server-2"
  region   = "nyc1"
  size     = "s-1vcpu-1gb"

  # Caminho para a chave pública que foi criada anteriormente. 
  # A função "file", faz com que seja utilizado o valor do arquivo em formato de texto.
  ssh_keys = file("./chave-exercicio.pub")
}

# Declaração do Load Balancer
resource "digitalocean_loadbalancer" "lb-1" {
  name   = "loadbalancer-1"
  region = "nyc1"

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