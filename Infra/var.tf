
variable "location" {
  type        = string
  default     = "brazilsouth"
  description = "Localidade Brazil"
}

variable "tags" {
  type = map(any)
  default = {
    env = "Dev"
    Tec = "Rafael"
  }

}