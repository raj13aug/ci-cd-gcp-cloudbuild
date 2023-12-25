locals {
  services = [
    "sourcerepo.googleapis.com",
    "cloudbuild.googleapis.com",
  ]
}


resource "google_project_service" "enabled_service" {
  for_each = toset(local.services)
  project  = var.project_id
  service  = each.key
}


resource "google_sourcerepo_repository" "repo" {
  depends_on = [
    google_project_service.enabled_service["sourcerepo.googleapis.com"]
  ]
  name = "${var.namespace}-repo"
}