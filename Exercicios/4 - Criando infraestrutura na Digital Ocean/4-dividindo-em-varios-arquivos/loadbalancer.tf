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

  droplet_ids = [
    digitalocean_droplet.server1,
    digitalocean_droplet.server2
  ]
}