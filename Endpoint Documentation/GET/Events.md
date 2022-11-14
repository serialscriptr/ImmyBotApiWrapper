# Events (Device specific) Endpoint
## API Endpoint
> /api/v1/computers/$ImmyComputerID/events
## Description
> Returns an array of events and information about them for the provided Immybot agent id. Events normally are provider agents disconnecting/connecting
## Method
> GET
## Endpoint Parameters
- **ImmyComputerID** : (*Mandatory*) integer, not a parameter but part of the endpoint url. The target Immybot device id
## Example output
```sh
id         : 6383181
dateUTC    : 2022-10-25T19:30:25.852434Z
eventType  : 2
objectType : 2
objectId   : 18166
message    : ImmyBot Agent disconnected
data       : {"ComputerId":null,"ProviderLinkId":1,"ClientId":"43","AgentId":"********-****-****-****-************",        "DeviceDetails":{"OperatingSystemName":"Microsoft Windows 10 Pro 64-bit","DeviceName":"********","SerialNumber":"*******","DeviceId":"********-****-****-****-************","OSInstall
             DateUTC":"2022-10-19T07:06:37Z","OfflineInstallationId":"********-****-****-****-************","I
             sSandbox":false}}
```