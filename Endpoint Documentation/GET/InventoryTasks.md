# Inventory Tasks Endpoint
## API Endpoint
> /api/v1/inventory-tasks
## Description
> Returns information about the scripts run periodically to collect information about the computers enrolled in the Immybot instance
## Method
> GET
## Endpoint Parameters
> none/default
## Example output
```sh
identifier          : -2
inventoryTaskType   : 0
name                : Default Daily Task
frequency           : 3
specifiedNumMinutes :
scripts             : {@{inventoryKey=Antivirus; scriptIdentifier=-8; scriptType=0}, @{inventoryKey=WindowsSystemInfo;
                      scriptIdentifier=-1; scriptType=0}, @{inventoryKey=ExternalIp; scriptIdentifier=-3; scriptType=0},
                      @{inventoryKey=InternalIp; scriptIdentifier=-15; scriptType=0}...}
updatedBy           : -1
updatedDate         : 2020-09-28T19:31:25.220218Z
createdBy           : -1
createdDate         : 2020-09-28T19:31:25.220218Z

identifier          : -1
inventoryTaskType   : 0
name                : Default Hourly Task
frequency           : 2
specifiedNumMinutes :
scripts             : {}
updatedBy           : -1
updatedDate         : 2020-09-28T19:31:25.220218Z
createdBy           : -1
createdDate         : 2020-09-28T19:31:25.220218Z
```