resource "google_compute_firewall" "firewall" {
  name          = "raman-firewall"
  network       = "default"          # Use the default network
  source_ranges = ["0.0.0.0/0"]      # Replace with restricted IP ranges for security

  # Allow ICMP traffic
  allow {
    protocol = "icmp"
  }

  # Dynamic block for TCP ports
  dynamic "allow" {
    for_each = var.port
    iterator = firewall
    content {
      protocol = "tcp"
      ports    = [firewall.value]    # Use the single value from the list
    }
  }
}

variable "port" {
  type    = list(string)
  default = ["22", "8201", "443", "80", "9500"] # List of ports
}
