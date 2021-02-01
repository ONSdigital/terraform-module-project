resource "google_resource_manager_lien" "project_deletion_protection" {
  count        = var.deletion_protection ? 1 : 0
  origin       = "terraform"
  parent       = google_project.project.number
  reason       = "Protecting formal projects from accidental deletion"
  restrictions = ["resourcemanager.projects.delete"]

  lifecycle {
    prevent_destroy = true
  }

  depends_on = [google_project.project]
}
