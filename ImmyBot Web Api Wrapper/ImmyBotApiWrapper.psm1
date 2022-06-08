# Get
function Get-AuthToken
{
	<#
	.SYNOPSIS
		Gets an authentication token for ImmyBot
		
	.DESCRIPTION
		Authenticates to the provided ImmyBot instance and returns the authentication token generated
		
	.PARAMETER ip
		IP address of the Home Assistant to connect to or homeassistant.local
		
	.PARAMETER TenantID
		The tenant id for the Azure AD tenant which has the configured enterprise app.
		See the following Microsoft KB on how to find this: 
		https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-how-to-find-tenant
	
	.PARAMETER applicationId
		The application id of the Azure enterprise application
	
	.PARAMETER secret
		The secret for the enterprise application
		
	.PARAMETER ApiEndpointUri
		The desired ImmyBot instance to authenticate to. Example: https://myinstance.immy.bot
	
	.PARAMETER RetainToken
		Optional parameter which specifies the auth token and api endpoint uri should be saved in memory, meaning 
		there is no need to pass the auth token and api endpoint uri as a parameter for other functions.
		Some may not find this secure which is why the parameter is optional.
		
	.INPUTS
		System.String
	.OUTPUTS
		System.String
	.NOTES
		Original function credit goes to Darren Kattan
	#>
	[cmdletbinding()]
	Param (
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -match "^[{]?[0-9a-fA-F]{8}-([0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}[}]?$" })]
		$tenantId,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -match "^[{]?[0-9a-fA-F]{8}-([0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}[}]?$" })]
		$applicationId,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -match "^[{]?[0-9a-fA-F]{8}-([0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}[}]?$" })]
		$secret,
		[parameter(Mandatory = $true)]
		[validatescript({$_ -ilike "https://*.immy.bot"})]
		$ApiEndpointUri
	)
	$RequestAccessTokenUri = "https://login.microsoftonline.com/$tenantId/oauth2/token"
	$body = "grant_type=client_credentials&client_id=$applicationId&client_secret=$Secret&resource=$apiEndpointUri"
	$contentType = 'application/x-www-form-urlencoded'
	try
	{
		Write-Verbose "Attempting to get access token..."
		$AuthToken = Invoke-RestMethod -Method Post -Uri $RequestAccessTokenUri -Body $body -ContentType $contentType -ErrorAction Stop
		Write-Verbose "Access token obtained. Token will expire in $([math]::Round($AuthToken.expires_in/60)) minutes"
	
		return $AuthToken.access_token	
	}
	catch
	{
		Write-Output "Failed to generate auth token. Error message follows:"
		$Error[0]; throw		
	}
}

function Get-ImmyTenant
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
		
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/tenants"
		"authorization" = "Bearer $AuthToken"
	}

	Invoke-RestMethod -UseBasicParsing -Uri "$ApiEndpointUri/api/v1/tenants" -Headers $Header -ErrorAction Stop
}

function Get-ImmySession
{
	<#
	Notes:
		accepted rest params not included yet:
		- skip (int, ex: 0)
		- take (int, ex: 20)
		- requireTotalCount (boolean)
		- sort (example value decoded: [{"selector":"id","desc":true}])
		- filter (example value decoded: ["createdDate",">","05/02/2022 02:20:29"])
	#>
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter()]
		[validateset("Cloud","Agent")]
		$SessionType = "Agent"
	)

	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/maintenance-sessions/dx"
		"authorization" = "Bearer $AuthToken"
	}
	
	if ($SessionType -eq "Cloud")
	{
		$RestParams = "sessionType=1"
	}
	else
	{
		$RestParams = "sessionType=2"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/maintenance-sessions/dx?$RestParams" -Headers $Header -ErrorAction Stop | Select-Object -ExpandProperty data
}

function Get-ImmySessionCount
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
		
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/dashboard/session-counts"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$ApiEndpointUri/api/v1/dashboard/session-counts" -Headers $Header -ErrorAction Stop
}

function Get-ImmyGlobalSoftware
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header =  @{
		"method"	    = "GET"
		"path"		    = "/api/v1/software/global"
		"authorization" = "Bearer $AuthToken"
	}
		
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/software/global" -Headers $Header -ErrorAction Stop
}

function Get-ImmyLocalSoftware
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/software/local"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/software/local" -Headers $Header
}

function Get-ImmyAuthInfo
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/auth"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/auth" -Headers $Header
}

function Get-ImmyAppPrefernce
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/preferences"
		"authorization" = "Bearer $AuthToken"
	} 
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/preferences"
}

