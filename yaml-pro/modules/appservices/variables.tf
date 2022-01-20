variable "rgname" {
  type = string
  default = "rg-ads-dev-001"
}

variable "location" {
  type = string
  default = "eastus"
}

variable "servicename" {
  type = list
  default = ["apsvc-ads-dev-001","apsvc-ads-dev-002"]
}
