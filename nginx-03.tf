resource "digitalocean_droplet" "nginx-03" {
    image = "ubuntu-18-04-x64"
    name = "nginx-03"
    region = "nyc1"
    size = "s-1vcpu-1gb"
    private_networking = true
    ssh_keys = [
      var.ssh_fingerprint
    ]

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "sudo apt-get -y install nginx"
    ]
  }
}
