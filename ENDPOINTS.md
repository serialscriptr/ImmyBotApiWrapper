# API Endpoints
Very basic information on API endpoints I have discovered while creating this module. More information will be added as I work on the module including parameters for endpoints when applicable.
|              Endpoint |                       Description  (Get method)     |
|-----------------------|-----------------------------------------------------|
|/api/v1/tenants        | Returns Tenants and their details |
|/api/v1/maintenance-sessions/dx | Returns sessions and their details |
|/api/v1/dashboard/session-counts | Returns session counts |
|/api/v1/software/global | Returns global software and their details |
|/api/v1/software/local | Returns local software and their details |
|/api/v1/auth | Returns information on the Immybot instance and the user account used to authenticate |
|/api/v1/preferences | Returns information on the settings configured for the Immybot instance |
|/api/v1/licenses | Returns licenses and their details |
|/api/v1/maintenance-tasks/global | Returns global maintenance tasks and their details |
|/api/v1/maintenance-tasks/local | Returns local maintenace tasks and their details |
|/api/v1/scripts/global | Returns global scripts and their details |
|/api/v1/scripts/local | Returns local scripts and their details |
|/api/v1/schedules | Returns configured schedules and their details |
|/api/v1/media/global | Returns global media and their details |
|/api/v1/media/local | Returns local media and their details |
|/api/v1/provider-links | Returns active integrations for the Immybot instance |
|/api/v1/computers | Returns computers in Immybot and basic information on each |
|/api/v1/provider-agents/pending-counts| Returns a count of pending computers |
|/api/v1/computers/{Computer ID} | Returns detailed information on the provided computer |
|/api/v1/computers/{Computer ID}/screen-share-urls/ | Returns a link for initiating a remote session to the provided computer. Only works when an active integration provides remote sessions (Such as control)
|/api/v1/provider-agents/{Computer ID}/pending-conflicts | *Needs more detail |
|/api/v1/maintenance-actions/computer/$ImmyComputerID/needs-attention | *Needs more detail |
|/api/v1/computers/{Computer ID}/events | Returns a count of computer events and their details |
|/api/v1/maintenance-sessions/{Session ID} | Returns detailed information on the provided session |
|/api/v1/computers/{Computer ID}/status | Returns true if the provided computer is online or false if offline |
|/api/v1/metrics/app | Returns information from the immy.bot/settings/system-status page |
|/api/v1/metrics/circuit-breakers | Returns information on circuits |
|/api/v1/azure/contracts | Returns information on accessible azure tenants |
|/api/v1/brandings | Returns information on configured branding themes |
|/api/v1/smtp-configs/{Immy Tenant ID} | *Needs more detail |
|/api/v1/inventory-tasks | Returns information on configured inventory tasks which run daily or hourly against computers |
|/api/v1/system/releases | *Needs more detail |
|/api/v1/computers/{Computer ID}/inventory-script-results/Software | Returns results of last run software inventory task for provided computer |
|/api/v1/maintenance-actions/latest-for-computer/{Computer ID} | Returns latest maintenance actions and results for provided computer |
|/api/v1/Persons | Returns information on people pulled from azure ad or local ad |
|/api/v1/Users | Returns information on configured Immybot accounts for the instance |
|/api/v1/target-assignments | Returns information on configured deployments |
|/api/v1/target-assignments/recommended-approvals | Returns information on recommended deployments and their approval status |
