# Computer Software Endpoint
## API Endpoint
> /api/v1/computers/$ImmyComputerID/inventory-script-results/Software
## Description
> Returns some information about the last time an inventory collection script ran any errors, as well as an array of software and some information about the software for the target computer in the Immybot instance
## Method
> GET
## Endpoint Parameters
- **ImmyComputerID** - integer, not actually a parameter as its part of the endpoint URL. The Immybot computer id to get information about
## Example output
> Example output without being expanded
```sh
__InventoryTasks                        Software                  Software_ErrorResult                Software_LatestResultIsError
----------------                        --------                  --------------------                ----------------------------
@{Software=2022-11-12T20:27:41.488432Z} @{Output=System.Object[]} Script timed out after 299 seconds.                        False
```
> Software expanded
```sh
Output
------
{@{Context=Machine; UserSID=; Platform=64; UserName=; DisplayIcon=C:\Program Files\Microsoft Office 15\ClientX64\OfficeClickToRun....
```
> Output expanded (single example from array)
```sh
Context              : Machine
UserSID              :
Platform             : 64
UserName             :
DisplayIcon          : msiexec.exe
DisplayName          : Microsoft Visual Studio 2010 Tools for Office Runtime (x64)
InstallDate          : 0001-01-01T00:00:00
ProductCode          :
UpgradeCode          :
DisplayVersion       : 10.0.50903
SystemComponent      :
UninstallString      : c:\Program Files\Common Files\Microsoft Shared\VSTO\10.0\Microsoft Visual Studio 2010 Tools for Office
                       Runtime (x64)\install.exe
QuietUninstallString :
```