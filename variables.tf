variable "project_name" {
  default = "webapp"
}

variable "vpc_cidr_primary" {
  default = "10.0.0.0/16"
}

variable "vpc_cidr_secondary" {
  default = "10.1.0.0/16"
}

variable "azs_primary" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "azs_secondary" {
  default = ["us-west-2a", "us-west-2b"]
}
