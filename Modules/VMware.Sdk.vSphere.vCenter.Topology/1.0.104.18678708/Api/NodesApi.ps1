#
# Topology Paths
# The vcenter topology package provides services to retrieve all vCenter and Platform Services Controller nodes and replication status in the topology.
# Version: v7.0U3
# Contact: powercli@vmware.com
# Generated by OpenAPI Generator: https://openapi-generator.tech
#

<#
.SYNOPSIS

Retrieve details for a given identifier of the vCenter or Platform Services Controller node. if you do not have all of the privileges described as follows:     -  Operation execution requires System.Read.  

.DESCRIPTION

No description available.

.PARAMETER Node
Identifier of the vCenter or Platform Services Controller node. Identifier can be either IP address or DNS resolvable name of the node. The parameter must be an identifier for the resource type: com.vmware.vcenter.VCenter.name.

.PARAMETER WithHttpInfo

A switch when turned on will return a hash table of Response, StatusCode and Headers instead of just the Response

.OUTPUTS

TopologyNodesInfo

.LINK

Online Version: https://developer.vmware.com/docs/vsphere-automation/latest/vcenter/api/vcenter/topology/nodes/node/get/
#>
function Invoke-GetNodeTopology {
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'None',
        HelpURI = "https://developer.vmware.com/docs/vsphere-automation/latest/vcenter/api/vcenter/topology/nodes/node/get/"
    )]
    Param (
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateScript({ $_ -is [string] })]
        ${Node},
        [Parameter()]
        [vSphereConnectionToServerConfigurationArgumentTransformationAttribute()]
        [PSTypeName('vSphereServerConfiguration')]
        $Server,
        [Switch]
        $WithHttpInfo
    )

    Process {
        'Calling method: Invoke-GetNodeTopology' | Write-Debug

        $ServerConfigurations = Get-vSphereServerConfiguration
        if ($PSBoundParameters.ContainsKey('Server')) {
            $ServerConfigurations = $Server
        }

        if ($null -eq $ServerConfigurations) {
            throw "You are not currently connected to any servers. Please connect first using a Connect-VIServer cmdlet or add vSphere Server Configuration with New-vSphereServerConfiguration."
        }

        $LocalVarAccepts = @()
        $LocalVarContentTypes = @()
        $LocalVarQueryParameters = @{}
        $LocalVarHeaderParameters = @{}
        $LocalVarFormParameters = @{}
        $LocalVarPathParameters = @{}
        $LocalVarCookieParameters = @{}
        $LocalVarBodyParameter = $null

        $ServerFromInputParameters = $null
        $InputParametersFromServer = $PSBoundParameters.Values | Where-Object -FilterScript { $_.PSObject.TypeNames -Contains 'ServerObject' }

        foreach ($InputParameterFromServer in $InputParametersFromServer) {
            $InputParameterServer = $InputParameterFromServer.GetServer()
            if (
                !$PSBoundParameters.ContainsKey('Server') -and
                $null -ne $ServerFromInputParameters -and
                !$ServerFromInputParameters.Equals($InputParameterServer)
            ) {
                $ErrorMessage = "{0} and {1} come from different servers. {0} from {2} and {1} from {3}. Please specify the -Server parameter of the cmdlet."
                throw ($ErrorMessage -f $ServerFromInputParameters.InputParameter, $InputParameterFromServer, $ServerFromInputParameters.Server, $InputParameterServer)
            }

            if ($null -eq $ServerFromInputParameters) {
                $ServerFromInputParameters = [PSCustomObject] @{
                    InputParameter = $InputParameterFromServer
                    Server = $InputParameterServer
                }
            }
        }

        if (
            $null -ne $ServerFromInputParameters -and
            $PSBoundParameters.ContainsKey('Server') -and
            !$ServerFromInputParameters.Server.Equals($Server)
        ) {
            $ErrorMessage = "{0} comes from server {1} but server {2} is explicitly specified."
            throw ($ErrorMessage -f $ServerFromInputParameters.InputParameter, $ServerFromInputParameters.Server, $Server)
        }

        # HTTP header 'Accept' (if needed)
        $LocalVarAccepts = @('application/json')


        $serversToProcess = $ServerConfigurations

        if (!$PSBoundParameters.ContainsKey('Server') -and $null -ne $ServerFromInputParameters) {
            $serversToProcess = $ServerFromInputParameters.Server
        }

        foreach ($serverConfiguration in $serversToProcess) {
            $shouldProcessActionMessage = "Performing the operation 'GetNodeTopology' on target server '$($serverConfiguration.ToString())'."
            $shouldProcessActionCaption = 'Are you sure you want to perform this action?'

            if ($PSCmdlet.ShouldProcess(
                    $shouldProcessActionMessage,
                    $shouldProcessActionMessage,
                    $shouldProcessActionCaption
                )
            ) {
                $LocalVarUri = '/api/vcenter/topology/nodes/{node}'
                $LocalVarMethod = 'GET'

                $useDeprecatedApis = ($null -ne $serverConfiguration.UseDeprecatedApis -and $serverConfiguration.UseDeprecatedApis)
                $translationSchema = $null
                $transformedOpertaionInput = New-InputTransformationStructure
                if ($useDeprecatedApis) {
                    # Use Deprecated APIs
                    $translationSchema = Get-OperationTranslationSchema `
                        -operationPath $LocalVarUri.Replace('__', '?') `
                        -operationVerb $LocalVarMethod
                    if ($null -ne $translationSchema) {
                        $LocalVarUri = $translationSchema.OldPath
                        $LocalVarMethod = $translationSchema.OldVerb
                    }
                }

                if (!$Node) {
                    throw "Error! The required parameter `Node` missing when calling getNodeTopology."
                }
                $LocalVarUri = $LocalVarUri.replace('{node}', $Node)
                $LocalVarPathParameters['node'] = $Node
                if ($useDeprecatedApis -and ($null -ne $translationSchema)) {
                    $addTransformationInput = Format-PathParams -OperationTranslateSchema $translationSchema -PathParams $LocalVarPathParameters
                    Join-InputTransformationStructure -Base ([ref]$transformedOpertaionInput) -Addition $addTransformationInput
                }
                if ($useDeprecatedApis -and ($null -ne $translationSchema)) {
                    $addTransformationInput = Format-Headers -OperationTranslateSchema $translationSchema -Headers $LocalVarHeaderParameters
                    Join-InputTransformationStructure -Base ([ref]$transformedOpertaionInput) -Addition $addTransformationInput
                }
                if (
                    $useDeprecatedApis -and
                    ($null -ne $translationSchema) -and
                    ($LocalVarQueryParameters.Count -gt 0)
                ) {
                    $inputQuerySctructure = [PSCustomObject]$LocalVarQueryParameters
                    $translatedBody = Convert-InputStructure -OperationTranslateSchema $translationSchema -OperationInputObject $inputQuerySctructure -InputType Body
                    $translatedQuery = Convert-InputStructure -OperationTranslateSchema $translationSchema -OperationInputObject $inputQuerySctructure -InputType Query

                    if ($null -ne $translatedBody) {
                        $LocalVarBodyParameter = $translatedBody | ConvertTo-Json -Depth 100

                        if ($LocalVarContentTypes.Count -eq 0) {
                            $LocalVarContentTypes = @('application/json')
                        }
                    }
                    $LocalVarQueryParameters = @{}
                    $translatedQuery.PSObject.Properties | Foreach-Object { $LocalVarQueryParameters[$_.Name] = $_.Value }
                }

                if ($useDeprecatedApis -and ($null -ne $translationSchema)) {
                    if ($null -ne $transformedOpertaionInput.Path) {
                        foreach ($keyValue in $transformedOpertaionInput.Path.GetEnumerator()) {
                            $LocalVarUri = $LocalVarUri.replace("{$($keyValue.Key)}", $keyValue.Value)
                        }
                    }

                    if ($null -ne $transformedOpertaionInput.Query) {
                        foreach ($keyValue in $transformedOpertaionInput.Query.GetEnumerator()) {
                            $LocalVarQueryParameters[$($keyValue.Key)] = $keyValue.Value
                        }
                    }

                    if ($null -ne $transformedOpertaionInput.Header) {
                        foreach ($keyValue in $transformedOpertaionInput.Header.GetEnumerator()) {
                            $LocalVarHeaderParameters[$($keyValue.Key)] = $keyValue.Value
                        }
                    }

                    if ($null -ne $transformedOpertaionInput.Body) {
                         $LocalVarBodyParameter = $transformedOpertaionInput.Body | ConvertTo-Json -Depth 100
                    }
                }

                $invokeParams = @{
                    'Method' = $LocalVarMethod
                    'Uri' = $LocalVarUri
                    'Accepts' = $LocalVarAccepts
                    'ContentTypes' = $LocalVarContentTypes
                    'Body' = $LocalVarBodyParameter
                    'HeaderParameters' = $LocalVarHeaderParameters
                    'QueryParameters' = $LocalVarQueryParameters
                    'FormParameters' = $LocalVarFormParameters
                    'CookieParameters' = $LocalVarCookieParameters
                    'ReturnType' = "TopologyNodesInfo"
                    'IsBodyNullable' = $false
                    'Server' = $serverConfiguration
                }

                if ($PSBoundParameters.ContainsKey('Debug')) {
                    $invokeParams['Debug'] = $Debug
                }

                if ($PSBoundParameters.ContainsKey('Verbose')) {
                    $invokeParams['Verbose'] = $Verbose
                }

                if ($PSBoundParameters.ContainsKey('WarningAction')) {
                    $invokeParams['WarningAction'] = $PSBoundParameters.WarningAction
                }

                if ($PSBoundParameters.ContainsKey('ErrorAction')) {
                    $invokeParams['ErrorAction'] = $PSBoundParameters.ErrorAction
                }

                $invokeParams['InvocationInfo'] = @{
                    'ModuleName' = $MyInvocation.MyCommand.ModuleName
                    'CmdletName' = $MyInvocation.MyCommand.Name
                }

                $invokeResult = Invoke-vSphereApiClient @invokeParams

                $invokeResult | Foreach-Object {
                    $SingleServerResult = $_
                    if ($SingleServerResult -is [hashtable]) {

                        if ($useDeprecatedApis -and ($null -ne $translationSchema) -and ($null -ne $SingleServerResult["Response"])) {
                            $ServerName = $SingleServerResult["Response"].PSObject.TypeNames | Where-Object -FilterScript { $_.StartsWith('Server:') }

                            $SingleServerResult["Response"] = Convert-OutputBody `
                                -OperationTranslateSchema $translationSchema `
                                -OperationOutputObject $SingleServerResult["Response"]

                            if (![string]::IsNullOrEmpty($ServerName)) {
                                $SingleServerResult["Response"] | ForEach-Object -Process {
                                    $_.PSObject.TypeNames.Add($ServerName)

                                    $_ = $_ | Add-Member -MemberType ScriptMethod -Name GetServer -Value {
                                        $productServerString = ($this.PSObject.TypeNames | Where-Object -FilterScript { $_.StartsWith('Server:') }).Substring(7)
                                        $productSeparatorIndex = $productServerString.IndexOf(':')

                                        $product = $productServerString.Substring(0, $productSeparatorIndex)
                                        $server = $productServerString.Substring($productSeparatorIndex + 1, $productServerString.Length - $productSeparatorIndex - 1)

                                        Get-ServerConfiguration -Product $product | Where-Object -FilterScript { $_.ToString() -eq $server }
                                    } -Force -PassThru

                                    $_.PSObject.TypeNames.Add("ServerObject")
                                }
                            }
                        }

                        $SingleServerResult["Response"].PSObject.TypeNames.Insert(0, "TopologyNodesInfo")

                        if ($WithHttpInfo.IsPresent) {
                            # result object
                            $SingleServerResult
                        } else {
                            # result object
                            $SingleServerResult["Response"]
                        }

                    } else {
                        Write-Warning "An item from the Invoke-vSphereApiClient was expected to be a Hashtable but it is '$($SingleServerResult.GetType())'"
                    }
                }
            }
        }
    }
}

