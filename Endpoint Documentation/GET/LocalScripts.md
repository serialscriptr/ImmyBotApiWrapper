# Scripts (Local) Endpoint
## API Endpoint
> /api/v1/scripts/local
## Description
> Returns an array of scripts configured in the Immybot instance's local script repository
## Method
> GET
## Endpoint Parameters
> none/default
## Example output
```sh
tenants                : {}
owned                  : False
updatedBy              : Ryan McAvoy
scriptType             : 1
name                   : Create a system restore point
id                     : 1
action                 : #
                         # Purpose: Create a restore point for the target system
                         # Author: Ryan
                         #

                         $Date = Get-date -Format "MM/dd/yyyy"

                         # Change restore point frequency (how many times it can run in X hours)
                         if needed
                         If($(Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows
                         NT\CurrentVersion\SystemRestore" -Name "SystemRestorePointCreationFrequenc
                         y").SystemRestorePointCreationFrequency -ne 0){

                             Try{
                                 Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows
                         NT\CurrentVersion\SystemRestore" -Name
                         "SystemRestorePointCreationFrequency" -Value "0" -Force
                                 Checkpoint-Computer -Description "Immybot Onboarding"
                             }
                             Catch{

                                 Write-Output "Failed to set restore point frequency to 0, exiting
                         script"

                                 Throw
                             }
                         }

                         Try{

                         Enable-ComputerRestore -Drive "C:\"

                         Checkpoint-Computer -Description "Immybot generated restore point $date"
                         -RestorePointType "MODIFY_SETTINGS"

                         }
                         Catch{

                             Write-Output "Failed to create restore point. Exiting script"

                             Throw
                         }
scriptLanguage         : 2
timeout                :
scriptExecutionContext : 0
userActionTrigger      : 0
scriptCategory         : 3
outputType             : 0
updatedDateUTC         : 2021-05-10T13:41:09.500473Z
createdDateUTC         : 2021-04-01T12:39:00.**999178Z**
```