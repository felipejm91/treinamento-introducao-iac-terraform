# Arquivo com a declaração dos droplets

resource "digitalocean_droplet" "server1" {
  image    = var.imagem
  name     = "server-1"
  region   = var.regiao
  size     = var.size
  ssh_keys = file(var.chave_ssh)
}

resource "digitalocean_droplet" "server2" {
  image    = var.imagem
  name     = "server-2"
  region   = var.regiao
  size     = var.size
  ssh_keys = file(var.chave_ssh)
}