<#
.SYNOPSIS

Returns information about all vCenter and Platform Services Controller nodes matching the Nodes.FilterSpec. if you do not have all of the privileges described as follows:     -  Operation execution requires System.Read.  

.DESCRIPTION

No description available.

.PARAMETER Types
Types of the appliance that a vCenter and Platform Services Controller node must be to match the filter (see Nodes.ApplianceType. If unset or empty, node of any ApplianceType match the filter.

.PARAMETER WithHttpInfo

A switch when turned on will return a hash table of Response, StatusCode and Headers instead of just the Response

.OUTPUTS

TopologyNodesSummary[]

.LINK

Online Version: https://developer.vmware.com/docs/vsphere-automation/latest/vcenter/api/vcenter/topology/nodes/get/
#>
function Invoke-ListTopologyNodes {
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'None',
        HelpURI = "https://developer.vmware.com/docs/vsphere-automation/latest/vcenter/api/vcenter/topology/nodes/get/"
    )]
    Param (
        [Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [PSCustomObject[]]
        ${Types},
        [Parameter()]
        [vSphereConnectionToServerConfigurationArgumentTransformationAttribute()]
        [PSTypeName('vSphereServerConfiguration')]
        $Server,
        [Switch]
        $WithHttpInfo
    )

    Process {
        'Calling method: Invoke-ListTopologyNodes' | Write-Debug

        $ServerConfigurations = Get-vSphereServerConfiguration
        if ($PSBoundParameters.ContainsKey('Server')) {
            $ServerConfigurations = $Server
        }

        if ($null -eq $ServerConfigurations) {
            throw "You are not currently connected to any servers. Please connect first using a Connect-VIServer cmdlet or add vSphere Server Configuration with New-vSphereServerConfiguration."
        }

        $LocalVarAccepts = @()
        $LocalVarContentTypes = @()
        $LocalVarQueryParameters = @{}
        $LocalVarHeaderParameters = @{}
        $LocalVarFormParameters = @{}
        $LocalVarPathParameters = @{}
        $LocalVarCookieParameters = @{}
        $LocalVarBodyParameter = $null

        $ServerFromInputParameters = $null
        $InputParametersFromServer = $PSBoundParameters.Values | Where-Object -FilterScript { $_.PSObject.TypeNames -Contains 'ServerObject' }

        foreach ($InputParameterFromServer in $InputParametersFromServer) {
            $InputParameterServer = $InputParameterFromServer.GetServer()
            if (
                !$PSBoundParameters.ContainsKey('Server') -and
                $null -ne $ServerFromInputParameters -and
                !$ServerFromInputParameters.Equals($InputParameterServer)
            ) {
                $ErrorMessage = "{0} and {1} come from different servers. {0} from {2} and {1} from {3}. Please specify the -Server parameter of the cmdlet."
                throw ($ErrorMessage -f $ServerFromInputParameters.InputParameter, $InputParameterFromServer, $ServerFromInputParameters.Server, $InputParameterServer)
            }

            if ($null -eq $ServerFromInputParameters) {
                $ServerFromInputParameters = [PSCustomObject] @{
                    InputParameter = $InputParameterFromServer
                    Server = $InputParameterServer
                }
            }
        }

        if (
            $null -ne $ServerFromInputParameters -and
            $PSBoundParameters.ContainsKey('Server') -and
            !$ServerFromInputParameters.Server.Equals($Server)
        ) {
            $ErrorMessage = "{0} comes from server {1} but server {2} is explicitly specified."
            throw ($ErrorMessage -f $ServerFromInputParameters.InputParameter, $ServerFromInputParameters.Server, $Server)
        }

        # HTTP header 'Accept' (if needed)
        $LocalVarAccepts = @('application/json')


        $serversToProcess = $ServerConfigurations

        if (!$PSBoundParameters.ContainsKey('Server') -and $null -ne $ServerFromInputParameters) {
            $serversToProcess = $ServerFromInputParameters.Server
        }

        foreach ($serverConfiguration in $serversToProcess) {
            $shouldProcessActionMessage = "Performing the operation 'ListTopologyNodes' on target server '$($serverConfiguration.ToString())'."
            $shouldProcessActionCaption = 'Are you sure you want to perform this action?'

            if ($PSCmdlet.ShouldProcess(
                    $shouldProcessActionMessage,
                    $shouldProcessActionMessage,
                    $shouldProcessActionCaption
                )
            ) {
                $LocalVarUri = '/api/vcenter/topology/nodes'
                $LocalVarMethod = 'GET'

                $useDeprecatedApis = ($null -ne $serverConfiguration.UseDeprecatedApis -and $serverConfiguration.UseDeprecatedApis)
                $translationSchema = $null
                $transformedOpertaionInput = New-InputTransformationStructure
                if ($useDeprecatedApis) {
                    # Use Deprecated APIs
                    $translationSchema = Get-OperationTranslationSchema `
                        -operationPath $LocalVarUri.Replace('__', '?') `
                        -operationVerb $LocalVarMethod
                    if ($null -ne $translationSchema) {
                        $LocalVarUri = $translationSchema.OldPath
                        $LocalVarMethod = $translationSchema.OldVerb
                    }
                }

                if ($useDeprecatedApis -and ($null -ne $translationSchema)) {
                    $addTransformationInput = Format-PathParams -OperationTranslateSchema $translationSchema -PathParams $LocalVarPathParameters
                    Join-InputTransformationStructure -Base ([ref]$transformedOpertaionInput) -Addition $addTransformationInput
                }
                if ($useDeprecatedApis -and ($null -ne $translationSchema)) {
                    $addTransformationInput = Format-Headers -OperationTranslateSchema $translationSchema -Headers $LocalVarHeaderParameters
                    Join-InputTransformationStructure -Base ([ref]$transformedOpertaionInput) -Addition $addTransformationInput
                }
                if ($null -ne $Types) {
                    $LocalVarQueryParameters['types'] = $Types
                }

                if (
                    $useDeprecatedApis -and
                    ($null -ne $translationSchema) -and
                    ($LocalVarQueryParameters.Count -gt 0)
                ) {
                    $inputQuerySctructure = [PSCustomObject]$LocalVarQueryParameters
                    $translatedBody = Convert-InputStructure -OperationTranslateSchema $translationSchema -OperationInputObject $inputQuerySctructure -InputType Body
                    $translatedQuery = Convert-InputStructure -OperationTranslateSchema $translationSchema -OperationInputObject $inputQuerySctructure -InputType Query

                    if ($null -ne $translatedBody) {
                        $LocalVarBodyParameter = $translatedBody | ConvertTo-Json -Depth 100

                        if ($LocalVarContentTypes.Count -eq 0) {
                            $LocalVarContentTypes = @('application/json')
                        }
                    }
                    $LocalVarQueryParameters = @{}
                    $translatedQuery.PSObject.Properties | Foreach-Object { $LocalVarQueryParameters[$_.Name] = $_.Value }
                }

                if ($useDeprecatedApis -and ($null -ne $translationSchema)) {
                    if ($null -ne $transformedOpertaionInput.Path) {
                        foreach ($keyValue in $transformedOpertaionInput.Path.GetEnumerator()) {
                            $LocalVarUri = $LocalVarUri.replace("{$($keyValue.Key)}", $keyValue.Value)
                        }
                    }

                    if ($null -ne $transformedOpertaionInput.Query) {
                        foreach ($keyValue in $transformedOpertaionInput.Query.GetEnumerator()) {
                            $LocalVarQueryParameters[$($keyValue.Key)] = $keyValue.Value
                        }
                    }

                    if ($null -ne $transformedOpertaionInput.Header) {
                        foreach ($keyValue in $transformedOpertaionInput.Header.GetEnumerator()) {
                            $LocalVarHeaderParameters[$($keyValue.Key)] = $keyValue.Value
                        }
                    }

                    if ($null -ne $transformedOpertaionInput.Body) {
                         $LocalVarBodyParameter = $transformedOpertaionInput.Body | ConvertTo-Json -Depth 100
                    }
                }

                $invokeParams = @{
                    'Method' = $LocalVarMethod
                    'Uri' = $LocalVarUri
                    'Accepts' = $LocalVarAccepts
                    'ContentTypes' = $LocalVarContentTypes
                    'Body' = $LocalVarBodyParameter
                    'HeaderParameters' = $LocalVarHeaderParameters
                    'QueryParameters' = $LocalVarQueryParameters
                    'FormParameters' = $LocalVarFormParameters
                    'CookieParameters' = $LocalVarCookieParameters
                    'ReturnType' = "TopologyNodesSummary[]"
                    'IsBodyNullable' = $false
                    'Server' = $serverConfiguration
                }

                if ($PSBoundParameters.ContainsKey('Debug')) {
                    $invokeParams['Debug'] = $Debug
                }

                if ($PSBoundParameters.ContainsKey('Verbose')) {
                    $invokeParams['Verbose'] = $Verbose
                }

                if ($PSBoundParameters.ContainsKey('WarningAction')) {
                    $invokeParams['WarningAction'] = $PSBoundParameters.WarningAction
                }

                if ($PSBoundParameters.ContainsKey('ErrorAction')) {
                    $invokeParams['ErrorAction'] = $PSBoundParameters.ErrorAction
                }

                $invokeParams['InvocationInfo'] = @{
                    'ModuleName' = $MyInvocation.MyCommand.ModuleName
                    'CmdletName' = $MyInvocation.MyCommand.Name
                }

                $invokeResult = Invoke-vSphereApiClient @invokeParams

                $invokeResult | Foreach-Object {
                    $SingleServerResult = $_
                    if ($SingleServerResult -is [hashtable]) {

                        if ($useDeprecatedApis -and ($null -ne $translationSchema) -and ($null -ne $SingleServerResult["Response"])) {
                            $ServerName = $SingleServerResult["Response"].PSObject.TypeNames | Where-Object -FilterScript { $_.StartsWith('Server:') }

                            $SingleServerResult["Response"] = Convert-OutputBody `
                                -OperationTranslateSchema $translationSchema `
                                -OperationOutputObject $SingleServerResult["Response"]

                            if (![string]::IsNullOrEmpty($ServerName)) {
                                $SingleServerResult["Response"] | ForEach-Object -Process {
                                    $_.PSObject.TypeNames.Add($ServerName)

                                    $_ = $_ | Add-Member -MemberType ScriptMethod -Name GetServer -Value {
                                        $productServerString = ($this.PSObject.TypeNames | Where-Object -FilterScript { $_.StartsWith('Server:') }).Substring(7)
                                        $productSeparatorIndex = $productServerString.IndexOf(':')

                                        $product = $productServerString.Substring(0, $productSeparatorIndex)
                                        $server = $productServerString.Substring($productSeparatorIndex + 1, $productServerString.Length - $productSeparatorIndex - 1)

                                        Get-ServerConfiguration -Product $product | Where-Object -FilterScript { $_.ToString() -eq $server }
                                    } -Force -PassThru

                                    $_.PSObject.TypeNames.Add("ServerObject")
                                }
                            }
                        }

                        foreach ($element in $SingleServerResult["Response"]) {
                            $element.PSObject.TypeNames.Insert(0, "TopologyNodesSummary")
                        }

                        if ($WithHttpInfo.IsPresent) {
                            # result object
                            $SingleServerResult
                        } else {
                            # result object
                            $SingleServerResult["Response"]
                        }

                    } else {
                        Write-Warning "An item from the Invoke-vSphereApiClient was expected to be a Hashtable but it is '$($SingleServerResult.GetType())'"
                    }
                }
            }
        }
    }
}


