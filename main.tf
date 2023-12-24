locals {
  services = [
    "sourcerepo.googleapis.com",
    "cloudbuild.googleapis.com",
  ]
}


locals {
  triggering_images = {
    example = {
      image_name    = "europe-west4-docker.pkg.dev/${var.project_id}/third-party/example"
      variable_name = "example_image"
    }
  }
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

resource "google_cloudbuild_trigger" "trigger" {
  depends_on = [
    google_project_service.enabled_service["cloudbuild.googleapis.com"]
  ]
  trigger_template {
    branch_name = "master"
    repo_name   = google_sourcerepo_repository.repo.name
  }
  build {
    step {
      name       = "gcr.io/cloud-builders/git"
      entrypoint = "bash"
      args = [
        "-c",
        <<-EOT
            ...
            echo "testing file"" > variables.auto.tfvars
            git add variables.auto.tfvars
            git commit -m "Set version"
            git push
            EOT
      ]
    }
  }
}