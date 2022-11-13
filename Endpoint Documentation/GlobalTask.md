# Maintenance Task (Global) Endpoint
## API Endpoint
> /api/v1/maintenance-tasks/global
## Method
> GET
## Endpoint Parameters
> none/default
## Example output
```sh
id                      : 387
name                    : Remove Desktop Icons
maintenanceTaskCategory : 0
databaseType            : 0
onboardingOnly          : False
testEnabled             : True
testScriptId            : 2510
testScriptType          : 0
getEnabled              : True
getScriptId             : 2510
getScriptType           : 0
setEnabled              : True
setScriptId             : 2510
setScriptType           : 0
parameters              : {@{id=963; maintenanceTaskId=387; name=ShortcutNamesToRemove;
                          dataType=7; required=False; selectableValues=System.Object[];
                          notes=Enter the names of the shortcuts to delete in the KEY FIELD,
                          wildcards acceptable. You may put a description in the value field if
                          you like.; defaultValue=[]; hidden=False; order=1; defaultMediaId=;
                          defaultMediaDatabaseType=; defaultMedia=;
                          maintenanceTaskParameterValues=System.Object[]}, @{id=962;
                          maintenanceTaskId=387; name=Locations; dataType=3; required=False;
                          selectableValues=System.Object[]; notes=; defaultValue=AllDesktop;
                          hidden=False; order=0; defaultMediaId=; defaultMediaDatabaseType=;
                          defaultMedia=; maintenanceTaskParameterValues=System.Object[]}}
icon                    : @{id=0; name=; fileName=; mimeType=; packageHash=; blobReference=;
                          relativeCacheSourcePath=; updatedDateUTC=0001-01-01T00:00:00Z;
                          createdDateUTC=0001-01-01T00:00:00Z; databaseType=0; category=0}
updatedDateUTC          : 2022-10-07T21:22:11.245611Z
createdDateUTC          : 2022-10-07T21:21:25.320967Z
recommended             : False
isConfigurationTask     : False
iconMediaId             :
executeSerially         : False
notes                   :
```