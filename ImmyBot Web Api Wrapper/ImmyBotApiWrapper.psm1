# Get
function Get-ImmyTenant
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/tenants"
		"authorization" = "Bearer $Script:AuthToken"
	}

	Invoke-RestMethod -UseBasicParsing -Uri "$Script:ApiEndpointUri/api/v1/tenants" -Headers $Header -ErrorAction Stop
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
		- filter also allows for filtering by date
	#>
	param
	(
		[parameter()]
		[validateset("Cloud","Agent", "All")]
		$SessionType = "All",
		[parameter()]
		[validateset("Running","Pending","Created","Completed","All")]
		$FilterBy = "All"
	)
	
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/maintenance-sessions/dx"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	switch ($SessionType) {
		"Cloud" {
			$RestParams = "sessionType=1"
			Write-Verbose "Rest parameters set to $RestParams"
		}
		"Agent" {
			$RestParams = "sessionType=2"
			Write-Verbose "Rest parameters set to $RestParams"
		}
	}
	
	# To do: provide more filter options. ex: filter by sessions with error(s) etc
	# INCOMPLETE/NOT FUNCTIONING
	switch ($FilterBy) {
		"Running" {
			$RawStringParam = 'filter=[["sessionStatus","=",1],"and",["createdDate",">","01/01/1970 00:00:00"]]'
			$RestParams += [System.Web.HttpUtility]::UrlEncode($RawStringParam)
			Write-Verbose "Rest parameters set to $RestParams"
		}
		"Pending" {
			$RawStringParam = 'filter=[["sessionStatus","=",6],"or",["sessionStatus","=",8]]'
			$RestParams += [System.Web.HttpUtility]::UrlEncode($RawStringParam)
			Write-Verbose "Rest parameters set to $RestParams"
		}
		"Created" {
			$RawStringParam = 'filter=[["sessionStatus","=",3],"and",["createdDate",">","01/01/1970 00:00:00"]]'
			$RestParams += [System.Web.HttpUtility]::UrlEncode($RawStringParam)
			Write-Verbose "Rest parameters set to $RestParams"
		}
		"Completed" {
			$RawStringParam = 'filter=[["sessionStatus","=",0],"or",["sessionStatus","=",2],"or",["sessionStatus","=",7],"or",["sessionStatus","=",4],"or",["sessionStatus","=",5]]'
			$RestParams += [System.Web.HttpUtility]::UrlEncode($RawStringParam)
			Write-Verbose "Rest parameters set to $RestParams"
		}
	}
	$boolCheck = [bool]$RestParams
	
	if ($boolCheck)
	{
		Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/maintenance-sessions/dx?$RestParams" -Headers $Header -ErrorAction Stop
	}
	else
	{
		Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/maintenance-sessions/dx" -Headers $Header -ErrorAction Stop
	}	
}

function Get-ImmySessionCount
{
	Resolve-AuthToken
		
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/dashboard/session-counts"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/dashboard/session-counts" -Headers $Header -ErrorAction Stop
}

function Get-ImmyGlobalSoftware
{
	Resolve-AuthToken
	
	$Header =  @{
		"method"	    = "GET"
		"path"		    = "/api/v1/software/global"
		"authorization" = "Bearer $Script:AuthToken"
	}
		
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/software/global" -Headers $Header -ErrorAction Stop
}

function Get-ImmyLocalSoftware
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/software/local"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/software/local" -Headers $Header
}

function Get-ImmyAuthInfo
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/auth"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/auth" -Headers $Header
}

function Get-ImmyAppPrefernce
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/preferences"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$script:ApiEndpointUri/api/v1/preferences" -Headers $Header | Select-Object -ExpandProperty applicationpreferences
}

function Get-ImmyLicense
{
	Resolve-AuthToken	
	
	$Header =  @{
		"method"	    = "GET"
		"path"		    = "/api/v1/licenses"
		"authorization" = "Bearer $Script:AuthToken"
	} 
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/licenses" -Headers $Header
}

function Get-ImmyGlobalTask
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/maintenance-tasks/global"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/maintenance-tasks/global" -Headers $Header -ErrorAction Stop
}

function Get-ImmyLocalTask
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/maintenance-tasks/local"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/maintenance-tasks/local" -Headers $Header -ErrorAction Stop
}

