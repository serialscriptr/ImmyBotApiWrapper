# Preferences Endpoint
## API Endpoint
> /api/v1/preferences
## Description
> Returns information about configured settings in the Immybot instance
## Method
> GET
## Endpoint Parameters
> none/default
## Example output
```sh
id                                        : 1
enableOnboarding                          : True
enableAzureUserSync                       : True
defaultEmailBccList                       : @{emails=System.Object[]}
enableNiniteIntegration                   : False
defaultBrandingId                         : 1
enableUserAffinitySync                    : True
enableSessionEmails                       : True
defaultBranding                           :
defaultScriptTimeouts                     : @{detection=240; action=1800; install=1800;
                                            uninstall=1800; upgrade=1800; autoUpdateJob=21600}
useImmyBotChocolateyFeed                  : True
overwriteExistingDeviceIfOSIsNew          : True
enableNonEssentialDeviceInventory         : True
requireConsentForExternalSessionProviders : False
allowNonAdminsToManageAssignments         : False
showGettingStartedWizard                  : False
enableHistoricalInventory                 : False
defaultTimeZone                           : America/New_York
immyScriptPath                            : <*UNIQUE SCRIPT PATH*>
enableRequestAccess                       : True
enableEphemeralAgentDebugMode             : False
allowNCentralIntegration                  : False
```