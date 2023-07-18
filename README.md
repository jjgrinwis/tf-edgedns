# Project Name

An example for a customer to add a couple of standard records to Akamai EdgeDNS

## Description

Just add your fqdn's to fqdn_set[] var and off you go. For now just using ```<subdomain>.<domain>.<tld>``` format but you can change the validation code to allow other formats. 

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Installation

The DNS zone should be active in EdgeDNS and make sure you have the right EdgeDNS API credentials.

## Usage

just clone the repo and add your fqdn entries to the terraform.tfvars file.
Make sure you are using the correct ```.edgerc``` section or ENV vars.

```
$ terraform init
$ terraform plan
$ terraform apply
```
And there you go. Have fun.

## License

This project is licensed under the [MIT License](LICENSE).
