# Outputs
output "vpc" {
  description = "The created VPC network"
  value       = google_compute_network.vpc
}

output "subnets" {
  description = "The created subnets for the VPC network"
  value       = google_compute_subnetwork.subnet
}
