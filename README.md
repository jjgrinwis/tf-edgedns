# Project Name

An example for a customer to add a couple of standard DNS records to Akamai EdgeDNS

## Description

Just add your fqdn's to fqdn_set[] var and off you go. It does some small validation on the fqdn but it's possible to add subdomains now.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Installation

The DNS zone should be active in EdgeDNS and make sure you have the right EdgeDNS API credentials.
https://techdocs.akamai.com/developer/docs/set-up-authentication-credentials

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
