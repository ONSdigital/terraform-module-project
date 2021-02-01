//
//      https://cloud.google.com/resource-manager/docs/creating-managing-projects#before_you_begin
//      Project IDs must:
//      - be lowercase
//      - start with a letter
//      - be between 6 and 30 characters
//      - not contain the words 'google' and/or 'ssl'
//

locals {
  project_regex = "(?:(?:[-a-z0-9]{1,63}\\.)*(?:[a-z](?:[-a-z0-9]{0,61}[a-z0-9])?):)?(?:[0-9]{1,19}|(?:[a-z0-9](?:[-a-z0-9]{0,61}[a-z0-9])?))"
}

resource "google_project" "project" {
  name            = length(regexall(local.project_regex, var.project_id)) > 0 ? var.project_id : random_pet.random_project_id.id
  project_id      = length(regexall(local.project_regex, var.project_id)) > 0 ? var.project_id : random_pet.random_project_id.id
  billing_account = var.billing_account_id
  folder_id       = var.folder_id
}

module "project-services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "4.0.0"

  project_id = google_project.project.id

  activate_apis = concat(["cloudbuild.googleapis.com"], var.activate_apis)
}