function Get-ImmyLicense
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	
	$Header =  @{
		"method"	    = "GET"
		"path"		    = "/api/v1/licenses"
		"authorization" = "Bearer $AuthToken"
	} 
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/licenses" -Headers $Header
}

function Get-ImmyGlobalTask
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/maintenance-tasks/global"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/maintenance-tasks/global" -Headers $Header -ErrorAction Stop
}

function Get-ImmyLocalTask
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/maintenance-tasks/local"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/maintenance-tasks/local" -Headers $Header -ErrorAction Stop
}

function Get-ImmyGlobalScript
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/scripts/global"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/scripts/global" -Headers $Header -ErrorAction Stop	
}

function Get-ImmyLocalScript
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/scripts/local"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/scripts/local" -Headers $Header -ErrorAction Stop
}

function Get-ImmySchedule
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/schedules"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/schedules" -Headers $Header -ErrorAction Stop
}

function Get-ImmyGlobalMedia
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/media/global"
		"authorization" = "Bearer $AuthToken"
	} 
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/media/global" -Headers $Header -ErrorAction Stop
}

function Get-ImmyLocalMedia
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/media/local"
		"authorization" = "Bearer $AuthToken"
	} 
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/media/local" -Headers $Header -ErrorAction Stop
}

function Get-ImmyActiveIntegration
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter()]
		[switch]$IncludeClients = $false,
		[parameter()]
		[switch]$IncludeUnlinkedClients = $false
	)
	
    $Header =  @{
		"method"	    = "GET"
		"path"		    = "/api/v1/provider-links"
		"authorization" = "Bearer $AuthToken"
	}
	
	if ($IncludeClients)
	{
		$RestParams = "includeClients=true"
	}
	else
	{
		$RestParams = "includeClients=false"
	}
	
	if ($IncludeUnlinkedClients)
	{
		$RestParams += "&includeUnlinkedClients=true"
	}
	else
	{
		$RestParams += "&includeUnlinkedClients=false"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/provider-links?$RestParams" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputer
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter()]
		[bool]$IncludeOffline = $false
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/computers"
		"authorization" = "Bearer $AuthToken"
	}
	
	if ($IncludeOffline)
	{
		Invoke-RestMethod -UseBasicParsing -Uri "$ApiEndpointUri/api/v1/computers/paged?includeOffline=true" -Headers $Header -ErrorAction Stop
	}
	Else
	{
		Invoke-RestMethod -UseBasicParsing -Uri "$ApiEndpointUri/api/v1/computers/paged?includeOffline=false" -Headers $Header -ErrorAction Stop
	}
}

function Get-ImmyPendingCount
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/provider-agents/pending-counts"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/provider-agents/pending-counts" -Headers $Header -ErrorAction Stop
}

function Get-ImmyPendingComputer
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter()]
		[switch]$OnboardingOnly = $false,
		[parameter()]
		[switch]$IncludeOffline = $false
	)	
	
    $Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/computers/paged"
		"authorization" = "Bearer $AuthToken"
	}
	
	if ($OnboardingOnly)
	{
		$RestParams = "onboardingOnly=true"
	}
	else
	{
		$RestParams = "onboardingOnly=false"
	}
	
	if ($IncludeOffline)
	{
		$RestParams += "&includeOffline=true"
	}
	else
	{
		$RestParams += "&includeOffline=false"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/computers/paged?$RestParams" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerInfo
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID,
		[parameter()]
		[switch]$IncludeSessions = $false,
		[parameter()]
		[switch]$IncludeAdditionalPersons = $true,
		[parameter()]
		[switch]$IncludeActions = $false,
		[parameter()]
		[switch]$IncludeProviderAgents = $true,
		[parameter()]
		[switch]$IncludeProviderAgentsDeviceUpdateFormData = $false
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/computers/$ImmyComputerID"
		"authorization" = "Bearer $AuthToken"
	}
	
	if ($IncludeSessions)
	{
		$RestParams = "includeSessions=true"
	}
	else
	{
		$RestParams = "includeSessions=false"
	}
	
	if ($IncludeAdditionalPersons)
	{
		$RestParams += "&includeAdditionalPersons=true"
	}
	else
	{
		$RestParams += "&includeAdditionalPersons=false"
	}
	
	if ($IncludeActions)
	{
		$RestParams += "&includeActions=true"
	}
	else
	{
		$RestParams += "&includeActions=false"
	}
	
	if ($IncludeProviderAgents)
	{
		$RestParams += "&includeProviderAgents=true"
	}
	else
	{
		$RestParams += "&includeProviderAgents=false"
	}
	
	if ($IncludeProviderAgentsDeviceUpdateFormData)
	{
		$RestParams += "&includeProviderAgentsDeviceUpdateFormData=true"
	}
	else
	{
		$RestParams += "&includeProviderAgentsDeviceUpdateFormData=false"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/computers/$($ImmyComputerID)?$RestParams" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerScreenShareLink
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID
	)	
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/computers/$ImmyComputerID/screen-share-urls/"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/computers/$ImmyComputerID/screen-share-urls/" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerPendingConflict
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/provider-agents/$ImmyComputerID/pending-conflicts"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/provider-agents/$ImmyComputerID/pending-conflicts" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerNeedsAttention
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/maintenance-actions/computer/$ImmyComputerID/needs-attention"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/maintenance-actions/computer/$ImmyComputerID/needs-attention" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerEvent
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID
	)
	
   $Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/computers/$ImmyComputerID/events"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-WebRequest -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/computers/$ImmyComputerID/events" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerSession
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/maintenance-sessions/dx?computerId=$ImmyComputerID"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/maintenance-sessions/dx?computerId=$ImmyComputerID&sessionType=2" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerOnlineStatus
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/computers/$ImmyComputerID/status"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/computers/$ImmyComputerID/status" -Headers $Header -ErrorAction Stop
}

