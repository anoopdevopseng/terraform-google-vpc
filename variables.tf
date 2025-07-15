####################
## INPUT VARIABLES
####################

### REQUIRED
variable "project_id" {
  description = "The GCP project ID in which the resources will be created"
  type        = string
}

variable "name" {
  type = string
  description = "Base name for the vpc. Must not contain '-' or '_'"
}

variable "routing_mode" {
  type = string
  default = "GLOBAL"
}

variable "subnets" {
  description = "All subnets that will be created"
  type = map(object({
    ip_range = string,
    purpose  = optional(string, "PRIVATE")
    private_ip_google_access = optional(bool, true)
    secondary_ip_ranges = optional(list(object({
      name     = string,
      ip_range = string,
    }, )), [])
  }))
}

variable "build_project_self_link" {
  description = "The self link of the project hosting the internal GitHub runners, allows private connectivity"
  type        = string
  default     = null
}
