resource "google_storage_bucket" "logging_bucket" {
  project                     = google_project.project.name
  name                        = "${google_project.project.name}-logging"
  force_destroy               = var.deletion_protection ? false : true
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  depends_on                  = [google_project.project]
}

resource "google_storage_bucket" "state_bucket" {
  project                     = google_project.project.name
  name                        = "${google_project.project.name}-state"
  force_destroy               = var.deletion_protection ? false : true
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  depends_on                  = [google_project.project]

  logging {
    log_bucket = google_storage_bucket.logging_bucket.name
  }
}
