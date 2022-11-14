# Pending Conflicts (Device Specific) Endpoint
## API Endpoint
> /api/v1/provider-agents/$ImmyComputerID/pending-conflicts
## Description
> Returns information about a specific device's pending conflicts
## Method
> GET
## Endpoint Parameters
- **ImmyComputerID** : integer, not a parameter but part of the endpoint url. The target Immybot device id
## Example output
```sh
id                       : 18222
computerName             : ************
operatingSystemName      : Microsoft Windows 10 Pro 64-bit
externalAgentId          : ********-****-****-****-************
dateAdded                : 2022-11-09T19:08:07.169361Z
isOnline                 : True
serial                   : **********
providerLinkName         : ImmyBot Agent
externalClientName       : ************************
osInstallDateUtc         :
requiresManualResolution : False
failed                   : True
identificationFailures   : {@{id=88839; computerId=; existingAgentId=; pendingAgentId=18222; message=Error
                           occurred while trying to get device id:
                           EphemeralAgentSessionFailedToConnectException: No provider was able to execute the
                           ephemeral agent script.
                            -> AggregateException: One or more errors occurred. (InvokeDeviceMethodAsync
                           returned a 500 status code. {"Message":"","Result":null})
                            -> DeviceMethodException: InvokeDeviceMethodAsync returned a 500 status code.
                           {"Message":"","Result":null} ; createdDateUTC=2022-11-09T19:12:13.963072Z;
                           resolved=False; requiresManualResolution=False; featureUsageExceeded=False;
                           manualResolutionDecision=; existingComputerName=; existingPrimaryUserFirstName=;
                           existingPrimaryUserLastName=; existingTenantName=; existingOperatingSystem=;
                           existingSerialNumber=; existingOSInstallDate=; existingAgent=}, @{id=88838;
                           computerId=; existingAgentId=; pendingAgentId=18222; message=Error occurred while
                           trying to get device id: EphemeralAgentSessionFailedToConnectException: No
                           provider was able to execute the ephemeral agent script.
                            -> AggregateException: One or more errors occurred. (InvokeDeviceMethodAsync
                           returned a 500 status code. {"Message":"","Result":null})
                            -> DeviceMethodException: InvokeDeviceMethodAsync returned a 500 status code.
                           {"Message":"","Result":null} ; createdDateUTC=2022-11-09T19:11:13.826471Z;
                           resolved=False; requiresManualResolution=False; featureUsageExceeded=False;
                           manualResolutionDecision=; existingComputerName=; existingPrimaryUserFirstName=;
                           existingPrimaryUserLastName=; existingTenantName=; existingOperatingSystem=;
                           existingSerialNumber=; existingOSInstallDate=; existingAgent=}, @{id=88837;
                           computerId=; existingAgentId=; pendingAgentId=18222; message=Error occurred while
                           trying to get device id: EphemeralAgentSessionFailedToConnectException: No
                           provider was able to execute the ephemeral agent script.
                            -> AggregateException: One or more errors occurred. (InvokeDeviceMethodAsync
                           returned a 500 status code. {"Message":"","Result":null})
                            -> DeviceMethodException: InvokeDeviceMethodAsync returned a 500 status code.
                           {"Message":"","Result":null} ; createdDateUTC=2022-11-09T19:10:14.153573Z;
                           resolved=False; requiresManualResolution=False; featureUsageExceeded=False;
                           manualResolutionDecision=; existingComputerName=; existingPrimaryUserFirstName=;
                           existingPrimaryUserLastName=; existingTenantName=; existingOperatingSystem=;
                           existingSerialNumber=; existingOSInstallDate=; existingAgent=}, @{id=88836;
                           computerId=; existingAgentId=; pendingAgentId=18222; message=Error occurred while
                           trying to get device id: EphemeralAgentSessionFailedToConnectException: No
                           provider was able to execute the ephemeral agent script.
                            -> AggregateException: One or more errors occurred. (InvokeDeviceMethodAsync
                           returned a 500 status code. {"Message":"","Result":null})
                            -> DeviceMethodException: InvokeDeviceMethodAsync returned a 500 status code.
                           {"Message":"","Result":null} ; createdDateUTC=2022-11-09T19:09:13.651795Z;
                           resolved=False; requiresManualResolution=False; featureUsageExceeded=False;
                           manualResolutionDecision=; existingComputerName=; existingPrimaryUserFirstName=;
                           existingPrimaryUserLastName=; existingTenantName=; existingOperatingSystem=;
                           existingSerialNumber=; existingOSInstallDate=; existingAgent=}...}
```