function Get-ImmyGlobalScript
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/scripts/global"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/scripts/global" -Headers $Header -ErrorAction Stop	
}

function Get-ImmyLocalScript
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/scripts/local"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/scripts/local" -Headers $Header -ErrorAction Stop
}

function Get-ImmySchedule
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/schedules"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/schedules" -Headers $Header -ErrorAction Stop
}

function Get-ImmyGlobalMedia
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/media/global"
		"authorization" = "Bearer $Script:AuthToken"
	} 
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/media/global" -Headers $Header -ErrorAction Stop
}

function Get-ImmyLocalMedia
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/media/local"
		"authorization" = "Bearer $Script:AuthToken"
	} 
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/media/local" -Headers $Header -ErrorAction Stop
}

function Get-ImmyActiveIntegration
{
	param
	(
		[parameter()]
		[switch]$IncludeClients = $false,
		[parameter()]
		[switch]$IncludeUnlinkedClients = $false
	)
	
	Resolve-AuthToken
	
    $Header =  @{
		"method"	    = "GET"
		"path"		    = "/api/v1/provider-links"
		"authorization" = "Bearer $Script:AuthToken"
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
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/provider-links?$RestParams" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputer
{
	param
	(
		[parameter()]
		[int]$ResultSize = 100000
	)
	
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/computers?&pageSize=$ResultSize&orderByUpdatedDate=true&tenantId=null"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/computers?&pageSize=$ResultSize&orderByUpdatedDate=true&tenantId=null" -Headers $Header -ErrorAction Stop
}

function Get-ImmyPendingCount
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/provider-agents/pending-counts"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/provider-agents/pending-counts" -Headers $Header -ErrorAction Stop
}

function Get-ImmyPendingComputer
{
	param
	(
		[parameter()]
		[switch]$OnboardingOnly = $false,
		[parameter()]
		[switch]$IncludeOffline = $false
	)
	
	Resolve-AuthToken
	
    $Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/computers/paged"
		"authorization" = "Bearer $Script:AuthToken"
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
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/computers/paged?$RestParams" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerInfo
{
	param
	(
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
	
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/computers/$ImmyComputerID"
		"authorization" = "Bearer $Script:AuthToken"
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
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/computers/$($ImmyComputerID)?$RestParams" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerScreenShareLink
{
	param
	(
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID
	)
	
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/computers/$ImmyComputerID/screen-share-urls/"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/computers/$ImmyComputerID/screen-share-urls/" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerPendingConflict
{
	param
	(
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID
	)
	
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/provider-agents/$ImmyComputerID/pending-conflicts"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/provider-agents/$ImmyComputerID/pending-conflicts" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerNeedsAttention
{
	param
	(
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID
	)
	
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/maintenance-actions/computer/$ImmyComputerID/needs-attention"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/maintenance-actions/computer/$ImmyComputerID/needs-attention" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerEvent
{
	param
	(
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID
	)
	
	Resolve-AuthToken
	
    $Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/computers/$ImmyComputerID/events"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/computers/$ImmyComputerID/events" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerSession
{
	param
	(
		[parameter(Mandatory = $true)]
		[int]$ImmySessionID,
		[parameter()]
		[switch]$IncludeComputer = $false,
		[parameter()]
		[switch]$includeTenant = $false,
		[parameter()]
		[switch]$IncludeStages = $false,
		[parameter()]
		[switch]$IncludeActions = $false,
		[parameter()]
		[switch]$IncludeLogs = $false
	)
	
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/maintenance-sessions/$ImmySessionID"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	$RestParams = "includeComputer=$IncludeComputer&includeTenant=$includeTenant&includeStages=$IncludeStages&includeLogs=$IncludeLogs"
	<#
	if ($IncludeComputer)
	{
		$RestParams = "includeComputer=true"
	}
	else
	{
		$RestParams = "includeComputer=false"
	}
	
	if ($IncludeTenant)
	{
		$RestParams += "&includeTenant=true"
	}
	else
	{
		$RestParams += "&includeTenant=false"
	}
	
	if ($IncludeStages)
	{
		$RestParmas += "&includeStages=true"
	}
	else
	{
		$RestParmas += "&includeStages=false"
	}
	
	if ($IncludeLogs)
	{
		$RestParams += "&includeLogs=true"
	}
	else
	{
		$RestParams += "&includeLogs=false"
	}
	#>
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/maintenance-sessions/$($ImmySessionID)?$($RestParams)" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerOnlineStatus
{
	param
	(
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID
	)
	
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/computers/$ImmyComputerID/status"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/computers/$ImmyComputerID/status" -Headers $Header -ErrorAction Stop
}

function Get-ImmyAppMetric
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/metrics/app"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/metrics/app" -Headers $Header -ErrorAction Stop | Select-Object -ExpandProperty contexts
}

function Get-ImmyAppCircutBreakerStatus
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/metrics/circuit-breakers"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/metrics/circuit-breakers" -Headers $Header -ErrorAction Stop
}

function Get-ImmyAzureContract
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/azure/contracts"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/azure/contracts" -Headers $Header -ErrorAction Stop
}

function Get-ImmyBranding
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/brandings"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/brandings" -Headers $Header -ErrorAction Stop
}

function Get-ImmyTenantSmtpConfig
{
	param
	(
		[parameter()]
		[int]$ImmyTenantID = 1
	)
	
	Resolve-AuthToken
	
	$Headers = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/smtp-configs/$ImmyTenantID"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/smtp-configs/$ImmyTenantID" -Headers $Headers -ErrorAction Stop
}

function Get-ImmyInventoryTask
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/inventory-tasks"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/inventory-tasks" -Headers $Header -ErrorAction Stop
}

function Get-ImmyRelease
{
	# likely not working right now
	
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/system/releases"
		"authorization" = "Bearer $Script:AuthToken"
		"referer"	    = "$script:ApiEndpointUri/settings/system-update"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/system/releases" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerSoftware
{
	param
	(
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID
	)
	
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/computers/$ImmyComputerID/inventory-script-results/Software"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/computers/$ImmyComputerID/inventory-script-results/Software" -Headers $Header -ErrorAction Stop
}

function Get-ImmyComputerMaintenanceAction
{
	param
	(
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID,
		[parameter()]
		[switch]$LatestForComputer = $false
	)
	
	Resolve-AuthToken
	
	if ($LatestForComputer)
	{
		$Header = @{
			"method" = "GET"
			"path"   = "/api/v1/maintenance-actions/latest-for-computer/$ImmyComputerID"
			"authorization" = "Bearer $Script:AuthToken"
		}
		$(Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/maintenance-actions/latest-for-computer/$ImmyComputerID" -Headers $Header -ErrorAction Stop) | Select-Object -ExpandProperty data
	}
	Else
	{
		$Header = @{
			"method" = "GET"
			"path"   = "/api/v1/maintenance-actions/dx-for-computer/$ImmyComputerID"
			"authorization" = "Bearer $Script:AuthToken"
		}
		$(Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/maintenance-actions/dx-for-computer/$ImmyComputerID" -Headers $Header -ErrorAction Stop) | Select-Object -ExpandProperty data
	}
}

function Get-ImmyPerson
{
	Resolve-AuthToken
	
	$Header = @{
			"method" = "GET"
			"path"   = "/api/v1/Persons"
			"authorization" = "Bearer $Script:AuthToken"
	}
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/Persons" -Headers $Header -ErrorAction Stop
}

function Get-ImmyUser
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/Users"
		"authorization" = "Bearer $Script:AuthToken"
	}
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/Users" -Headers $Header -ErrorAction Stop
}

function Get-ImmyDeployment
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/target-assignments"
		"authorization" = "Bearer $Script:AuthToken"
	}
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/target-assignments" -Headers $Header -ErrorAction Stop
}

function Get-ImmyRecommendedDeployment
{
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "GET"
		"path"		    = "/api/v1/target-assignments/recommended-approvals"
		"authorization" = "Bearer $Script:AuthToken"
	}
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/target-assignments/recommended-approvalss" -Headers $Header -ErrorAction Stop
}

# New
function New-ImmyPerson
{
	param
	(
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
	
	Resolve-AuthToken
	
	$Body = "{`"firstName`":`"$FirstName`",`"lastName`":`"$LastName`",`"emailAddress`":`"$EmailAddress`",`"tenantId`":$ImmyTenantID,`"azurePrincipalId`":`"$AzurePrincipalID`"}"
	$Header = @{
		"method"	    = "POST"
		"path"		    = "/api/v1/persons"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/persons" -Headers $Header -Body $Body -ErrorAction Stop
}

function New-ImmyLicense
{
	param
	(
		[parameter(Mandatory = $true)]
		$LicenseName,
		[parameter(Mandatory = $true)]
		$LicenseValue,
		[parameter(Mandatory = $true)]
		[int]$ImmySoftwareID,
		[parameter(Mandatory = $true)]
		[int]$ImmyTenantID
	)
	
	Resolve-AuthToken
	
	# need more info on software type/ more examples
	# need an example with an uploaded file too
	# need to add logic for locking to software version
	
	$Body = "{`"name`":`"$LicenseName`",`"licenseValue`":`"$LicenseValue`",`"softwareType`":0,`"softwareIdentifier`":`"$ImmySoftwareID`",`"semanticVersion`":null,`"tenantId`":$ImmyTenantID,`"restrictToMajorVersion`":false"
	$Header = @{
		"method"	    = "POST"
		"path"		    = "/api/v1/licenses"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/licenses" -Headers $Header -Body $Body -ErrorAction Stop
}

function New-ImmyDeployment
{
	param
	(
		[parameter(Mandatory = $true)]
		[int]$ImmyMaintenanceTaskID,
		[parameter(Mandatory = $true)]
		[parameter(ParameterSetName = 'Cross_tenant')]
		[parameter(ParameterSetName = 'Single_tenant')]
		[parameter(ParameterSetName = 'Individual')]
		[validateset("Cross Tenant", "Single Tenant", "Individual")]
		[String]$TargetScope,
		[parameter()]
		[bool]$OnboardingOnly = $false,
		[parameter(ParameterSetName = 'Cross_tenant')]
		[parameter(ParameterSetName = 'Single_tenant')]
		[ValidateSet("All Computers", "MetaScript", "Filter Script", "Tag")]
		[String]$TargetType = "All Computers",
		[parameter(ParameterSetName = 'Cross_tenant')]
		[parameter(ParameterSetName = 'Single_tenant')]
		[ValidateSet("No Filter", "Servers", "Workstations", "Portable Devices", "Workstations and Portable Devices", "Domain Controllers", "Primary Domain Controllers")]
		[String]$TargetFilter = "Workstations and Portable Devices",
		# MAKE A SOFTWARE PARAMETER SET
		[parameter(Mandatory = $true)]
		[validateset("Installed", "Update if Found", "Uninstalled", "Ignored")]
		[String]$SoftwareState = "Installed",
		[parameter(Mandatory = $true)]
		# VALIDATE THAT ALL THESE OPTIONS APPLY TO SOFTWARE/TASK
		[validateset("Enforce", "Audit", "Monitor", "Ignore")]
		[String]$TaskMode = "Enforce"
	)
	
	# Need dynamic parameter for metascript, filterscript, and any software/task options/parameters
	
	DynamicParam
	{
		$paramDictionary = New-Object -Type System.Management.Automation.RuntimeDefinedParameterDictionary
		
		switch ($TargetScope)
		{
			"Single Tenant" {
				$attributes = New-Object System.Management.Automation.ParameterAttribute
				$attributes.ParameterSetName = "Cross_tenant"
				$attributes.Mandatory = $true
				$attributeCollection = New-Object -Type System.Collections.ObjectModel.Collection[System.Attribute]
				$attributeCollection.Add($attributes)
				$dynParam1 = New-Object -Type System.Management.Automation.RuntimeDefinedParameter("TenantID", [int], $attributeCollection)
				$paramDictionary.Add("TenantID", $dynParam1)
			}
			"Individual" {
				$AttribColl = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
				$attributes = New-Object System.Management.Automation.ParameterAttribute
				$attributes.ParameterSetName = "Individual"
				$attributes.Mandatory = $true
				$dynParam1 = New-Object -Type System.Management.Automation.RuntimeDefinedParameter("TargetSubType", [String], $attributeCollection)
				$paramDictionary.Add("TargetSubType", $dynParam1)
			}
		}
		
		switch ($TargetSubType)
		{
			"Person" {
				$attributes = New-Object System.Management.Automation.ParameterAttribute
				$attributes.ParameterSetName = "Individual"
				$attributes.Mandatory = $true
				$attributeCollection = New-Object -Type System.Collections.ObjectModel.Collection[System.Attribute]
				$attributeCollection.Add($attributes)
				$dynParam1 = New-Object -Type System.Management.Automation.RuntimeDefinedParameter("PersonID", [int], $attributeCollection)
				$paramDictionary.Add("PersonID", $dynParam1)
			}
			"Computer" {
				$attributes = New-Object System.Management.Automation.ParameterAttribute
				$attributes.ParameterSetName = "Individual"
				$attributes.Mandatory = $true
				$attributeCollection = New-Object -Type System.Collections.ObjectModel.Collection[System.Attribute]
				$attributeCollection.Add($attributes)
				$dynParam1 = New-Object -Type System.Management.Automation.RuntimeDefinedParameter("ImmyComputerID", [int], $attributeCollection)
				$paramDictionary.Add("ImmyComputerID", $dynParam1)
			}
		}
		
		return $paramDictionary
	}
	
	# Need dynamic parameters based on selected maintenance task ID
	# translate maintenancetype and targettype to words
	BEGIN 
	{	
	    Resolve-AuthToken
	}
	PROCESS
	{
		switch ($TargetType)
		{
			"Cross Tenant" {
				$TargetTypeID = 1
			}
			"Single Tenant" {
				$TargetTypeID = 2
			}
			"Individual" {
				$TargetTypeID = 3
			}
		}
		
		
		
		$Header = @{
			"method"	    = "GET"
			"path"		    = "/api/v1/target-assignments"
			"authorization" = "Bearer $Script:AuthToken"
		}
		
		$Body = "{`"id`":0,`"maintenanceIdentifier`":`"303`",`"maintenanceType`":0,`"targetType`":$TargetType,`"onboardingOnly`":$OnboardingOnly,`"targetName`":`"DESKTOP-2CR5DH5`",`"target`":`"4510`",`"targetCategory`":0,`"targetGroupFilter`":0,`"desiredSoftwareState`":5,`"softwareProviderType`":null,`"softwareSemanticVersion`":null,`"maintenanceTaskMode`":0,`"maintenanceTaskParameterValues`":[{`"id`":0,`"deploymentId`":0,`"maintenanceTaskType`":0,`"maintenanceTaskId`":132,`"maintenanceTaskParameterId`":321,`"value`":true,`"allowOverrideFromComputerOnboarding`":false}],`"excluded`":false,`"tenantId`":4,`"providerLinkId`":null,`"licenseId`":null,`"providerDeviceGroupType`":null,`"providerClientGroupType`":null}"
		
		Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/target-assignments" -Headers $Header -ErrorAction Stop
	}
}

function New-ImmyConnection
{
	<#
	.SYNOPSIS
		Authenticates to Immybot
		
	.DESCRIPTION
		Authenticates to the provided ImmyBot instance and stores authentication token as a private variable
		
	.PARAMETER ip
		IP address of the Home Assistant to connect to or homeassistant.local
		
	.PARAMETER AzureTenantId
		The tenant id for the Azure AD tenant which has the configured enterprise app.
		See the following Microsoft KB on how to find this: 
		https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-how-to-find-tenant
	
	.PARAMETER AzureApplicationId
		The application id of the Azure enterprise application
	
	.PARAMETER AzureAppSecret
		The secret for the enterprise application
		
	.PARAMETER ApiEndpointUri
		The desired ImmyBot instance to authenticate to. Example: https://myinstance.immy.bot
	
	.INPUTS
		System.String
	.OUTPUTS
		System.String
	.NOTES
		Original function credit goes to Darren Kattan
	#>
	
	# TODO: Add check if automate/control integrations are enabled for target types in deployments
	# TODO: Load all software and maintenance tasks into memory for auto completers
	# TODO: Switch auto completers to using computer/software/task name rather than ID for ease of use
	[cmdletbinding()]
	Param (
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -match "^[{]?[0-9a-fA-F]{8}-([0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}[}]?$" })]
		$AzureTenantId,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -match "^[{]?[0-9a-fA-F]{8}-([0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}[}]?$" })]
		$AzureApplicationId,
		[parameter(Mandatory = $true)]
		$AzureAppSecret,
		[parameter(Mandatory = $true)]
		[validatescript({ $_ -ilike "https://*.immy.bot" })]
		$APIEndpointUri
	)
	$RequestAccessTokenUri = "https://login.microsoftonline.com/$AzureTenantId/oauth2/token"
	$body = "grant_type=client_credentials&client_id=$AzureApplicationId&client_secret=$AzureAppSecret&resource=$APIEndpointUri"
	$contentType = 'application/x-www-form-urlencoded'
	try
	{
		Write-Verbose "Attempting to get access token..."
		$TokenInfo = Invoke-RestMethod -Method Post -Uri $RequestAccessTokenUri -Body $body -ContentType $contentType -ErrorAction Stop
		Write-Verbose "Setting up ImmyComputerID autocompleters..."
		Set-Variable -Name "Token_Exp" -Value $($(Get-date).AddMinutes($([math]::Round($TokenInfo.expires_in/60)))) -Visibility Private -Scope Script -Force
		Set-Variable -Name "AuthToken" -Value $TokenInfo.access_token -Visibility Private -Scope Script -Force
		Set-Variable -Name "ApiEndpointUri" -Value $TokenInfo.resource -Visibility Private -Scope Script -Force
		Set-Variable -Name "all_immyComputers" -Value $(Get-ImmyComputer) -Visibility Private -Scope Script -Force
		$computerID_autocomplete = {
			param ($commandName,
				$parameterName,
				$stringMatch)
			$all_immyComputers.id | Where-Object {
				$_ -like "$stringMatch*"
			} | ForEach-Object {
				"'$_'"
			}
			
		}
		Register-ArgumentCompleter -CommandName Get-ImmyComputerOnlineStatus, Get-ImmyComputerSession, Get-ImmyComputerEvent, Get-ImmyComputerNeedsAttention, Get-ImmyComputerPendingConflict, Get-ImmyComputerScreenShareLink, Get-ImmyComputerInfo -ParameterName ImmyComputerID -ScriptBlock $computerID_autocomplete
		
		Write-Output "Access token obtained. Token will expire in $([math]::Round($TokenInfo.expires_in/60)) minutes"
	}
	catch
	{
		Write-Output "Failed to generate auth token. Error message follows:"
		$Error[0]; throw
	}
}

function New-ImmyAgent
{
	# TODO: Provide ability to generate more than exe installer
	param
	(
		[parameter(Mandatory = $true)]
		$AuthToken,
		[parameter(Mandatory = $true)]
		$AdditonalPersonsID,
		[parameter(Mandatory = $true)]
		$ImmyTenantID,
		[parameter(Mandatory = $false)]
		[ValidateSet("true", "false")]
		$AutoOnboard = "true",
		[parameter(Mandatory = $false)]
		$PrimaryPersonID = "null",
		[parameter(Mandatory = $false)]
		[ValidateSet("true", "false")]
		$SendFollowUpEmail = "true"
	)
	
	Resolve-AuthToken
	
	$Headers = @{
		"method"	    = "POST"
		"path"		    = "/api/v1/provider-links/1/agents/executable-uri-with-onboarding"
		"authorization" = "Bearer $Script:AuthToken"
	}
	$Body = "{`"targetExternalClientId`":$ImmyTenantID,`"onboardingOptions`":{`"primaryPersonId`":$PrimaryPersonID,`"additionalPersonIds`":$AdditionalPersonsID,`"automaticallyOnboard`":$AutoOnboard,`"onboardingSessionSendFollowUpEmail`":$SendFollowUpEmail,`"onboardingCorrelationId`":`"ee19d00c-c06c-44c8-8a4e-13528595ee1a`",`"onboardingSessionRebootPreference`":0}}"
	Invoke-RestMethod -method Post -UseBasicParsing -Uri "$script:ApiEndpointUri/api/v1/provider-links/1/agents/executable-uri-with-onboarding" -Headers $Headers -Body $Body -ContentType "application/json;charset=UTF-8" -ErrorAction Stop
}

# Remove
function Remove-ImmyPerson
{
	param
	(
		[parameter(Mandatory = $true)]
		[int]$ImmyPersonID
	)
	
	Resolve-AuthToken
	
	# Add support for confirm and or force common parameter
	
	$Header = @{
		"method"	    = "DELETE"
		"path"		    = "/api/v1/persons/15871"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/persons/$ImmyPersonID" -Headers $Header -ErrorAction Stop
}

function Remove-ImmySession
{
	# This is really how to cancel a session pending or running but cancel is not an approved verb
	
	param
	(
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID
	)
	
	Resolve-AuthToken
	
	$Header = @{
		"method" = "GET"
		"path"   = "/api/v1/maintenance-sessions/$ImmyComputerID/cancel"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	Invoke-RestMethod -UseBasicParsing -Uri "https://ainfosys.immy.bot/api/v1/maintenance-sessions/$ImmyComputerID/cancel" -Headers $Header -ErrorAction Stop
}

# Invoke
function Invoke-ImmyMaintenance
{
	param
	(
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID,
		[parameter()]
		[switch]$runInventoryInDetection = $false,
		[parameter()]
		[switch]$detectionOnly = $false,
		[parameter()]
		[switch]$sendFollowUpEmail = $false,
		[parameter()]
		[switch]$suppressRebootsDuringBusinesshours = $false,
		[parameter()]
		[switch]$sendDetectionEmail = $False,
		[parameter()]
		[switch]$skipBackgroundJob = $false
	)
	
	Resolve-AuthToken
	
	# reboot preference is set to suppress, need to get value for other two options
	# need more information on onlyOnboardingOverridableTasks
	# need more information on skipBackgroundJob
	# need more information on cacheOnly
	# offlineBehavior should be set to apply on connection but need to double check this
	 
	$Header = @{
		"method"	    = "POST"
		"path"		    = "/api/v1/run-immy-service"
		"authorization" = "Bearer $Script:AuthToken"
	}
	
	# seperate this into multiple lines to avoid horizontal scrolling
	$Body = "{`"tenants`":[],`"computers`":[{`"computerId`":$ImmyComputerID}],`"rebootPreference`":1,`"runInventoryInDetection`":$runInventoryInDetection,`"detectionOnly`":$detectionOnly,`"sendFollowUpEmail`":$sendFollowUpEmail,`"skipBackgroundJob`":false,`"cacheOnly`":false,`"fullMaintenance`":false,`"resolutionOnly`":false,`"offlineBehavior`":2,`"suppressRebootsDuringBusinesshours`":$suppressRebootsDuringBusinesshours,`"sendDetectionEmail`":false,`"sendFollowUpOnlyIfActionNeeded`":false,`"showRunNowButton`":false,`"showPostponeButton`":false,`"showMaintenanceActions`":false,`"onlyOnboardingOverridableTasks`":false}"
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/run-immy-service" -Headers $Header -Body $Body -ErrorAction Stop
}

# Set
function Set-ImmyComputerOnboardingSetting
{
	# this function is incomplete and untested. It may not function in its current form
	param
	(
		[parameter(Mandatory = $true)]
		[int]$ImmyComputerID,
		[parameter(Mandatory = $True)]
		[int]$AdditionalPersonsIDs,
		[parameter(Mandatory = $True)]
		[int]$ImmyTenantID,
		[parameter(Mandatory = $True)]
		$OnboardingStatus
	)
	
	Resolve-AuthToken
	
	$Header = @{
		"method"	    = "PUT"
		"path"		    = "/api/v1/computers/$ImmyComputerID"
		"authorization" = "Bearer $Script:AuthToken"
	}
	$Body = "{`"tenantId`":$ImmyTenantID,`"additionalPersonIds`":[$AdditionalPersonsIDs],`"onboardingStatus`":$OnboardingStatus,`"providerLinkUpdates`":[]}"
	
	Invoke-RestMethod -UseBasicParsing -Uri "$Script:APIEndpointUri/api/v1/computers/$ImmyComputerID" -Headers $Header -Body $Body -ErrorAction Stop
}

# Internal functions
function Resolve-AuthToken
{
	<#
	.DESCRIPTION:
		Internal function to validate the authentication token being used is still valid
	.PARAMETER Check
		Used to check if the auth token is still valid without throwing an error. Returns false if the
		auth token is not valid, otherwise returns true. Created for use with a personal application.
	#>
	param (
		[parameter()]
		[switch]$Check = $False
	)
	
	if ($Check)
	{
		if ($(Get-date) -gt [datetime]$Script:Token_Exp)
		{
			return $False
		}
		else
		{
			return $True
		}
	}
	else
	{
		if ($(Get-date) -gt [datetime]$Script:Token_Exp)
		{
			Write-Warning "The authentication token has expired. Please run New-ImmyConnection again to get a fresh authentication token."; Throw
		}
	}
}