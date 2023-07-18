# A Terraform script to add some predefined records to EdgeDNS.
#
# using .edgerc but environment vars are also possible with v5.0.1 again.
# 
# $ export AKAMAI_CLIENT_SECRET="your_secret"
# $ export AKAMAI_HOST="your_host"
# $ export AKAMAI_ACCESS_TOKEN="your_access_token"
# $ export AKAMAI_CLIENT_TOKEN="your_client_token"
provider "akamai" {
    edgerc         = "~/.edgerc"
    config_section = "gss_training"
}

# using a module so we can use for_each and loop through our records to create using our set of domains
# if something needs to change like extra records are needed, just update the module.
# the module is not going to create the edgedns zone, that should already be available in your EdgeDNS setup!
module "edgedns_records" {
    source = "./modules/edgedns_records"

    # just loop through our list of entries we would like to add.
    for_each = var.fqdn_set
    fqdn = each.value

    # regex to strip first part of a fqdn
    # a.b.c => b.c
    # a.b.c.d => b.c.d
    domain_name = regex("^[^.]+\\.(.+\\.\\w+)$", each.value)[0]
}