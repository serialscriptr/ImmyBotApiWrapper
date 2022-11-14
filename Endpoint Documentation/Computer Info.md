# Computer Info Endpoint
## API Endpoint
> /api/v1/computers/$($ImmyComputerID)
## Description
> Returns detailed information about a specific computer enrolled in the Immybot instance
## Method
> GET
## Endpoint Parameters
- **ImmyComputerID** : integer, not a rest parameter, this is part of the endpoint URL. The Immybot id of the computer to get infromation about
- **includeSessions** : boolean, determines if sessions for the computer should be included in the information returned
- **includeAdditionalPersons** : boolean, determines if additional persons assigned to the device should be included in the information returned
- **includeActions** : boolean
- **includeProviderAgents** : boolean
- **includeProviderAgentsDeviceUpdateFormData** : boolean
## Example output
> No optional parameters were used for this example output
```sh
id                                    : 5663
tenantId                              : 95
computerName                          : ************
primaryPersonId                       : 16383
onboardingStatus                      : 2
isOnline                              : False
isDomainController                    : False
isPortable                            : True
isServer                              : False
tenantName                            : ****************
inventory                             : @{ <*INFORMATION RETURNED FROM INVENTORY SCRIPTS*> }
isMissingSomeRequiredInventoryResults : False
detectionOutdated                     : True
isSandbox                             : False
excludeFromMaintenance                : False
devLabVmClaimExpirationDateUtc        :
isDevLab                              : False
devLabVmUnclaimed                     : False
ephemeralAgentConnected               : False
sessions                              :
additionalPersons                     : {}
primaryPerson                         : @{id=16383; tenantId=95; azurePrincipalId=; firstName=; lastName=;
                                        emailAddress=**********; displayName= ; updatedBy=; createdBy=;
                                        updatedDateUTC=2022-07-01T03:02:12.195298Z; createdDateUTC=2022-07-01T03:02:12.195298Z;
                                        primaryComputers=; additionalComputers=; user=; tenant=; userAffinities=}
tenant                                : @{id=95; name=*********; slug=****; ownerTenantId=1; active=False; principalId=; msp=False;
                                        updatedBy=; updatedDateUTC=2022-06-24T14:11:43.510935Z; createdBy=;
                                        createdDateUTC=2022-06-24T14:11:43.510935Z; ownerTenant=; tenantPreferences=; ownedTenants=;
                                        users=; providerClients=; ownedProviderLinks=; schedules=; computers=; persons=; brandings=}
agents                                : {@{id=14951; computerId=5663; providerLinkId=1; externalClientName=*********;
                                        externalClientId=95; externalAgentId=********-****-****-****-************;
                                        runScriptPriority=3; providerTypeId=********-****-****-****-************; internalData=;
                                        isOnline=False; supportsRunningScripts=True; deviceUpdateFormData=;
                                        lastUpdatedUTC=0001-01-01T00:00:00Z; deviceDetails=; onboardingOptions=}}
computerTagIds                        : {}
```