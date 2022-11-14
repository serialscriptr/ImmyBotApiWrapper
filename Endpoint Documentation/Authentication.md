# Authentication Endpoint
## Description
First follow the guide on setting up an azure enterprise application on the official Immybot webesite [here](https://docs.immy.bot/csp-preconsent-instructions.html#create-an-app-registration)
Once you create an azure enterprise application you need to create a new "person" in your Immybot instance. The AD External ID will be the object id of the azure enterprise application you just created.
Once you have the user created you need to make that 'person' a 'user.' You can keep the user as non admin if you want a mostly read only user, otherwise make the user an admin.

> Now to authenticate you will need the following parameters:
- **AzureTenantId** : your msp azure tenant's id
- **AzureApplicationId** : the application id for the application you created earlier
- **AzureAppSecret** : the application secret for the application created earlier
- **APIEndpointUri** : the Immybot instance URL Ex: `https://*.immy.bot`
> The bearer token returned by authenticating to the following URL is used to successfully run API queries
## Authentication URL
> `https://login.microsoftonline.com/$AzureTenantId/oauth2/token`
## Method
> POST
## Body
> `grant_type=client_credentials&client_id=$AzureApplicationId&client_secret=$AzureAppSecret&resource=$APIEndpointUri`
## Example output
```sh
token_type     : Bearer
expires_in     : 3599
ext_expires_in : 3599
expires_on     : 1668390061
not_before     : 1668386161
resource       : https://*.immy.bot
access_token   : <*BEARER TOKEN VALUE*>
```
> By default the bearer token expires in 60 minutes as shown in the 'expires_in' field shown in seconds
