variable "domain_name" {
    description = "The target domain name for the CNAME records"
    type = string
    default = "great-demo.com"
}

variable "fqdn" {
    description = "hostname part of the records"
    type = string
}