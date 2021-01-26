# TODO Replace user with group

resource "google_project_iam_binding" "project_owner_iam_binding" {
  project = google_project.project.project_id
  role    = "roles/owner"

  members = concat(
    ["user:${var.primary_contact}",
    "serviceAccount:${google_project.project.number}@cloudbuild.gserviceaccount.com"],
  var.project_owners)


  depends_on = [google_project.project]
}

resource "google_storage_bucket_iam_binding" "project_state_iam_binding" {
  bucket = google_storage_bucket.state_bucket.name
  role   = "roles/storage.admin"

  members = [
    "user:${var.primary_contact}",
    "serviceAccount:${google_project.project.number}@cloudbuild.gserviceaccount.com"
  ]

  depends_on = [google_project.project]
}
