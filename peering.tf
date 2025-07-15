# Creates peering between the created VPC and the build project VPC
# Enables private connectivity for GitHub runners
resource "google_compute_network_peering" "build_to_customer" {
  count        = var.build_project_self_link != null && var.build_project_self_link != "" ? 1 : 0
  name         = "build-to-customer-peering"
  network      = var.build_project_self_link
  peer_network = google_compute_network.vpc.self_link
}

resource "google_compute_network_peering" "customer_to_build" {
  count        = var.build_project_self_link != null && var.build_project_self_link != "" ? 1 : 0
  name         = "customer-to-build-peering"
  network      = google_compute_network.vpc.self_link
  peer_network = var.build_project_self_link
}