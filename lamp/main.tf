resource "google_compute_instance" "default" {
  name         = "${var.name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
 boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
network_interface {
    network = "${var.network}"
access_config {
      // Ephemeral IP
    }
}
metadata_startup_script = "sudo apt-get update; sudo apt install ca-certificates apt-transport-https -y; sudo apt-get install apache2 -y; sudo apt-get install mysql-server -y; sudo apt-get install wget -y; wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -; sudo apt update; sudo apt install php php-mysql libapache2-mod-php -y;"

tags = ["http-server"]
}
