resource "google_cloudbuild_trigger" "example" {
  project = "example"
  name    = "example"

  source_to_build {
    repo_type = "GITHUB"
    uri       = "https://github.com/raj13aug/ci-cd-gcp-cloudbuild"
    ref       = "refs/heads/main"
  }

  git_file_source {
    path = "cloudbuild.yaml"

    repo_type = "GITHUB"
    uri       = "https://github.com/raj13aug/ci-cd-gcp-cloudbuild"
    revision  = "refs/heads/main"
  }
}