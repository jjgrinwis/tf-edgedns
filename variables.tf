# our list of fqdn's we would like to add
# added a validation to make sure input of the set is always <subdomain>.<domain>.<tld>
# using a set so any duplicate values will be coalesced automatically.
variable "fqdn_set" {
  description = "The list of fqdn's for which we would like to add these default records"
  type        = set(string)
  validation {
    # chatGPT generated regex but he made a mess of the validation part
    # using can() to validate regex and every entry resuls should be alltrue()
    condition = alltrue([
        for fqdn in var.fqdn_set : can(regex("^[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+){2}$", fqdn))
    ])
    error_message = "Invalid entry in the fqdn set, should be <subdomain>.<domain>.<fqdn>"
  }
}