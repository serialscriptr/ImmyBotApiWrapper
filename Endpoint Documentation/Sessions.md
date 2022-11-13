# Sessions Endpoint
## API Endpoint
> /api/v1/maintenance-sessions/dx
## Method
> GET
## Endpoint Parameters
> **sessionType** : valid values are 1 or 2. 1 refers to cloud sessions and 2 refers to agent sessions
> **filter** : filter contains the following sub parameters: **createdDate**, **sessionStatus**
>  filter example for "running" sessions : filter=[["sessionStatus","=",1],"and",["createdDate",">","01/01/1970 00:00:00"]]
>  filter example for "pending" sessions : filter=[["sessionStatus","=",6],"or",["sessionStatus","=",8]]
>  filter example for "created" sessions : filter=[["sessionStatus","=",3],"and",["createdDate",">","01/01/1970 00:00:00"]]
>  filter example for "completed" sessions : filter=[["sessionStatus","=",0],"or",["sessionStatus","=",2],"or",["sessionStatus","=",7],"or",["sessionStatus","=",4],"or",["sessionStatus","=",5]]
# Example ouput
> id                      : 102056
statusName              : Passed
sessionStatus           : 0
computerName            : WIN11-TESTER
operatingSystem         : Microsoft Windows 11 Pro
manufacturer            : Microsoft Corporation
model                   : Virtual Machine
serialNumber            : 4840-1708-4497-2350-1771-4624-65
domain                  : WORKGROUP
computerId              : 4166
tenantId                : 4
createdBy               :
createdDate             : 2022-11-02T12:00:36.405976Z
updatedDate             : 2022-11-02T12:01:04.234121Z
onboardingStageStatus   :
detectionStageStatus    : 0
executionStageStatus    : 0
agentUpdatesStageStatus :
resolutionStageStatus   : 0
tenantName              :  Lab
primaryPersonName       :
primaryPersonEmail      :
scheduleId              : 12
fullMaintenance         : False
scheduledExecutionDate  :