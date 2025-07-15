# Create VPC network
resource "google_compute_network" "vpc" {
  project      = var.project_id
  name         = var.name
  routing_mode = var.routing_mode
  # Allow only custom mode networks
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  for_each                 = var.subnets
  project                  = var.project_id
  name                     = each.key
  ip_cidr_range            = each.value.ip_range
  region                   = "europe-west3"
  network                  = google_compute_network.vpc.id
  private_ip_google_access = each.value.private_ip_google_access
  purpose                  = each.value.purpose

  # "role" is only supported for GLOBAL_MANAGED_PROXY and "REGIONAL_MANAGED_PROXY" subnets
  role = endswith(each.value.purpose, "_MANAGED_PROXY") ? "ACTIVE" : ""

  dynamic "secondary_ip_range" {
    for_each = each.value.secondary_ip_ranges
    content {
      range_name    = secondary_ip_range.value.name
      ip_cidr_range = secondary_ip_range.value.ip_range
    }
  }
}
