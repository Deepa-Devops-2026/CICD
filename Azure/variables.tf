variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
}

variable "virtual_network" {
  type = object({
    name          = string
    address_space = list(string)
  })
}

variable "subnet" {
  type = object({
    name             = string
    address_prefixes = list(string)
  })
}

variable "nsg" {
  type = object({
    name = string
  })
}

variable "public_ip" {
  type = object({
    name = string
  })
}

variable "nic" {
  type = object({
    name = string
  })
}

variable "vm" {
  type = object({
    name       = string
    size       = string
    admin      = string
    public_key = string
  })
}

variable "storage_account" {
  type = object({
    name = string
  })
}

variable "storage_container" {
  type = object({
    name = string
  })
}

variable "subscription_id" {
  type = string
}
