[VMware.VimAutomation.Sdk.Interop.V1.CoreServiceFactory]::CoreService.OnImportModule(
    "VMware.VimAutomation.ViCore.Cmdlets",
    (Split-Path $script:MyInvocation.MyCommand.Path));

function global:New-DatastoreDrive([string] $Name, $Datastore){
<#
.SYNOPSIS
This function creates a new datastore drive.
.DESCRIPTION
This function creates a new drive that is mapped to a location in a datastore.
.PARAMETER Name
Specifies a name for the new drive.
.PARAMETER Datastore
Specifies the datastore for which you want to create a new drive.
#>
	begin {
		if ($Datastore) {
			Write-Output $Datastore | New-DatastoreDrive -Name $Name
		}
	}
	process {
		if ($_) {
			$ds = $_
			New-PSDrive -Name $Name -Root \ -PSProvider VimDatastore -Datastore $ds -Scope global
		}
	}
	end {
	}
}

function global:New-VIInventoryDrive([string] $Name, $Location){
<#
.SYNOPSIS
This function creates a new drive for an inventory item.
.DESCRIPTION
This function creates a new inventory drive that is mapped to a location in a datastore.
.PARAMETER Name
Specifies the name of the new inventory drive.
.PARAMETER Location
Specifies the vSphere container objects (such as folders, data centers, and clusters) for which you want to create the drive.
#>
	begin {
		if ($Location) {
			Write-Output $Location | New-VIInventoryDrive -Name $Name
		}
	}
	process {
		if ($_) {
			$location = $_
			New-PSDrive -Name $name -Root \ -PSProvider VimInventory -Location $location -Scope global
		}
	}
	end {
	}
}

function global:Get-VICommand([string] $Name = "*") {
<#
.SYNOPSIS
This function retrieves all commands of the VMware modules.
.DESCRIPTION
This function retrieves all commands of the imported VMware modules, including cmdlets, aliases, and functions.
.PARAMETER Name
Specifies the name of the command you want to retrieve.
#>
  Get-Command -Module VMware.* -Name $Name
}


