
variable "location" {
  type = string
  default = "brazilsouth"
  description = "Localidade Brazil"
}

variable "tags" {
  type = map
  default = {
    env = "Dev"
    Tec = "Rafael"
  }
  
}