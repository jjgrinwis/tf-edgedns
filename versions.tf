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