function HookGetViewAutoCompleter() {	
	if ( -not (Test-Path Function:\TabExpansionDefault) ) {
		
		# This is the new definition of the TabExpansion2 function
		$tabExpansionProxyFunction = 
		'
			[CmdletBinding(DefaultParameterSetName = ''ScriptInputSet'')]
			Param(
				[Parameter(ParameterSetName = ''ScriptInputSet'', Mandatory = $true, Position = 0)]
				[string] $inputScript,

				[Parameter(ParameterSetName = ''ScriptInputSet'', Mandatory = $true, Position = 1)]
				[int] $cursorColumn,

				[Parameter(ParameterSetName = ''AstInputSet'', Mandatory = $true, Position = 0)]
				[System.Management.Automation.Language.Ast] $ast,

				[Parameter(ParameterSetName = ''AstInputSet'', Mandatory = $true, Position = 1)]
				[System.Management.Automation.Language.Token[]] $tokens,

				[Parameter(ParameterSetName = ''AstInputSet'', Mandatory = $true, Position = 2)]
				[System.Management.Automation.Language.IScriptPosition] $positionOfCursor,

				[Parameter(ParameterSetName = ''ScriptInputSet'', Position = 2)]
				[Parameter(ParameterSetName = ''AstInputSet'', Position = 3)]
				[Hashtable] $options = $null
			)

			End
			{
				if ($psCmdlet.ParameterSetName -eq ''ScriptInputSet'') {
					$shouldProcessInput = [VMware.VimAutomation.ViCore.Cmdlets.Commands.DotNetInterop.GetViewAutoCompleter]::ShouldProcess(
						<#inputScript#>  $inputScript,
						<#cursorColumn#> $cursorColumn,
						<#options#>        $options)
					
					if ($shouldProcessInput) {
						return [VMware.VimAutomation.ViCore.Cmdlets.Commands.DotNetInterop.GetViewAutoCompleter]::CompleteInput(
							<#inputScript#>  $inputScript,
							<#cursorColumn#> $cursorColumn,
							<#options#>        $options)
					} else {
						return global:TabExpansionDefault $inputScript $cursorColumn $options
					}
				} else {
					$shouldProcessInput = [VMware.VimAutomation.ViCore.Cmdlets.Commands.DotNetInterop.GetViewAutoCompleter]::ShouldProcess(
						<#ast#>              $ast,
						<#tokens#>           $tokens,
						<#positionOfCursor#> $positionOfCursor,
						<#options#>          $options)
					
					if ($shouldProcessInput) {
						return [VMware.VimAutomation.ViCore.Cmdlets.Commands.DotNetInterop.GetViewAutoCompleter]::CompleteInput(
							<#ast#>              $ast,
							<#tokens#>           $tokens,
							<#positionOfCursor#> $positionOfCursor,
							<#options#>          $options)
					} else {
						return global:TabExpansionDefault $ast $tokens $positionOfCursor $options
					}
				}
			}
		'
	
		# Declare a new function that will hold the current tab expansion implementation
		Copy-Item Function:\TabExpansion2 Function:\global:TabExpansionDefault
		
		# Override the current tab expansion implementation to hook our proxy
		Set-Item -Path Function:\TabExpansion2 -Value $tabExpansionProxyFunction
	}
}


# Aliases
set-alias Get-VIServer Connect-VIServer -Scope Global
set-alias Get-VC Connect-VIServer -Scope Global
set-alias Get-ESX Connect-VIServer -Scope Global
set-alias Answer-VMQuestion Set-VMQuestion -Scope Global
set-alias Get-PowerCLIDocumentation Get-PowerCLIHelp -Scope Global
set-alias Get-VIToolkitVersion Get-PowerCLIVersion -Scope Global
set-alias Get-VIToolkitConfiguration Get-PowerCLIConfiguration -Scope Global
set-alias Set-VIToolkitConfiguration Set-PowerCLIConfiguration -Scope Global
set-alias Export-VM Export-VApp -Scope Global
set-alias Apply-VMHostProfile Invoke-VMHostProfile -Scope Global
set-alias Apply-DrsRecommendation Invoke-DrsRecommendation -Scope Global
set-alias Shutdown-VMGuest Stop-VMGuest -Scope Global

# Uid utilities
$global:UidUtil = [VMware.VimAutomation.ViCore.Cmdlets.Utilities.UidUtil]::Create()
add-member -inputobject $global:UidUtil -membertype scriptmethod -name GetHelp -Value { Get-Help about_uid }

HookGetViewAutoCompleter

# SIG # Begin signature block
# MIIrHQYJKoZIhvcNAQcCoIIrDjCCKwoCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBvIPgAyfK0gNGS
# o13JSibFq6wu7p8piZ9fn/fdI1s47qCCDdowggawMIIEmKADAgECAhAIrUCyYNKc
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
# tKncUjJ1xAAtAExGdCh6VD2U5iYxghyZMIIclQIBATB9MGkxCzAJBgNVBAYTAlVT
# MRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1
# c3RlZCBHNCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEzODQgMjAyMSBDQTECEA7G
# 8rJ2oUagfQ5tk1e14QgwDQYJYIZIAWUDBAIBBQCggZYwGQYJKoZIhvcNAQkDMQwG
# CisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwKgYKKwYB
# BAGCNwIBDDEcMBqhGIAWaHR0cDovL3d3dy52bXdhcmUuY29tLzAvBgkqhkiG9w0B
# CQQxIgQg1Ui8YC+CnvZMKWNmoDfza7rY5Egqv+22oyEVBA7GCXUwDQYJKoZIhvcN
# AQEBBQAEggGALxK8m1HqlG7yvhMphAP+IRBFo9CLNgWXqPIYdhCEezYWwVqfds2r
# JB37/QKeoUwu1Pi1TH3PIaRMu46Qi7TdFRSybKTu1ayYMk2KYrmgTilDRs2EBmcY
# dbTl1YW/tkKckg9Y/j6khtllaEknZWuU9CggBfwotkODGauwFrpuIlUl4UxnzmWp
# AVKBr5VH2k++zaBUySa6CdfiRYRUZUrt9kj94RDEljPkqkBBTW6w+0a1rPl4oErC
# P+7hlNnj8xonlvdEN9KVH1lJ27gYUiifWS7hS/tHphT0G38K/mge71mbj/Qwj1+E
# S1R2FTXlksUq/D/Futhu3svun7nKkWmVkzWjZ1VbldlPzBGpCfpr+GW6bAc0BeUZ
# CTogpX7pFLF6FvrnMS+ovWjnyO5c5nD6l8kAAsyZCQXTNLInz8KnQbaUkrMOMv/R
# DqTaZq7gnjdA8CjT+hjawbmWxwmCiVnw2XFA28xQxQgxX/vMQNaUwHAdyGEGvTzK
# UAVBIBzAiLuLoYIZ1DCCGdAGCisGAQQBgjcDAwExghnAMIIZvAYJKoZIhvcNAQcC
# oIIZrTCCGakCAQMxDTALBglghkgBZQMEAgEwgdwGCyqGSIb3DQEJEAEEoIHMBIHJ
# MIHGAgEBBgkrBgEEAaAyAgMwMTANBglghkgBZQMEAgEFAAQghPldIFJLbtyz3c9w
# fbDBfoVcASF8yQFQLw3G54a9K2wCFHni4k+Kjoy8NFYRK4HcBGzY7sgYGA8yMDIy
# MDcxMTEyMDY0MVowAwIBAaBXpFUwUzELMAkGA1UEBhMCQkUxGTAXBgNVBAoMEEds
# b2JhbFNpZ24gbnYtc2ExKTAnBgNVBAMMIEdsb2JhbHNpZ24gVFNBIGZvciBBZHZh
# bmNlZCAtIEc0oIIVZzCCBlgwggRAoAMCAQICEAHCnHr0eqYCWA6vMrEjsR0wDQYJ
# KoZIhvcNAQELBQAwWzELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24g
# bnYtc2ExMTAvBgNVBAMTKEdsb2JhbFNpZ24gVGltZXN0YW1waW5nIENBIC0gU0hB
# Mzg0IC0gRzQwHhcNMjIwNDA2MDc0NDEyWhcNMzMwNTA4MDc0NDEyWjBTMQswCQYD
# VQQGEwJCRTEZMBcGA1UECgwQR2xvYmFsU2lnbiBudi1zYTEpMCcGA1UEAwwgR2xv
# YmFsc2lnbiBUU0EgZm9yIEFkdmFuY2VkIC0gRzQwggGiMA0GCSqGSIb3DQEBAQUA
# A4IBjwAwggGKAoIBgQCj3qYhEhYSvCjgBPez1LDTAWiPU7YYWFtxoF7Y1kxz4Ffw
# uQwH94e5KYP+8NV1oUj/PbAcQLyCVWhIOgxG6z/DLJg0z8SYm3AbhhGNXhV8oQ3a
# 1nd9r+x+nBTspb8pauuKKRr+Dp8suhZNWFpjcQzbLrRwCudGEELue0V8/mRFlK/g
# 61CyUmcfcUM38eIYg0AQV5oV1/Lya56byVbbZ4MYePdlpAXM5hOFFP5fiWcBYfva
# xoMo1o1O3TQsGAMBhEjdFngl4dZIaa1cNZYhHqDDTxMAF8vCXtySTQRiyXj13qex
# hAqedDqC3ICUtwFtq6g5nhpdwXwBBl2Qez5dSijKKRCxs1nPAbghMMfZtfSXLDau
# UsezMiNug6b51CT3VvhhdXRO8garIoTI/WTlXxWl3Cd0qtLQ6bRIeNeYzLsf+NZG
# w3V1+p5FxpV1awcHqETdVnYozkpNAnlrT5Hi/Kyd67yKr3prbGQ0RvHMeBy8J/R1
# aKczyToXfopORD6D870CAwEAAaOCAZ4wggGaMA4GA1UdDwEB/wQEAwIHgDAWBgNV
# HSUBAf8EDDAKBggrBgEFBQcDCDAdBgNVHQ4EFgQUSTtntVeimeZ0GXoMWSw+COog
# e4swTAYDVR0gBEUwQzBBBgkrBgEEAaAyAR4wNDAyBggrBgEFBQcCARYmaHR0cHM6
# Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDAYDVR0TAQH/BAIwADCB
# kAYIKwYBBQUHAQEEgYMwgYAwOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2Jh
# bHNpZ24uY29tL2NhL2dzdHNhY2FzaGEzODRnNDBDBggrBgEFBQcwAoY3aHR0cDov
# L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3N0c2FjYXNoYTM4NGc0LmNy
# dDAfBgNVHSMEGDAWgBTqFsZp5+PLV0U5M6TwQL7Qw71lljBBBgNVHR8EOjA4MDag
# NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2NhL2dzdHNhY2FzaGEzODRn
# NC5jcmwwDQYJKoZIhvcNAQELBQADggIBAAiIpOqFiDNYa378AFUi029DaW98/r5D
# hjcOn1PaUZ7QPOMbmddRURkPUZAO2+6aRs99CuDG7BWC6z6uzAP6We2PpUqiGT7C
# X/0WgzFWUihLX8RFg2HrlgwgMKJ9ReqWbbL8dLj9TGGUaqew6qm/OI6YdnUHpvul
# 3AtvdXpk6TDXkZBi0OHLGeToLyeIQIyH2z/bFbBIjeKNlYwn86xJh7B86cSl4Nnc
# vvYNFbjeY519liutpK6UYDfQSJmo270vTvQAj7f8SNq2EEDEPznbVXe9CzysNqBK
# mRTg0DEeidInCnBQ3a1vZPpvjRr2UPQWEzAMGM7YaELVVeNaX8CggbwZvESwY4p+
# wCseVW7nHR4TZJlmZAmD6YHmPiv95HzsQ7ubbzVik2Sau1i4rwRuKLsKWOOFOSXU
# 44sVcwE6HctdkfyeRS6HtfBGnJTDaK36DutH2akl1ooK2J7vrKJepi6cWNG9Ub8S
# ctARm0zPm1K/p+pKlCL82nSzRdSzCdZoREAqH4ps2uVpcQAS+Mnf6pipKmqP1Jrg
# H6yZ4ehdPnk8RaQOCoYUoBXlkiCB8oKO86rJnF8cSXT8IbUo4IEN/7d/mIPAYNMB
# xWbMYbzCpAsDNzaaMiXCxeaDlPzQeb+D07xTteP+z+FxPgXbYo8kve9TqvKeUww/
# fGvw6iU4X3KqMIIGWTCCBEGgAwIBAgINAewckkDe/S5AXXxHdDANBgkqhkiG9w0B
# AQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UE
# ChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0xODA2MjAwMDAw
# MDBaFw0zNDEyMTAwMDAwMDBaMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9i
# YWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIFRpbWVzdGFtcGluZyBD
# QSAtIFNIQTM4NCAtIEc0MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA
# 8ALiMCP64BvhmnSzr3WDX6lHUsdhOmN8OSN5bXT8MeR0EhmW+s4nYluuB4on7lej
# xDXtszTHrMMM64BmbdEoSsEsu7lw8nKujPeZWl12rr9EqHxBJI6PusVP/zZBq6ct
# /XhOQ4j+kxkX2e4xz7yKO25qxIjw7pf23PMYoEuZHA6HpybhiMmg5ZninvScTD9d
# W+y279Jlz0ULVD2xVFMHi5luuFSZiqgxkjvyen38DljfgWrhsGweZYIq1CHHlP5C
# ljvxC7F/f0aYDoc9emXr0VapLr37WD21hfpTmU1bdO1yS6INgjcZDNCr6lrB7w/V
# mbk/9E818ZwP0zcTUtklNO2W7/hn6gi+j0l6/5Cx1PcpFdf5DV3Wh0MedMRwKLSA
# e70qm7uE4Q6sbw25tfZtVv6KHQk+JA5nJsf8sg2glLCylMx75mf+pliy1NhBEsFV
# /W6RxbuxTAhLntRCBm8bGNU26mSuzv31BebiZtAOBSGssREGIxnk+wU0ROoIrp1J
# ZxGLguWtWoanZv0zAwHemSX5cW7pnF0CTGA8zwKPAf1y7pLxpxLeQhJN7Kkm5XcC
# rA5XDAnRYZ4miPzIsk3bZPBFn7rBP1Sj2HYClWxqjcoiXPYMBOMp+kuwHNM3dITZ
# HWarNHOPHn18XpbWPRmwl+qMUJFtr1eGfhA3HWsaFN8CAwEAAaOCASkwggElMA4G
# A1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdDgQWBBTqFsZp
# 5+PLV0U5M6TwQL7Qw71lljAfBgNVHSMEGDAWgBSubAWjkxPioufi1xzWx/B/yGdT
# oDA+BggrBgEFBQcBAQQyMDAwLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
# YWxzaWduLmNvbS9yb290cjYwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5n
# bG9iYWxzaWduLmNvbS9yb290LXI2LmNybDBHBgNVHSAEQDA+MDwGBFUdIAAwNDAy
# BggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9y
# eS8wDQYJKoZIhvcNAQEMBQADggIBAH/iiNlXZytCX4GnCQu6xLsoGFbWTL/bGwdw
# xvsLCa0AOmAzHznGFmsZQEklCB7km/fWpA2PHpbyhqIX3kG/T+G8q83uwCOMxoX+
# SxUk+RhE7B/CpKzQss/swlZlHb1/9t6CyLefYdO1RkiYlwJnehaVSttixtCzAsw0
# SEVV3ezpSp9eFO1yEHF2cNIPlvPqN1eUkRiv3I2ZOBlYwqmhfqJuFSbqtPl/Kufn
# SGRpL9KaoXL29yRLdFp9coY1swJXH4uc/LusTN763lNMg/0SsbZJVU91naxvSsgu
# arnKiMMSME6yCHOfXqHWmc7pfUuWLMwWaxjN5Fk3hgks4kXWss1ugnWl2o0et1sv
# iC49ffHykTAFnM57fKDFrK9RBvARxx0wxVFWYOh8lT0i49UKJFMnl4D6SIknLHni
# POWbHuOqhIKJPsBK9SH+YhDtHTD89szqSCd8i3VCf2vL86VrlR8EWDQKie2CUOTR
# e6jJ5r5IqitV2Y23JSAOG1Gg1GOqg+pscmFKyfpDxMZXxZ22PLCLsLkcMe+97xTY
# FEBsIB3CLegLxo1tjLZx7VIh/j72n585Gq6s0i96ILH0rKod4i0UnfqWah3GPMrz
# 2Ry/U02kR1l8lcRDQfkl4iwQfoH5DZSnffK1CfXYYHJAUJUg1ENEvvqglecgWbZ4
# xqRqqiKbMIIFRzCCBC+gAwIBAgINAfJAQkDO/SLb6Wxx/DANBgkqhkiG9w0BAQwF
# ADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMK
# R2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0xOTAyMjAwMDAwMDBa
# Fw0yOTAzMTgxMDAwMDBaMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAt
# IFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMIIC
# IjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAlQfoc8pm+ewUyns89w0I8bRF
# CyyCtEjG61s8roO4QZIzFKRvf+kqzMawiGvFtonRxrL/FM5RFCHsSt0bWsbWh+5N
# OhUG7WRmC5KAykTec5RO86eJf094YwjIElBtQmYvTbl5KE1SGooagLcZgQ5+xIq8
# ZEwhHENo1z08isWyZtWQmrcxBsW+4m0yBqYe+bnrqqO4v76CY1DQ8BiJ3+QPefXq
# oh8q0nAue+e8k7ttU+JIfIwQBzj/ZrJ3YX7g6ow8qrSk9vOVShIHbf2MsonP0KBh
# d8hYdLDUIzr3XTrKotudCd5dRC2Q8YHNV5L6frxQBGM032uTGL5rNrI55KwkNrfw
# 77YcE1eTtt6y+OKFt3OiuDWqRfLgnTahb1SK8XJWbi6IxVFCRBWU7qPFOJabTk5a
# C0fzBjZJdzC8cTflpuwhCHX85mEWP3fV2ZGXhAps1AJNdMAU7f05+4PyXhShBLAL
# 6f7uj+FuC7IIs2FmCWqxBjplllnA8DX9ydoojRoRh3CBCqiadR2eOoYFAJ7bgNYl
# +dwFnidZTHY5W+r5paHYgw/R/98wEfmFzzNI9cptZBQselhP00sIScWVZBpjDnk9
# 9bOMylitnEJFeW4OhxlcVLFltr+Mm9wT6Q1vuC7cZ27JixG1hBSKABlwg3mRl5HU
# Gie/Nx4yB9gUYzwoTK8CAwEAAaOCASYwggEiMA4GA1UdDwEB/wQEAwIBBjAPBgNV
# HRMBAf8EBTADAQH/MB0GA1UdDgQWBBSubAWjkxPioufi1xzWx/B/yGdToDAfBgNV
# HSMEGDAWgBSP8Et/qC5FJK5NUPpjmove4t0bvDA+BggrBgEFBQcBAQQyMDAwLgYI
# KwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9iYWxzaWduLmNvbS9yb290cjMwNgYD
# VR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
# LmNybDBHBgNVHSAEQDA+MDwGBFUdIAAwNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93
# d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDQYJKoZIhvcNAQEMBQADggEB
# AEmsXsWD81rLYSpNl0oVKZ/kFJCqCfnEep81GIoKMxVtcociTkE/bQqeGK7b4l/8
# ldEsmBQ7jsHwNll5842Bz3T2GKTk4WjP739lWULpylU5vNPFJu5xOPrXIQMPt07Z
# W2BqQ7R9CdBgYd2q7QBeTjIe4LJsnjyywruY05B2ammtGtyoidpYT9LCizJKzlT7
# OOk7Bwt1ChHbC3wlJ/GsJs8RU+bcxuJhNTL0zt2D4xk668Joo3IAyCQ8TrhTPLEX
# q+Y1LPnTQinmX2ADrEJhprFXajNC3zUxhso+NyvaxNok9U4S8ra5t0fquyCtYRa3
# oDPjLYmnvLM8AX8jGoAJNOkwggNfMIICR6ADAgECAgsEAAAAAAEhWFMIojANBgkq
# hkiG9w0BAQsFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzET
# MBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0wOTAz
# MTgxMDAwMDBaFw0yOTAzMTgxMDAwMDBaMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24g
# Um9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9i
# YWxTaWduMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzCV2kHkGeCIW
# 9cCDtoTKKJ79BXYRxa2IcvxGAkPHsoqdBF8kyy5L4WCCRuFSqwyBR3Bs3WTR6/Us
# ow+CPQwrrpfXthSGEHm7OxOAd4wI4UnSamIvH176lmjfiSeVOJ8G1z7JyyZZDXPe
# sMjpJg6DFcbvW4vSBGDKSaYo9mk79svIKJHlnYphVzesdBTcdOA67nIvLpz70Lu/
# 9T0A4QYz6IIrrlOmOhZzjN1BDiA6wLSnoemyT5AuMmDpV8u5BJJoaOU4JmB1sp93
# /5EU764gSfytQBVI0QIxYRleuJfvrXe3ZJp6v1/BE++bYvsNbOBUaRapA9pu6YOT
# cXbGaYWCFwIDAQABo0IwQDAOBgNVHQ8BAf8EBAMCAQYwDwYDVR0TAQH/BAUwAwEB
# /zAdBgNVHQ4EFgQUj/BLf6guRSSuTVD6Y5qL3uLdG7wwDQYJKoZIhvcNAQELBQAD
# ggEBAEtA28BQqv7IDO/3llRFSbuWAAlBrLMThoYoBzPKa+Z0uboALa6kCtP18fEP
# ir9zZ0qDx0R7eOCvbmxvAymOMzlFw47kuVdsqvwSluxTxi3kJGy5lGP73FNoZ1Y+
# g7jPNSHDyWj+ztrCU6rMkIrp8F1GjJXdelgoGi8d3s0AN0GP7URt11Mol37zZwQe
# FdeKlrTT3kwnpEwbc3N29BeZwh96DuMtCK0KHCz/PKtVDg+Rfjbrw1dJvuEuLXxg
# i8NBURMjnc73MmuUAaiZ5ywzHzo7JdKGQM47LIZ4yWEvFLru21Vv34TuBQlNvSjY
# cs7TYlBlHuuSl4Mx2bO1ykdYP18xggNJMIIDRQIBATBvMFsxCzAJBgNVBAYTAkJF
# MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWdu
# IFRpbWVzdGFtcGluZyBDQSAtIFNIQTM4NCAtIEc0AhABwpx69HqmAlgOrzKxI7Ed
# MAsGCWCGSAFlAwQCAaCCAS0wGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMCsG
# CSqGSIb3DQEJNDEeMBwwCwYJYIZIAWUDBAIBoQ0GCSqGSIb3DQEBCwUAMC8GCSqG
# SIb3DQEJBDEiBCDjqqKiUfySvCX/zB/DPa5Psmv8rfpCJdZwMjST3MiFTjCBsAYL
# KoZIhvcNAQkQAi8xgaAwgZ0wgZowgZcEIK+AMe1uyzkUREiVvQsdDOsSlZTbXgws
# bfa+crElQkfQMHMwX6RdMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxT
# aWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIFRpbWVzdGFtcGluZyBDQSAt
# IFNIQTM4NCAtIEc0AhABwpx69HqmAlgOrzKxI7EdMA0GCSqGSIb3DQEBCwUABIIB
# gGfavDSVWp5r9FElA08yCiJhFOkPILMp2U8Cw1SIOmRXSXlwCvpGQFF3LMtyFfNS
# mgE3T5Cl/7xnkAS6VH6pckT3ce147Lm3PCKv8+cntim44+xZN/bgh1rw9fy69WJ4
# vfkk0nqwziR0PpXHjZTlPJkN+XsozZLBcAUz1Xf3UkuMD33m4YYyRE4rwQMl7QtG
# 1wf9dy6PTKu2NGwXUB0zc+KhX0AjRYAnt/up9UEuGUivaJVvlS6XG5Rb8pq0DeCb
# nRA2bnKLJUsTP2S26k16+qZUtBFReHOoykHbsxNzRpRTAJRbx+Ihun3pOyt8gVLU
# rA2qob4QaoPXMK9Yby/giDWbO7edqvJrHpsB0meWUnM8nWPCXz5rQGvkQIMPhyFR
# pb+5B65ZeowSLI3OcS/sJoXgaFsendqjq42oZbaG4jVBBI9j1RzIhmS1r5iKxg/m
# fKSf3Ivu2yiIVY7FK1/WsX0/EGelsolrNh+X11V48m4CZuDmTs730g/ZzMoWc2k8
# Vw==
# SIG # End signature block
