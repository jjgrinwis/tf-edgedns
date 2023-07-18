# module needs it's own required provider resources
terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      # using version 5.0.1 so we can use ENV var's if required
      # https://github.com/akamai/terraform-provider-akamai/pull/448
      version = ">= 5.0.1" 
    }
  }
}

# create our two required CNAME records
# _dmarc.<subdomain>.<domain>.<tld> CNAME parkeddomain.dmarc.customer.com
# _smtp._tls.<subdomain>.<domain>.<tld> CNAME tlsrpt.customer.com
resource "akamai_dns_record" "dmarc_record" {
    zone       = var.domain_name
    name       = "_dmarc.${var.fqdn}"
    recordtype = "CNAME"
    ttl        = 600
    target     = ["parkeddomain.dmarc.${var.domain_name}"]
}

resource "akamai_dns_record" "smtp_record" {
    zone       = var.domain_name
    name       = "_smtp._tls.${var.fqdn}"
    recordtype = "CNAME"
    ttl        = 1800
    target     = ["tlsrpt.${var.domain_name}"]
}

# and finally our TXT record
# <subdomain>.<domain>.<tld> TXT "v=spf1 -all"
resource "akamai_dns_record" "txt_record" {
    zone       = var.domain_name
    name       = var.fqdn
    recordtype = "TXT"
    ttl        = 300
    target     = ["v=spf1 -all"]
}