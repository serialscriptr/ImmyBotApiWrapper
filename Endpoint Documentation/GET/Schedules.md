# Schedules Endpoint
## API Endpoint
> /api/v1/schedules
## Description
> Returns configured schedules in the Immybot instance
## Method
> GET
## Endpoint Parameters
> none/default
## Example output
> (Single example from array output)
```sh
id                                           : 11
disabled                                     : False
customCronExpression                         : 00 08 1,15 * *
time                                         :
day                                          :
maintenanceTime                              :
sendDetectionEmail                           : False
sendDetectionEmailWhenAllActionsAreCompliant : False
sendFollowUpEmail                            : False
sendFollowUpOnlyIfActionNeeded               : False
showRunNowButton                             : False
showPostponeButton                           : False
showMaintenanceActions                       : False
maintenanceType                              : 0
maintenanceIdentifier                        : 657
rebootPreference                             : 1
applyWindowsUpdates                          : True
allowAccessToMSPResources                    : False
updatedDateUTC                               : 2022-09-06T18:56:17.102489Z
createdDateUTC                               : 2022-06-30T02:02:31.837246Z
updatedBy                                    : 2
createdBy                                    : 2
updatedByName                                : Ryan McAvoy
timeZoneInfoId                               : America/New_York
offlineBehavior                              : 2
suppressRebootsDuringBusinessHours           : True
nextOccurenceDate                            : 2022-11-15T13:00:00Z
targetText                                   :
targetTypeName                               : All Computers
targetScopeName                              : Cross Tenant
targetMissing                                : False
targetTypeMissing                            : False
targetTypeDescription                        :
targetType                                   : 1
onboardingOnly                               : False
target                                       :
targetCategory                               : 0
targetGroupFilter                            : 0
tenantId                                     :
providerLinkId                               :
providerClientGroupType                      :
providerDeviceGroupType                      :
targetGroupFilterName                        : All
```