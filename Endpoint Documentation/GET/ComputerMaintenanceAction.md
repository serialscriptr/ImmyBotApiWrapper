# Computer Maintenance Action Endpoint
## API Endpoint
> /api/v1/maintenance-actions/dx-for-computer/$ImmyComputerID
## Description
> Returns an array of all actions from any session for the provided Immy agent id
## Method
> GET
## Endpoint Parameters
- **ImmyComputerID** : (*Mandatory*) integer, not a rest parameter, this is part of the endpoint URL. The Immybot id of the computer query
## Example output
> Example output is only one item of the returned array of data
```sh
id                                   : 143736
maintenanceSessionId                 : 102308
tenantId                             : 28
computerId                           : 6754
computerName                         :
isComputerOnline                     : False
startTime                            : 0001-01-01T00:00:00Z
endTime                              : 0001-01-01T00:00:00Z
actionType                           : 7
actionTypeName                       : Undetermined
status                               : 0
statusName                           : NotStarted
assignmentId                         : 569
assignmentType                       : 1
tenantName                           : <*CLIENT TENANT NAME*>
maintenanceType                      : 0
maintenanceIdentifier                : 207
desiredSoftwareState                 : 7
description                          : Undetermined Huntress Agent [NotStarted]
postMaintenanceTest                  :
postMaintenanceTestType              :
postMaintenanceTestResult            :
postMaintenanceTestResultMessage     :
maintenanceTypeName                  : GlobalSoftware
maintenanceDisplayName               : Huntress Agent
detectedVersionString                :
desiredVersionString                 :
reason                               : 9
result                               : 0
resultName                           : Pending
maintenanceTaskMode                  :
maintenanceTaskGetResult             :
createdDateUTC                       : 2022-11-02T12:04:47.642312Z
updatedDateUTC                       : 2022-11-02T12:04:47.642312Z
updatedBy                            :
createdBy                            :
softwareType                         : 0
maintenanceTaskType                  :
resultReason                         :
resultReasonMessage                  :
dependsOnNames                       : {}
dependentsNames                      : {}
softwareActionIdForConfigurationTask :
softwareProviderType                 : 3
policyDescription                    : Workstations and portable devices at <*CLIENT TENANT NAME*> should have the latest version of "Huntress Agent" only if
                                       it is already installed
```