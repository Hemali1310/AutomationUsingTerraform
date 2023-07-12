variable "rgroup-name" {
  description = "The name of the resourse group"
  type        = string
}

variable "rgroup-location" {
  description = "location"
  type        = string
}

variable "network-space" {
  default = ["10.0.0.0/16"]
}

variable "subnet-address-space" {
  default = ["10.0.1.0/24"]
}
