# Scripts (Global) Endpoint
## API Endpoint
> /api/v1/scripts/global
## Description
> Returns an array of scripts from the Immybot global script repository
## Method
> GET
## Endpoint Parameters
> none/default
## Example output
```sh
scriptLanguage         : 2
timeout                :
scriptExecutionContext : 0
userActionTrigger      : 0
scriptCategory         : 0
outputType             : 0
updatedDateUTC         : 0001-01-01T00:00:00Z
createdDateUTC         : 0001-01-01T00:00:00Z

scriptType             : 0
name                   : LaserFiche - SoftwareDetection
id                     : 619
action                 : if((Test-Path "${env:ProgramFiles(x86)}")){    $FileName =
                         "${env:ProgramFiles(x86)}\Laserfiche\Client\LF.exe"}else{    $FileName =
                         "${env:ProgramFiles}\Laserfiche\Client\LF.exe"}$Version = Get-Item $FileName -ErrorAction SilentlyContinue
                         | select -ExpandProperty VersionInfo | %{([system.Version]$_.FileVersion.Replace(",
                         ",".")).ToString()}$Version
scriptLanguage         : 2
timeout                :
scriptExecutionContext : 0
userActionTrigger      : 0
scriptCategory         : 0
outputType             : 0
updatedDateUTC         : 0001-01-01T00:00:00Z
createdDateUTC         : 0001-01-01T00:00:00Z
```