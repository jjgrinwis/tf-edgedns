# our list of fqdn's we would like to add
# added a validation to make sure input of the set is always <subdomain>.<domain>.<tld>
# using a set so any duplicate values will be coalesced automatically.
variable "fqdn_set" {
  description = "The list of fqdn's for which we would like to add these default records"
  type        = set(string)
  validation {
    # using can() to validate if the regex is true so it doesn't throw an error
    # the regex will verify if subdomain, domain and tld ar valid.
    condition = alltrue([
        for fqdn in var.fqdn_set : can(regex("^[[:alnum:]-]+(?:\\.[[:alnum:]-]+)+\\.[[:alpha:]]{2,}$", fqdn))
    ])
    error_message = "Invalid entry in the fqdn set, should be <subdomain>.<domain>{1,}.<fqdn>"
  }
}