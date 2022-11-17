# Invoke Maintenance (run-immy-service) Endpoint
## API Endpoint
> /api/v1/run-immy-service
## Description
> 
## Method
> POST
## Endpoint Parameters
> Parameters for this API endpoint are passed via a json body. The following are the parameters contained within the json body:
- **tenants** : array, need more information
- **computers** : array, contains json(s) with the Immybot agent id as "computerId" (ex: {"computerId":$ImmyComputerID})
- **rebootPreference** : integer, need more information
- **runInventoryInDetection** : boolean, need more information
- **detectionOnly** : boolean, true would indicate 'Audit' mode for the session
- **sendFollowUpEmail** : boolean, determines if session emails will be sent
- **skipBackgroundJob** : boolean, need more information
- **cacheOnly** : boolean, need more information
- **fullMaintenance** : boolean, need more information
- **resolutionOnly** : boolean, need more information
- **offlineBehavior** : integer, need more information
- **suppressRebootsDuringBusinesshours** : boolean, suppress reboots during business hours
- **sendDetectionEmail** : boolean, determines if a detection email should be sent to the primary user/additional users
- **sendFollowUpOnlyIfActionNeeded** : boolean, need more information
- **showRunNowButton** : boolean, determine if run now button is shown in email
- **showPostponeButton** : boolean, determine if postpone button is shown in email
- **showMaintenanceActions** : boolean, need more information, I believe this is for client emails
- **onlyOnboardingOverridableTasks** : boolean, need more information
> Here is an example of the full json body:
```sh
"{"tenants":[],"computers":[{"computerId":$ImmyComputerID}],"rebootPreference":1,"runInventoryInDetection":$runInventoryInDetection,"detectionOnly":$detectionOnly,"sendFollowUpEmail":$sendFollowUpEmail,"skipBackgroundJob":false,"cacheOnly":false,"fullMaintenance":false,"resolutionOnly":false,"offlineBehavior":2,"suppressRebootsDuringBusinesshours":$suppressRebootsDuringBusinesshours,"sendDetectionEmail":false,"sendFollowUpOnlyIfActionNeeded":false,"showRunNowButton":false,"showPostponeButton":false,"showMaintenanceActions":false,"onlyOnboardingOverridableTasks":false}"
```
## Example output
```sh
```