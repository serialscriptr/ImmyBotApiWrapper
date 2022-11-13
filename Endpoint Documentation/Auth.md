# Auth Endpoint
## API Endpoint
> /api/v1/auth
## Method
> GET
## Endpoint parameters
> none/default
## Example output
```sh
userId                  : 7
tenantId                : 1
personId                : 10337
displayName             : <*USERNAME OF API USER*>
tenantName              : <*MSP TENANT NAME*>
isAdmin                 : False
isMSP                   : True
isImmense               : False
devInstanceDetails      :
localSoftwareEndpoint   : <*IMMY INSTANCE LOCAL SOFTWARE STORE*>
globalSoftwareEndpoint  : https://immybot.blob.core.windows.net/
cspAppId                : \*\*\*\*\*\*\*\*-\*\*\*\*-\*\*\*\*-\*\*\*\*-\*\*\*\*\*\*\*\*\*\*\*\*
azurePermissionLevel    : 2
status                  : 1
trialStartUtc           : 2021-03-10T15:59:47Z
trialEndUtc             : 2021-04-23T20:41:07Z
updateAvailable         : False
currentReleaseVersion   : 0.54.0
isInstanceUpdating      : False
isInstanceRestarting    : False
instanceUpdateHasFailed : False
instanceUpdateSource    :
maxRunningSessionCount  : 100
openAccessRequestCount  : 0
immyProduct             :
features                : {@{enabled=True; name=RecurringUserComputerAffinityJobFeature},
                          @{enabled=True; name=RecurringInventoryJobFeature}, @{enabled=True;
                          name=RecurringSyncAzureUsersJobFeature}, @{enabled=True;
                          name=ProviderLinksFeature}...}
daysLeftInTrial         :
```