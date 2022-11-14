# Persons Endpoint
## API Endpoint
> /api/v1/Persons
## Description
> Returns an array of people in the Immybot instance. People in Immybot are pulled from the connected azure tenants, local ad, and any manually added to Immybot
## Method
> GET
## Endpoint Parameters
> none/default
## Example output
> Example output is only one item of the returned array of data
```sh
id               : 17177
firstName        : John
lastName         : Doe
emailAddress     : jdoe@*******************
azurePrincipalId : ********-****-****-****-************
tenantName       : ****************************
tenantId         : 94
fullName         : John Doe
updatedDateUTC   : 0001-01-01T00:00:00Z
createdDateUTC   : 2022-08-18T03:01:04.649527Z
updatedBy        :
```