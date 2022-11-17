# Generate Installer (executable-uri-with-onboarding) Endpoint
## API Endpoint
> /api/v1/provider-links/1/agents/executable-uri-with-onboarding
## Description
> Returns an exe Immybot installer via a direct download url
## Method
> POST
## Endpoint Parameters
>  Parameters for this API endpoint are passed via a json body. The following are the parameters contained within the json body:
- **targetExternalClientId** : integer, the Immybot tenant id to assign to the resulting agent
- **onboardingOptions** : json, contains all of the following parameters:
  - **primaryPersonId** : integer, the id assigned to the person in Immybot that should be assigned as the primary person(user of the computer)
  - **additionalPersonIds** : array, array containing one or more ids for the Immybot person(s) that should be assigned as an 'additional person' for the computer. This effectively means the people assigned here will be included on any emails for the device.
  - **automaticallyOnboard** : boolean, determines if the device should start onboarding once identified in Immybot
  - **onboardingSessionSendFollowUpEmail** : boolean, determines if an email should be sent after onboarding
  - **onboardingCorrelationId** : GUID, this is effectively useless when calling the API directly and can be ignored/random. This is used for the Immybot frontend to track a device during the identification process when generating an installer via the frontend.
  - **onboardingSessionRebootPreference** : integer, must be one of the following values:
    - `-1` : this sets the reboot preference as "Force"
    - `0` : this sets the reboot preference as "If necessary"
    - `1` : this sets the reboot preference as "Supress"
> Here is an example of the full json body, note that strings starting with $ represent variables:
```sh
"{"targetExternalClientId":$ImmyTenantID,"onboardingOptions":{"primaryPersonId":$PrimaryPersonID,"additionalPersonIds":$AdditionalPersonsID,"automaticallyOnboard":$AutoOnboard,"onboardingSessionSendFollowUpEmail":$SendFollowUpEmail,"onboardingCorrelationId":"ee19d00c-c06c-44c8-8a4e-13528595ee1a","onboardingSessionRebootPreference":0}}"
```
## Example output
```sh
https://immybot.blob.core.windows.net/azure-bundle-exes/**************/ImmyAgentInstallerBundle.exe?**********************************************
```
> the exe can be silently installed by using the following parameters:
- /qn automaticallyOnboard=<'true/false'> /lv <'log file path'>
> while the exe accepts the 'automaticallyOnboard' parameter I am unsure if it overrides the option set when generating the installer