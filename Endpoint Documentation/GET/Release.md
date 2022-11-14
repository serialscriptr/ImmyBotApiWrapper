# Release Endpoint
## API Endpoint
> /api/v1/system/releases
## Description
> Returns information about the current release and information about any pending releases
## Method
> GET
## Endpoint Parameters
> none/default
## Example output
> Output not expanded
```sh
currentRelease
--------------
@{tag=0.54.0; releaseNotes=### CW Control Updates...
```
> currentRelease expanded
```sh
tag    releaseNotes
---    ------------
0.54.0 ### CW Control Updates...
```
> releaseNotes expanded
```sh
### CW Control Updates
---

We added support for the breaking changes introduced in CW Control 22.9.
We addressed stability issues with Control crashing due to the ImmyBot extension.  On the Control integration form, make sure you check off the new options for using the Service Bus for better performance.

### Pending Identification Updates
---

Agent identification now has logging to help you find root causes for why some agents fail to have scripts run against them. View them in Computers -> Pending Identification -> Show Identification Logs

You can also see the identification logs for successfully identified agents under the Computer -> Agents tab.

We now utilize the serial numbers for devices that come from trusted manufacturers (currently Lenovo, Dell, and HP). If a computer already exists in ImmyBot for a trusted manufacturer, any additional agents with that computer's serial number will skip identification and automatically be associated.

### Improvements
---
- Fixed issue where Intellisense would throw null reference exception when completing variables
- Updated CW Control integration to support CW Control 22.9 (extension version 0.3.0)
- Added immy subscription information to billing details page
- Made subscription portal show within immy frontend instead of a link to chargebee
- Updated the default combined maintenance task script to leverage the latest function scripts in Immy. The new script is `Get-WindowsRegistryValue -Path "HKLM:\Software\Wow6432Node\MySoftwareVendor\MySoftware" -Name EnableFeature | Registry-ShouldBe -Value 1`
- License files are now downloaded before running a configuration task's test script during detection in case the script relies on the presence of the license file
- Added a new tenant preference "Exclude from Cross-Tenant Deployments and Schedules". When a tenant is excluded, all cross-tenant deployments and schedules targeting the tenant or its computers will not be applied when full maintenance is ran. This is particularly useful for Co-Managed IT situations that don't don't want your cross-tenant schedules or deployments.
- Improved startup time of instances in situations where there was a large number of recently added agents
- Added "Change Tenant" in batch actions for the computers table
```