# SMTP-Configs Endpoint
## API Endpoint
> /api/v1/smtp-configs/$ImmyTenantID
## Description
> Returns configured SMTP information for the provided Immybot tenant id. Note that if no specific SMTP information is configured for the provided tenant then the default configuration value from the Immybot instance is used.
## Method
> GET
## Endpoint Parameters
- **ImmyTenantID** : (*Mandatory*) integer, the Immybot tenant id to query for the tenant SMTP configuration
## Example output
```sh
tenantId          : 1
tenantName        :
port              : 25
host              : ***************************************
enableSSL         : True
timeout           : 10000
username          :
enabled           : True
useAuthentication : False
```