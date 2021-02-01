variable "project_id" {
  type        = string
  description = "The project Id you want to assign to this project"
}

variable "folder_id" {
  type        = string
  default     = "578347862917"
  description = "The Id of folder to create the project in"
}

variable "billing_account_id" {
  type        = string
  default     = "0195D1-0AA399-5825B6"
  description = "The billing id to initialise the project with"
}

variable "primary_contact" {
  type        = string
  description = "The Primary contact (email) for this project"
}

variable "activate_apis" {
  type        = list(string)
  default     = []
  description = "A list of APIs to enable for the created project"
}

variable "deletion_protection" {
  type        = bool
  default     = false
  description = "For use when creating a formal project as opposed to a adhoc sandbox project"
}

variable "project_owners" {
  type        = list(string)
  default     = []
  description = "Additional entities to bind to the owner role"
}
