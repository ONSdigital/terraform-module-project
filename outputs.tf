output "project_id" {
  value = google_project.project.id
}

output "project_display_name" {
  value = google_project.project.name
}

output "project_state_bucket" {
  value = google_storage_bucket.state_bucket.url
}
