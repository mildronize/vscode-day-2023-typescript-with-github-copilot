
variable "project" {
  default     = "vscode2023"
  description = "The Project Name used for all resources"
}

variable "org" {
  default     = "thadaw"
  description = "The Organization Name used for all resources"
}

variable "project_short" {
  default     = "thvs23"
  description = "The Project Name for Storage Account"
}

variable "environment" {
  description = "environment"
  default     = "dev"
}
