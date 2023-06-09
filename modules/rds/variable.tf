variable "environment" {
  description = "project environment"
  type        = string
}

variable "name" {
  description = "project name"
  type        = string
}

variable "rds" {
  description = "rds"
  type        = any
}

variable "vpc" {
  description = "vpc"
  type        = any
}

variable "vpc_id" {
  description = "vpc id"
  type        = any
}

variable "database-subnets" {
  description = "rds subnets"
  type        = any
}
