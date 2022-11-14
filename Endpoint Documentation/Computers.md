# Computers Endpoint
## API Endpoint
> /api/v1/computers
## Description
> Returns an array of computers in the Immybot instance and information about them
## Method
> GET
## Endpoint Parameters
- orderByUpdatedDate : boolean
- tenantId : integer, optional parameter to filter the query by a specific tenant. Valid values are any tenants ids found in the Immybot instance
- pageSize : integer, how many computers are returned
## Example output
```sh
id                     : 1446
name                   : <*COMPUTER NAME*>
tenant                 : <*COMPUTER TENANT NAME*>
tenantId               : 36
online                 : False
updatedDate            : 2022-11-09T03:05:34.893079Z
excludeFromMaintenance : False
```