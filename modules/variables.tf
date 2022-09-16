variable "access_key" {
}
variable "secret_key" {
    description = "Secret Key to access the AWS account"
}

variable "region" {
    description = "Name of the region"
}

variable "environment" {
    description = "Name of the  application environment"
}

variable "ip_ranges" {
    description = "Ip cidr ranges for vpc subnets"
}



