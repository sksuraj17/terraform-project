variable "cidr" {
  type    = list(any)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "az" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b"]
}

variable "access_key" {
  type        = string
  description = "Access key AWS"
}

variable "secret_key" {
  type        = string
  description = "Secret access key AWS"
}