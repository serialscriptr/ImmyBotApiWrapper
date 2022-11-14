# Computer Session Endpoint
## API Endpoint
> /api/v1/maintenance-sessions/$ImmySessionID
## Description
> Returns detailed information about the provided session
## Method
> GET
## Endpoint Parameters
- **ImmySessionID** : (*Mandatory*) integer, not a REST parameter but part of the endpoint URL. The target Immybot session id
- **includeComputer** : boolean, need more information on this parameter
- **includeTenant** : boolean, need more information on this parameter
- **includeStages** : boolean, determine if the stage information will be included with the data returned
- **includeLogs** : boolean, need more information on this parameter
## Example output
> Example output data does not include optional parameters
```sh
id                      : 87672
jobId                   : 885fb7f9-05bc-4fb8-a5b6-212c50bb499c
computerId              : 5702
tenantId                : 95
scheduledId             : 11
sessionStatus           : 9
onboarding              : False
createdDateUTC          : 2022-10-01T12:39:49.342655Z
updatedDateUTC          : 2022-10-01T12:46:28.567065Z
updatedById             :
createdById             :
createdBy               :
fullMaintenance         : False
computerName            : **********
tenantName              : **********
onboardingStageStatus   :
detectionStageStatus    : 8
executionStageStatus    : 8
agentUpdatesStageStatus :
resolutionStageStatus   : 0
sessionJobArgs          : @{sessionId=0; manuallyTriggeredByUserId=; manuallyResumedByPersonId=;
                          manuallyResumed=False; scheduledId=11; computerId=5702; tenantId=;
                          installWindowsUpdates=False; cacheOnly=False; rebootPreference=1;
                          maintenanceSchedulingConfiguration=; maintenanceOnboardingConfiguration=;
                          maintenanceEmailConfiguration=; maintenanceAgentUpdatesConfiguration=;
                          maintenanceItem=; deploymentId=451; deploymentType=1;
                          cacheGroupId=********-****-****-****-************; rerunningAction=False;
                          terminalId=; detectionOnly=False; runInventoryInDetection=False;
                          resolutionOnly=False; repair=False; offlineBehavior=2;
                          suppressRebootsDuringBusinessHours=True; appliedOnConnect=False;
                          useWinningDeployment=True; hasScheduledSessionBeenTracked=False;
                          rerunFromScheduleId=}
scheduledExecutionDate  :
```