function Get-ImmyAppMetric
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)	
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/metrics/app"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/metrics/app" -Headers $Header -ErrorAction Stop
}

function Get-ImmyAppCircutBreakerStatus
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/metrics/circuit-breakers"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/metrics/circuit-breakers" -Headers $Header -ErrorAction Stop
}

function Get-ImmyAzureContract
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/azure/contracts"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/azure/contracts" -Headers $Header -ErrorAction Stop
}

function Get-ImmyBranding
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/brandings"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/brandings" -Headers $Header -ErrorAction Stop
}

function Get-ImmyTenantSmtpConfig
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter()]
		[int]$ImmyTenantID = 1
	)
	
	$Headers = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/smtp-configs/$ImmyTenantID"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/smtp-configs/$ImmyTenantID" -Headers $Headers -ErrorAction Stop
}

function Get-ImmyInventoryTask
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/inventory-tasks"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/inventory-tasks" -Headers $Header -ErrorAction Stop
}

function Get-ImmyRelease
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri
	)
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/system/releases"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-WebRequest -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/system/releases" -Headers $Header -ErrorAction Stop
}

# New
function New-ImmyPerson
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter(Mandatory = $true)]
		$FirstName,
		[parameter(Mandatory = $true)]
		$LastName,
		[parameter(Mandatory = $true)]
		$EmailAddress,
		[parameter(Mandatory = $true)]
		[int]$ImmyTenantID,
		[parameter(Mandatory = $true)]
		[validatescript({$_ -match "^[{]?[0-9a-fA-F]{8}-([0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}[}]?$"})]
		$AzurePrincipalID
	)
	
	$Body = "{`"firstName`":`"$FirstName`",`"lastName`":`"$LastName`",`"emailAddress`":`"$EmailAddress`",`"tenantId`":$ImmyTenantID,`"azurePrincipalId`":`"$AzurePrincipalID`"}"
	$Header = @{
		"method"	    = "POST"
		"path"		    = "/api/v1/persons"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/persons" -Headers $Header -Body $Body -ErrorAction Stop
}

function New-ImmyLicense
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter(Mandatory = $true)]
		$LicenseName,
		[parameter(Mandatory = $true)]
		$LicenseValue,
		[parameter(Mandatory = $true)]
		[int]$ImmySoftwareID,
		[parameter(Mandatory = $true)]
		[int]$ImmyTenantID
	)
	
	# need more info on software type/ more examples
	# need an example with an uploaded file too
	# need to add logic for locking to software version
	
	$Body = "{`"name`":`"$LicenseName`",`"licenseValue`":`"$LicenseValue`",`"softwareType`":0,`"softwareIdentifier`":`"$ImmySoftwareID`",`"semanticVersion`":null,`"tenantId`":$ImmyTenantID,`"restrictToMajorVersion`":false"
	$Header = @{
		"method"	    = "POST"
		"path"		    = "/api/v1/licenses"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/licenses" -Headers $Header -Body $Body -ErrorAction Stop
}

# Delete
function Remove-ImmyPerson
{
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$ApiEndpointUri,
		[parameter(Mandatory = $true)]
		[int]$ImmyPersonID
	)
	
	# Add support for confirm and or force common parameter
	
	$Header = @{
		"method"	    = "DELETE"
		"path"		    = "/api/v1/persons/15871"
		"authorization" = "Bearer $AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/persons/$ImmyPersonID" -Headers $Header -ErrorAction Stop
}