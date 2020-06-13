resource "digitalocean_loadbalancer" "www-lb" {
  name   = "www-lb"
  region = "nyc1"

  forwarding_rule {
    entry_port      = 80
    entry_protocol  = "http"
    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 80
    protocol = "tcp"
  }

  droplet_ids = [ 195912628,195913030 ]
}

