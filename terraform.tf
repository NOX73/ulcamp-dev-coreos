# Configure the DigitalOcean Provider

variable "do_token" {}

provider "digitalocean" {
    token = "${var.do_token}"
}

resource "digitalocean_droplet" "demo-entrypoint" {
    image = "coreos-alpha"
    name = "demo-entrypoint"
    region = "ams3"
    size = "1gb"
    private_networking = "true"
    user_data = "${file("user-data.entrypoint")}"
    ssh_keys = [581252]
}

resource "digitalocean_droplet" "demo-db" {
    count = 1
    image = "coreos-alpha"
    name = "demo-db"
    region = "ams3"
    size = "1gb"
    private_networking = "true"
    user_data = "${file("user-data.db")}"
    ssh_keys = [581252]
}

resource "digitalocean_droplet" "demo-node" {
    count = 2
    image = "coreos-alpha"
    name = "demo-node"
    region = "ams3"
    size = "1gb"
    private_networking = "true"
    user_data = "${file("user-data.node")}"
    ssh_keys = [581252]
}
