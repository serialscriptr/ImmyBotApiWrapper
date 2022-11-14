# Integrations (Providers) Endpoint
## API Endpoint
> /api/v1/provider-links
## Description
> Returns an array of active integrations in the Immybot instance and some information about them. Unless you have an integration like connectwise automate/control etc this will only show the Immybot agent.
## Method
> Get
## Endpoint Parameters
- **includeClients** : boolean
- **includeUnlinkedClients** : boolean
## Example output
> The following example output excludes the optional parameters
```sh
id                                                    : 1
disabled                                              : False
healthStatus                                          : 2
healthStatusMessage                                   :
name                                                  : ImmyBot Agent
runScriptPriority                                     : 3
providerTypeFormData                                  : @{ChallengeValiditySpan=10; PPKGBuilderFunctionEndpoint=https://
                                                        immybotsharedfunctions.azurewebsites.net/api/ImmyPpkgBuilder;
                                                        UseStaticChallengeSigningKey=False}
inputsWithStoredPasswords                             : {ChallengeSigningKey, AgentServiceBusTopicName,
                                                        IoTHubEventEndpointString, IoTHubProvisioningIDScope...}
ownerTenantId                                         : 1
providerTypeId                                        : ********-****-****-****-*************
providerPluginBaseUrl                                 : /plugins/api/v1/1
updatedBy                                             :
createdBy                                             :
updatedDateUTC                                        : 2022-11-12T10:23:08.101567Z
createdDateUTC                                        : 2021-03-10T16:06:21.914792Z
includeClientsFailedMessage                           :
getFormSchemaFailedMessage                            :
getProviderFailedMessage                              :
updatedByName                                         :
supportsClients                                       : False
supportsDeviceUpdating                                : False
supportsAgentProvisioningPackageUri                   : True
supportsAgentExecutableUri                            : True
supportsAgentPowerShellInstallScript                  : True
supportsAgentBashInstallScript                        : False
agentPpkgUriSupportsOnboardingOptions                 : True
agentExecutableUriSupportsOnboardingOptions           : True
agentPowerShellInstallScriptSupportsOnboardingOptions : True
agentBashInstallScriptSupportsOnboardingOptions       : False
supportsDeletingOfflineComputer                       : True
supportsScreenShare                                   : False
supportsRefreshAgentOnlineStatus                      : True
supportsWindowsUpdates                                : False
supportsUpgradingAgentVersion                         : True
supportsRunningScripts                                : True
supportsProviderClientStatus                          : False
supportsProviderClientType                            : False
supportsHttpRequest                                   : True
supportedCrossProviderClientLinkages                  : {}
supportedCrossProviderInitializationLinkages          : {}
ownerTenant                                           :
providerClients                                       :
computers                                             :
schedules                                             :
providersLinkedFromThisProvider                       :
linkedFromProviders                                   :
```