# SIG # Begin signature block
# MIIexgYJKoZIhvcNAQcCoIIetzCCHrMCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCD9lzMAPA1xdku4
# Nw+ceVhPik9fVq5Kq7CwGfRAwLTbdqCCDdowggawMIIEmKADAgECAhAIrUCyYNKc
# TJ9ezam9k67ZMA0GCSqGSIb3DQEBDAUAMGIxCzAJBgNVBAYTAlVTMRUwEwYDVQQK
# EwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAfBgNV
# BAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDAeFw0yMTA0MjkwMDAwMDBaFw0z
# NjA0MjgyMzU5NTlaMGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwg
# SW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcg
# UlNBNDA5NiBTSEEzODQgMjAyMSBDQTEwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw
# ggIKAoICAQDVtC9C0CiteLdd1TlZG7GIQvUzjOs9gZdwxbvEhSYwn6SOaNhc9es0
# JAfhS0/TeEP0F9ce2vnS1WcaUk8OoVf8iJnBkcyBAz5NcCRks43iCH00fUyAVxJr
# Q5qZ8sU7H/Lvy0daE6ZMswEgJfMQ04uy+wjwiuCdCcBlp/qYgEk1hz1RGeiQIXhF
# LqGfLOEYwhrMxe6TSXBCMo/7xuoc82VokaJNTIIRSFJo3hC9FFdd6BgTZcV/sk+F
# LEikVoQ11vkunKoAFdE3/hoGlMJ8yOobMubKwvSnowMOdKWvObarYBLj6Na59zHh
# 3K3kGKDYwSNHR7OhD26jq22YBoMbt2pnLdK9RBqSEIGPsDsJ18ebMlrC/2pgVItJ
# wZPt4bRc4G/rJvmM1bL5OBDm6s6R9b7T+2+TYTRcvJNFKIM2KmYoX7BzzosmJQay
# g9Rc9hUZTO1i4F4z8ujo7AqnsAMrkbI2eb73rQgedaZlzLvjSFDzd5Ea/ttQokbI
# YViY9XwCFjyDKK05huzUtw1T0PhH5nUwjewwk3YUpltLXXRhTT8SkXbev1jLchAp
# QfDVxW0mdmgRQRNYmtwmKwH0iU1Z23jPgUo+QEdfyYFQc4UQIyFZYIpkVMHMIRro
# OBl8ZhzNeDhFMJlP/2NPTLuqDQhTQXxYPUez+rbsjDIJAsxsPAxWEQIDAQABo4IB
# WTCCAVUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUaDfg67Y7+F8Rhvv+
# YXsIiGX0TkIwHwYDVR0jBBgwFoAU7NfjgtJxXWRM3y5nP+e6mK4cD08wDgYDVR0P
# AQH/BAQDAgGGMBMGA1UdJQQMMAoGCCsGAQUFBwMDMHcGCCsGAQUFBwEBBGswaTAk
# BggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEEGCCsGAQUFBzAC
# hjVodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkUm9v
# dEc0LmNydDBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsMy5kaWdpY2VydC5j
# b20vRGlnaUNlcnRUcnVzdGVkUm9vdEc0LmNybDAcBgNVHSAEFTATMAcGBWeBDAED
# MAgGBmeBDAEEATANBgkqhkiG9w0BAQwFAAOCAgEAOiNEPY0Idu6PvDqZ01bgAhql
# +Eg08yy25nRm95RysQDKr2wwJxMSnpBEn0v9nqN8JtU3vDpdSG2V1T9J9Ce7FoFF
# UP2cvbaF4HZ+N3HLIvdaqpDP9ZNq4+sg0dVQeYiaiorBtr2hSBh+3NiAGhEZGM1h
# mYFW9snjdufE5BtfQ/g+lP92OT2e1JnPSt0o618moZVYSNUa/tcnP/2Q0XaG3Ryw
# YFzzDaju4ImhvTnhOE7abrs2nfvlIVNaw8rpavGiPttDuDPITzgUkpn13c5Ubdld
# AhQfQDN8A+KVssIhdXNSy0bYxDQcoqVLjc1vdjcshT8azibpGL6QB7BDf5WIIIJw
# 8MzK7/0pNVwfiThV9zeKiwmhywvpMRr/LhlcOXHhvpynCgbWJme3kuZOX956rEnP
# LqR0kq3bPKSchh/jwVYbKyP/j7XqiHtwa+aguv06P0WmxOgWkVKLQcBIhEuWTatE
# QOON8BUozu3xGFYHKi8QxAwIZDwzj64ojDzLj4gLDb879M4ee47vtevLt/B3E+bn
# KD+sEq6lLyJsQfmCXBVmzGwOysWGw/YmMwwHS6DTBwJqakAwSEs0qFEgu60bhQji
# WQ1tygVQK+pKHJ6l/aCnHwZ05/LWUpD9r4VIIflXO7ScA+2GRfS0YW6/aOImYIbq
# yK+p/pQd52MbOoZWeE4wggciMIIFCqADAgECAhAOxvKydqFGoH0ObZNXteEIMA0G
# CSqGSIb3DQEBCwUAMGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwg
# SW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcg
# UlNBNDA5NiBTSEEzODQgMjAyMSBDQTEwHhcNMjEwODEwMDAwMDAwWhcNMjMwODEw
# MjM1OTU5WjCBhzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExEjAQ
# BgNVBAcTCVBhbG8gQWx0bzEVMBMGA1UEChMMVk13YXJlLCBJbmMuMRUwEwYDVQQD
# EwxWTXdhcmUsIEluYy4xITAfBgkqhkiG9w0BCQEWEm5vcmVwbHlAdm13YXJlLmNv
# bTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAMD6lJG8OWkM12huIQpO
# /q9JnhhhW5UyW9if3/UnoFY3oqmp0JYX/ZrXogUHYXmbt2gk01zz2P5Z89mM4gqR
# bGYC2tx+Lez4GxVkyslVPI3PXYcYSaRp39JsF3yYifnp9R+ON8O3Gf5/4EaFmbeT
# ElDCFBfExPMqtSvPZDqekodzX+4SK1PIZxCyR3gml8R3/wzhb6Li0mG7l0evQUD0
# FQAbKJMlBk863apeX4ALFZtrnCpnMlOjRb85LsjV5Ku4OhxQi1jlf8wR+za9C3DU
# ki60/yiWPu+XXwEUqGInIihECBbp7hfFWrnCCaOgahsVpgz8kKg/XN4OFq7rbh4q
# 5IkTauqFhHaE7HKM5bbIBkZ+YJs2SYvu7aHjw4Z8aRjaIbXhI1G+NtaNY7kSRrE4
# fAyC2X2zV5i4a0AuAMM40C1Wm3gTaNtRTHnka/pbynUlFjP+KqAZhOniJg4AUfjX
# sG+PG1LH2+w/sfDl1A8liXSZU1qJtUs3wBQFoSGEaGBeDQIDAQABo4ICJTCCAiEw
# HwYDVR0jBBgwFoAUaDfg67Y7+F8Rhvv+YXsIiGX0TkIwHQYDVR0OBBYEFIhC+HL9
# QlvsWsztP/I5wYwdfCFNMB0GA1UdEQQWMBSBEm5vcmVwbHlAdm13YXJlLmNvbTAO
# BgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwgbUGA1UdHwSBrTCB
# qjBToFGgT4ZNaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3Rl
# ZEc0Q29kZVNpZ25pbmdSU0E0MDk2U0hBMzg0MjAyMUNBMS5jcmwwU6BRoE+GTWh0
# dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNENvZGVTaWdu
# aW5nUlNBNDA5NlNIQTM4NDIwMjFDQTEuY3JsMD4GA1UdIAQ3MDUwMwYGZ4EMAQQB
# MCkwJwYIKwYBBQUHAgEWG2h0dHA6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzCBlAYI
# KwYBBQUHAQEEgYcwgYQwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0
# LmNvbTBcBggrBgEFBQcwAoZQaHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL0Rp
# Z2lDZXJ0VHJ1c3RlZEc0Q29kZVNpZ25pbmdSU0E0MDk2U0hBMzg0MjAyMUNBMS5j
# cnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEACQAYaQI6Nt2KgxdN
# 6qqfcHB33EZRSXkvs8O9iPZkdDjEx+2fgbBPLUvk9A7T8mRw7brbcJv4PLTYJDFo
# c5mlcmG7/5zwTOuIs2nBGXc/uxCnyW8p7kD4Y0JxPKEVQoIQ8lJS9Uy/hBjyakeV
# ef982JyzvDbOlLBy6AS3ZpXVkRY5y3Va+3v0R/0xJ+JRxUicQhiZRidq2TCiWEas
# d+tLL6jrKaBO+rmP52IM4eS9d4Yids7ogKEBAlJi0NbvuKO0CkgOlFjp1tOvD4sQ
# taHIMmqi40p4Tjyf/sY6yGjROXbMeeF1vlwbBAASPWpQuEIxrNHoVN30YfJyuOWj
# zdiJUTpeLn9XdjM3UlhfaHP+oIAKcmkd33c40SFRlQG9+P9Wlm7TcPxGU4wzXI8n
# Cw/h235jFlAAiWq9L2r7Un7YduqsheJVpGoXmRXJH0T2G2eNFS5/+2sLn98kN2Cn
# J7j6C242onjkZuGL2/+gqx8m5Jbpu9P4IAeTC1He/mX9j6XpIu+7uBoRVwuWD1i0
# N5SiUz7Lfnbr6Q1tHMXKDLFdwVKZos2AKEZhv4SU0WvenMJKDgkkhVeHPHbTahQf
# P1MetR8tdRs7uyTWAjPK5xf5DLEkXbMrUkpJ089fPvAGVHBcHRMqFA5egexOb6sj
# tKncUjJ1xAAtAExGdCh6VD2U5iYxghBCMIIQPgIBATB9MGkxCzAJBgNVBAYTAlVT
# MRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1
# c3RlZCBHNCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEzODQgMjAyMSBDQTECEA7G
# 8rJ2oUagfQ5tk1e14QgwDQYJYIZIAWUDBAIBBQCggZYwGQYJKoZIhvcNAQkDMQwG
# CisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwKgYKKwYB
# BAGCNwIBDDEcMBqhGIAWaHR0cDovL3d3dy52bXdhcmUuY29tLzAvBgkqhkiG9w0B
# CQQxIgQggzkBfiTyeOe53a7MjM37rqbi5pwi9QCG4WoAyZL06I4wDQYJKoZIhvcN
# AQEBBQAEggGAYnbSF0J/ntaMoMHybvRhgZe3jI3tdAtfqb3ezeBvXq/uCMSMUBDX
# fD1aZwZ6+qWG3g83epdDxOnCc/8zBYmlSzKGnZ0AdDHmbziJ1riRLC63lozNN+Ut
# toC5Svr/saIydQT7vrgC5rA/m3EY2OwJUsi+svV9e0fcd3GqnP+P/HRrJSdDd5uu
# Ae4QB3cA4oBYKPWoe2wQwcDV3UwYIoVjGN7DiFD9ptX88YuDlUWXB1FC6CR+wb7k
# AvDMhTpmjcaacizLOwbhjP33sxJie+I206v6IVndbpx+3sa66hqsyHPt6emNyFT2
# iQgUhA8srAu1TVFseWZRzROcz6qzG+OYkTZoazXryuQnBfbjj8t8PMoFMcI5QClT
# LcSHDDW63K8rBhpVhIaouZ/EKKzfdazmAw5uSdlg1RRSacRJxJx+kJ0+fSinUYkl
# NQVDboT5hxrpeqV/GYqtDQr5BdLSiJwXkbhcEP3N+IUslsT8lqnEs/gHRnIoS+I2
# 7+paR11DR+ukoYINfTCCDXkGCisGAQQBgjcDAwExgg1pMIINZQYJKoZIhvcNAQcC
# oIINVjCCDVICAQMxDzANBglghkgBZQMEAgEFADB3BgsqhkiG9w0BCRABBKBoBGYw
# ZAIBAQYJYIZIAYb9bAcBMDEwDQYJYIZIAWUDBAIBBQAEIB5+pa0MlIw9xPffI729
# PL8fahAeQ57epcwkNceYRat4AhBuYQN80THaipr56mYaJUjhGA8yMDIxMDkyNDE2
# MDg0MVqgggo3MIIE/jCCA+agAwIBAgIQDUJK4L46iP9gQCHOFADw3TANBgkqhkiG
# 9w0BAQsFADByMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkw
# FwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMTEwLwYDVQQDEyhEaWdpQ2VydCBTSEEy
# IEFzc3VyZWQgSUQgVGltZXN0YW1waW5nIENBMB4XDTIxMDEwMTAwMDAwMFoXDTMx
# MDEwNjAwMDAwMFowSDELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJ
# bmMuMSAwHgYDVQQDExdEaWdpQ2VydCBUaW1lc3RhbXAgMjAyMTCCASIwDQYJKoZI
# hvcNAQEBBQADggEPADCCAQoCggEBAMLmYYRnxYr1DQikRcpja1HXOhFCvQp1dU2U
# tAxQtSYQ/h3Ib5FrDJbnGlxI70Tlv5thzRWRYlq4/2cLnGP9NmqB+in43Stwhd4C
# GPN4bbx9+cdtCT2+anaH6Yq9+IRdHnbJ5MZ2djpT0dHTWjaPxqPhLxs6t2HWc+xO
# bTOKfF1FLUuxUOZBOjdWhtyTI433UCXoZObd048vV7WHIOsOjizVI9r0TXhG4wOD
# MSlKXAwxikqMiMX3MFr5FK8VX2xDSQn9JiNT9o1j6BqrW7EdMMKbaYK02/xWVLwf
# oYervnpbCiAvSwnJlaeNsvrWY4tOpXIc7p96AXP4Gdb+DUmEvQECAwEAAaOCAbgw
# ggG0MA4GA1UdDwEB/wQEAwIHgDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoG
# CCsGAQUFBwMIMEEGA1UdIAQ6MDgwNgYJYIZIAYb9bAcBMCkwJwYIKwYBBQUHAgEW
# G2h0dHA6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzAfBgNVHSMEGDAWgBT0tuEgHf4p
# rtLkYaWyoiWyyBc1bjAdBgNVHQ4EFgQUNkSGjqS6sGa+vCgtHUQ23eNqerwwcQYD
# VR0fBGowaDAyoDCgLoYsaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL3NoYTItYXNz
# dXJlZC10cy5jcmwwMqAwoC6GLGh0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9zaGEy
# LWFzc3VyZWQtdHMuY3JsMIGFBggrBgEFBQcBAQR5MHcwJAYIKwYBBQUHMAGGGGh0
# dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBPBggrBgEFBQcwAoZDaHR0cDovL2NhY2Vy
# dHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0U0hBMkFzc3VyZWRJRFRpbWVzdGFtcGlu
# Z0NBLmNydDANBgkqhkiG9w0BAQsFAAOCAQEASBzctemaI7znGucgDo5nRv1CclF0
# CiNHo6uS0iXEcFm+FKDlJ4GlTRQVGQd58NEEw4bZO73+RAJmTe1ppA/2uHDPYuj1
# UUp4eTZ6J7fz51Kfk6ftQ55757TdQSKJ+4eiRgNO/PT+t2R3Y18jUmmDgvoaU+2Q
# zI2hF3MN9PNlOXBL85zWenvaDLw9MtAby/Vh/HUIAHa8gQ74wOFcz8QRcucbZEnY
# Ipp1FUL1LTI4gdr0YKK6tFL7XOBhJCVPst/JKahzQ1HavWPWH1ub9y4bTxMd90oN
# cX6Xt/Q/hOvB46NJofrOp79Wz7pZdmGJX36ntI5nePk2mOHLKNpbh6aKLzCCBTEw
# ggQZoAMCAQICEAqhJdbWMht+QeQF2jaXwhUwDQYJKoZIhvcNAQELBQAwZTELMAkG
# A1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRp
# Z2ljZXJ0LmNvbTEkMCIGA1UEAxMbRGlnaUNlcnQgQXNzdXJlZCBJRCBSb290IENB
# MB4XDTE2MDEwNzEyMDAwMFoXDTMxMDEwNzEyMDAwMFowcjELMAkGA1UEBhMCVVMx
# FTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNv
# bTExMC8GA1UEAxMoRGlnaUNlcnQgU0hBMiBBc3N1cmVkIElEIFRpbWVzdGFtcGlu
# ZyBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL3QMu5LzY9/3am6
# gpnFOVQoV7YjSsQOB0UzURB90Pl9TWh+57ag9I2ziOSXv2MhkJi/E7xX08PhfgjW
# ahQAOPcuHjvuzKb2Mln+X2U/4Jvr40ZHBhpVfgsnfsCi9aDg3iI/Dv9+lfvzo7oi
# PhisEeTwmQNtO4V8CdPuXciaC1TjqAlxa+DPIhAPdc9xck4Krd9AOly3UeGheRTG
# TSQjMF287DxgaqwvB8z98OpH2YhQXv1mblZhJymJhFHmgudGUP2UKiyn5HU+upgP
# hH+fMRTWrdXyZMt7HgXQhBlyF/EXBu89zdZN7wZC/aJTKk+FHcQdPK/P2qwQ9d2s
# rOlW/5MCAwEAAaOCAc4wggHKMB0GA1UdDgQWBBT0tuEgHf4prtLkYaWyoiWyyBc1
# bjAfBgNVHSMEGDAWgBRF66Kv9JLLgjEtUYunpyGd823IDzASBgNVHRMBAf8ECDAG
# AQH/AgEAMA4GA1UdDwEB/wQEAwIBhjATBgNVHSUEDDAKBggrBgEFBQcDCDB5Bggr
# BgEFBQcBAQRtMGswJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNv
# bTBDBggrBgEFBQcwAoY3aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lD
# ZXJ0QXNzdXJlZElEUm9vdENBLmNydDCBgQYDVR0fBHoweDA6oDigNoY0aHR0cDov
# L2NybDQuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEUm9vdENBLmNybDA6
# oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElE
# Um9vdENBLmNybDBQBgNVHSAESTBHMDgGCmCGSAGG/WwAAgQwKjAoBggrBgEFBQcC
# ARYcaHR0cHM6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzALBglghkgBhv1sBwEwDQYJ
# KoZIhvcNAQELBQADggEBAHGVEulRh1Zpze/d2nyqY3qzeM8GN0CE70uEv8rPAwL9
# xafDDiBCLK938ysfDCFaKrcFNB1qrpn4J6JmvwmqYN92pDqTD/iy0dh8GWLoXoIl
# HsS6HHssIeLWWywUNUMEaLLbdQLgcseY1jxk5R9IEBhfiThhTWJGJIdjjJFSLK8p
# ieV4H9YLFKWA1xJHcLN11ZOFk362kmf7U2GJqPVrlsD0WGkNfMgBsbkodbeZY4Ui
# jGHKeZR+WfyMD+NvtQEmtmyl7odRIeRYYJu6DC0rbaLEfrvEJStHAgh8Sa4TtuF8
# QkIoxhhWz0E0tmZdtnR79VYzIi8iNrJLokqV2PWmjlIxggKGMIICggIBATCBhjBy
# MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
# d3cuZGlnaWNlcnQuY29tMTEwLwYDVQQDEyhEaWdpQ2VydCBTSEEyIEFzc3VyZWQg
# SUQgVGltZXN0YW1waW5nIENBAhANQkrgvjqI/2BAIc4UAPDdMA0GCWCGSAFlAwQC
# AQUAoIHRMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAcBgkqhkiG9w0BCQUx
# DxcNMjEwOTI0MTYwODQxWjArBgsqhkiG9w0BCRACDDEcMBowGDAWBBTh14Ko4ZG+
# 72vKFpG1qrSUpiSb8zAvBgkqhkiG9w0BCQQxIgQgHvL9Dt1JSM/L/P9PaIFMLaXV
# AF8bIYLwKAwdXa5vt64wNwYLKoZIhvcNAQkQAi8xKDAmMCQwIgQgsxCQBrwK2YMH
# kVcp4EQDQVyD4ykrYU8mlkyNNXHs9akwDQYJKoZIhvcNAQEBBQAEggEAj4Yum5+o
# TlHcNDySjX63RpLvFFobs0tMfkoB2sknYFh31uPGzvUC8m8qzN18W4kNvFz4TVeX
# SBDBUHpuJ37O+5GPUE3kFnNi+IOs14Ifuy6Et8TDw64kVjdrwsNg6fxR91xh5Xi3
# RdL6pnsB/G7LawF/LITVIbzlzU3IALXuhnGKdC5hpoUM1Kf5jEnCLwxmAI9YQNRt
# NFt1KqdFYXTI6iIKh7idfQLn+HQvLvcKwQUl081QjZ+9APhTegaLn8vdqzyexdd7
# lHz+j0qlkbtlns7k/HlklfD8bIQo0cDWMWc53h/POc3bdInMQvRIvpLVu9nv5GzZ
# Pdf+pdv/Pj4TyQ==
# SIG # End signature block
