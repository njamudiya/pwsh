using module VMware.PowerCLI.VCenter.Types.ApplianceService
using module VMware.PowerCLI.Sdk.Types

using namespace VMware.VimAutomation.ViCore.Types.V1
using namespace VMware.VimAutomation.ViCore.Types.V1.Inventory
using namespace VMware.VimAutomation.Sdk.Util10Ps.BaseCmdlet
using namespace VMware.VimAutomation.Sdk.Types.V1

. (Join-Path $PSScriptRoot "../utils/Get-ConnectionUid.ps1")
. (Join-Path $PSScriptRoot "../types/builders/New-ViApplianceServiceInfo.ps1")

function Set-VIApplianceServiceState {
    [CmdletBinding(
        ConfirmImpact = "High",
        SupportsShouldProcess = $true)]
    Param (
       [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
       [ObnArgumentTransformation2Attribute('ViApplianceServiceInfo')]
       [ViApplianceServiceInfo[]]
       $ApplianceService,

       [Parameter(Mandatory = $true)]
       [ApplianceServiceOperation]
       $Operation,

       [Parameter()]
       [ObnArgumentTransformation([ViServer], Critical = $true)]
       [VIServer]
       $Server
    )

    Begin {
        if($Server) {
            $resolvedServer = Resolve-ObjectByName -Object $Server `
                -Type ([VIServer]) `
                -OneObjectExpected

            $Server = [VIServer] $resolvedServer
        }

        if($ApplianceService) {
            $resolvedApplianceService = Resolve-ObjectByName -Object $ApplianceService `
                -Type ([ViApplianceServiceInfo]) `
                -OneOrMoreObjectsExpected `
                -CollectorCmdlet 'Get-VIApplianceService' `
                -Server $Server
            $ApplianceService = [ViApplianceServiceInfo[]] $resolvedApplianceService
        }
    }

    Process {
        $ServiceIds = @()

        try {
            switch ($Operation) {
                Start {
                    $reason = 'Start appliance service'
                }
                Stop {
                    $reason = 'Stop appliance service'
                }
                Restart {
                    $reason = 'Restart appliance service'
                }
            }

            $shouldProcessDescription = Get-SetVIApplianceServiceStateShouldProcessMessage $ApplianceService $Operation
            $shouldProcessWarning = Get-SetVIApplianceServiceStateShouldProcessMessage $ApplianceService $Operation -warning
        } catch {
            Write-PowerCLIError `
               -ErrorObject $_ `
               -ErrorId $PowerCLI_SetVIApplianceServiceState_UnableToGenerateConfirmMessages_ErrorId
        }

        if($PSCmdlet.ShouldProcess(
            $shouldProcessDescription,
            $shouldProcessWarning,
            $reason)) {

            $ApplianceService | ForEach-Object {
                $currentServer = Get-ConnectionUid $_.Uid | Get-ServerByUid
                if ($Server -and $server.Uid -notcontains $currentServer.Uid){
                    Write-PowerCLIError `
                        -ErrorObject "Appliance service with Uid '$($_.Uid)' does not belong to the specified VI Server '$Server'." `
                        -ErrorId $PowerCLI_VIServiceAppliance_ServiceNotMatchingServer_ErrorId
                } else {
                    $currentApiServer = GetApiServer($currentServer)
                    ValidateApiVersionSupported -server $currentServer -major 6 -minor 7 -ErrorAction:Stop
                    try {
                        $currentApplianceService = $_
                        switch ($Operation) {
                            Start {
                                Invoke-ApplianceStartService -Service $currentApplianceService.name -Server $currentApiServer | Out-Null
                            }
                            Stop {
                                Invoke-ApplianceStopService -Service $currentApplianceService.name -Server $currentApiServer | Out-Null
                            }
                            Restart {
                                Invoke-ApplianceRestartService -Service $currentApplianceService.name -Server $currentApiServer | Out-Null
                            }
                        }
                        $ServiceIds += $currentApplianceService.Uid
                    } catch {
                        switch ($Operation) {
                            Start {
                                $errorId = $PowerCLI_VIServiceAppliance_Invoke_ApplianceStartService_ErrorId
                            }
                            Stop {
                                $errorId = $PowerCLI_VIServiceAppliance_Invoke_ApplianceStopService_ErrorId
                            }
                            Restart {
                                $errorId = $PowerCLI_VIServiceAppliance_Invoke_ApplianceRestartService_ErrorId
                            }
                        }

                        Write-PowerCLIError `
                        -ErrorObject $_ `
                        -ErrorId $errorId
                    }
                }
            }

            if ($ServiceIds.Count -gt 0) {
                Get-VIApplianceService -Id $ServiceIds
            }
        }
    }
}

function Get-SetVIApplianceServiceStateShouldProcessMessage {
    param(
       [ViApplianceServiceInfo[]]
       $ApplianceService,

       [ApplianceServiceOperation]
       $Operation,

       [switch]
       $warning
    )

    switch ($Operation) {
        Start {
            $whatIfString = "Are you sure you want to start "
            $warningString = "Starting "
        }
        Stop {
            $whatIfString = "Are you sure you want to stop "
            $warningString = "Stopping "
        }
        Restart {
            $whatIfString = "Are you sure you want to restart "
            $warningString = "Restarting "
        }
    }

    $sb = [System.Text.StringBuilder]::new()

    if ($warning.ToBool()) {
        $sb.Append($whatIfString) | Out-Null
    } else {
        $sb.Append($warningString) | Out-Null
    }


    $viServers = $ApplianceService.Server | Select-Object -Unique
    $ApplianceServiceByServer = @{}
    $viServers | ForEach-Object {
        $currentViServer = $_
        $ApplianceServiceByServer[$currentViServer.Name] = $ApplianceService | Where-Object {
            $_.Server -eq $currentViServer
        }
    }

    $ApplianceServiceByServer.Keys | ForEach-Object {
        $ApplianceServiceByServer[$_] | ForEach-Object {
            $sb.Append("'") | Out-Null
            $sb.Append($_.Name) | Out-Null
            $sb.Append("'") | Out-Null
            $sb.Append(", ") | Out-Null
        }
        $sb.Remove(($sb.Length-2),2) | Out-Null

        $sb.Append(" appliance service(s)") | Out-Null
        $sb.Append(" on") | Out-Null
        $sb.Append(" vCenter Server '$_'") | Out-Null
        $sb.Append("; ") | Out-Null
    }

    $sb.Remove(($sb.Length-2),2) | Out-Null

    if ($warning.ToBool()) {
        $sb.Append("?") | Out-Null
    } else {
        $sb.Append(".") | Out-Null
    }

    $sb.ToString()
}

# SIG # Begin signature block
# MIIi/AYJKoZIhvcNAQcCoIIi7TCCIukCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCB2EewLf7fE/1vC
# DRZ7LSr6xo/v4A+0VACzba2x2cNIaaCCDdowggawMIIEmKADAgECAhAIrUCyYNKc
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
# tKncUjJ1xAAtAExGdCh6VD2U5iYxghR4MIIUdAIBATB9MGkxCzAJBgNVBAYTAlVT
# MRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1
# c3RlZCBHNCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEzODQgMjAyMSBDQTECEA7G
# 8rJ2oUagfQ5tk1e14QgwDQYJYIZIAWUDBAIBBQCggZYwGQYJKoZIhvcNAQkDMQwG
# CisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwKgYKKwYB
# BAGCNwIBDDEcMBqhGIAWaHR0cDovL3d3dy52bXdhcmUuY29tLzAvBgkqhkiG9w0B
# CQQxIgQg+yoYWHr7xZEw9aLLtnpHs4+qGc8vGE1iA8uViLFDr2YwDQYJKoZIhvcN
# AQEBBQAEggGAAmqWdzHfF66hu9uPE4yWNXgtAYoRUqwgz6kp78FrhxuOkaz1/d53
# p36AvDaE2Rd2NuUqaZwDDc0ZUMzxo6VStz0jIKzfqU8kChmuCQjBwuKj8COh6w6I
# nxBIOMoa49JW5eslDnEzztw/7s6SJZ89jWoSU4UX95vtCRHebNbFCbdcl7dPY7r9
# bhalMsIQxCv758nOe7JDYrDmBg5WO4hbYOAvPx7aXe22z82v199cVHRGMBM2Yqgo
# xqPUU1Q5FSTgzHnWfnWZ9tJnTbRKkjKToaTb4z9lyW+psEf7/GiOXSV3T/oKHVAU
# 6uD/P09BPwEuQ54zk4L+KSelSPTmtdyGJw2CIlSkwwAGSQEMP25yC21JomRuLyQ8
# SDhG4EA8VefIHfwScIOzLj0keyF9wHh+w9uBzX9yktujMtZIGbSMx5RFJTOTxo2A
# enOFv/FSNGnXmZIL8+R7K47DUAJc73zs2LXwKSYLkABnRWFzu1irNmkdaDVPTmIV
# xPOkqwE144ZSoYIRszCCEa8GCisGAQQBgjcDAwExghGfMIIRmwYJKoZIhvcNAQcC
# oIIRjDCCEYgCAQMxDzANBglghkgBZQMEAgEFADB4BgsqhkiG9w0BCRABBKBpBGcw
# ZQIBAQYJYIZIAYb9bAcBMDEwDQYJYIZIAWUDBAIBBQAEIDSodhc5yRjGMA7bNcxQ
# YNoSgwLgQ1HZkoLXLBil/JTwAhEA/T8E8xJkz9IiiEpX+Zrq3xgPMjAyMjA0MDQx
# NDIwNDJaoIINfDCCBsYwggSuoAMCAQICEAp6SoieyZlCkAZjOE2Gl50wDQYJKoZI
# hvcNAQELBQAwYzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMu
# MTswOQYDVQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQwOTYgU0hBMjU2IFRp
# bWVTdGFtcGluZyBDQTAeFw0yMjAzMjkwMDAwMDBaFw0zMzAzMTQyMzU5NTlaMEwx
# CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjEkMCIGA1UEAxMb
# RGlnaUNlcnQgVGltZXN0YW1wIDIwMjIgLSAyMIICIjANBgkqhkiG9w0BAQEFAAOC
# Ag8AMIICCgKCAgEAuSqWI6ZcvF/WSfAVghj0M+7MXGzj4CUu0jHkPECu+6vE43hd
# flw26vUljUOjges4Y/k8iGnePNIwUQ0xB7pGbumjS0joiUF/DbLW+YTxmD4LvwqE
# EnFsoWImAdPOw2z9rDt+3Cocqb0wxhbY2rzrsvGD0Z/NCcW5QWpFQiNBWvhg02Us
# Pn5evZan8Pyx9PQoz0J5HzvHkwdoaOVENFJfD1De1FksRHTAMkcZW+KYLo/Qyj//
# xmfPPJOVToTpdhiYmREUxSsMoDPbTSSF6IKU4S8D7n+FAsmG4dUYFLcERfPgOL2i
# vXpxmOwV5/0u7NKbAIqsHY07gGj+0FmYJs7g7a5/KC7CnuALS8gI0TK7g/ojPNn/
# 0oy790Mj3+fDWgVifnAs5SuyPWPqyK6BIGtDich+X7Aa3Rm9n3RBCq+5jgnTdKEv
# sFR2wZBPlOyGYf/bES+SAzDOMLeLD11Es0MdI1DNkdcvnfv8zbHBp8QOxO9APhk6
# AtQxqWmgSfl14ZvoaORqDI/r5LEhe4ZnWH5/H+gr5BSyFtaBocraMJBr7m91wLA2
# JrIIO/+9vn9sExjfxm2keUmti39hhwVo99Rw40KV6J67m0uy4rZBPeevpxooya1h
# sKBBGBlO7UebYZXtPgthWuo+epiSUc0/yUTngIspQnL3ebLdhOon7v59emsCAwEA
# AaOCAYswggGHMA4GA1UdDwEB/wQEAwIHgDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB
# /wQMMAoGCCsGAQUFBwMIMCAGA1UdIAQZMBcwCAYGZ4EMAQQCMAsGCWCGSAGG/WwH
# ATAfBgNVHSMEGDAWgBS6FtltTYUvcyl2mi91jGogj57IbzAdBgNVHQ4EFgQUjWS3
# iSH+VlhEhGGn6m8cNo/drw0wWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2NybDMu
# ZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZEc0UlNBNDA5NlNIQTI1NlRpbWVT
# dGFtcGluZ0NBLmNybDCBkAYIKwYBBQUHAQEEgYMwgYAwJAYIKwYBBQUHMAGGGGh0
# dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBYBggrBgEFBQcwAoZMaHR0cDovL2NhY2Vy
# dHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZEc0UlNBNDA5NlNIQTI1NlRp
# bWVTdGFtcGluZ0NBLmNydDANBgkqhkiG9w0BAQsFAAOCAgEADS0jdKbR9fjqS5k/
# AeT2DOSvFp3Zs4yXgimcQ28BLas4tXARv4QZiz9d5YZPvpM63io5WjlO2IRZpbwb
# mKrobO/RSGkZOFvPiTkdcHDZTt8jImzV3/ZZy6HC6kx2yqHcoSuWuJtVqRprfdH1
# AglPgtalc4jEmIDf7kmVt7PMxafuDuHvHjiKn+8RyTFKWLbfOHzL+lz35FO/bgp8
# ftfemNUpZYkPopzAZfQBImXH6l50pls1klB89Bemh2RPPkaJFmMga8vye9A140pw
# SKm25x1gvQQiFSVwBnKpRDtpRxHT7unHoD5PELkwNuTzqmkJqIt+ZKJllBH7bjLx
# 9bs4rc3AkxHVMnhKSzcqTPNc3LaFwLtwMFV41pj+VG1/calIGnjdRncuG3rAM4r4
# SiiMEqhzzy350yPynhngDZQooOvbGlGglYKOKGukzp123qlzqkhqWUOuX+r4DwZC
# nd8GaJb+KqB0W2Nm3mssuHiqTXBt8CzxBxV+NbTmtQyimaXXFWs1DoXW4CzM4Awk
# uHxSCx6ZfO/IyMWMWGmvqz3hz8x9Fa4Uv4px38qXsdhH6hyF4EVOEhwUKVjMb9N/
# y77BDkpvIJyu2XMyWQjnLZKhGhH+MpimXSuX4IvTnMxttQ2uR2M4RxdbbxPaahBu
# H0m3RFu0CAqHWlkEdhGhp3cCExwwggauMIIElqADAgECAhAHNje3JFR82Ees/Shm
# Kl5bMA0GCSqGSIb3DQEBCwUAMGIxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdp
# Q2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAfBgNVBAMTGERp
# Z2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDAeFw0yMjAzMjMwMDAwMDBaFw0zNzAzMjIy
# MzU5NTlaMGMxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE7
# MDkGA1UEAxMyRGlnaUNlcnQgVHJ1c3RlZCBHNCBSU0E0MDk2IFNIQTI1NiBUaW1l
# U3RhbXBpbmcgQ0EwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDGhjUG
# SbPBPXJJUVXHJQPE8pE3qZdRodbSg9GeTKJtoLDMg/la9hGhRBVCX6SI82j6ffOc
# iQt/nR+eDzMfUBMLJnOWbfhXqAJ9/UO0hNoR8XOxs+4rgISKIhjf69o9xBd/qxkr
# PkLcZ47qUT3w1lbU5ygt69OxtXXnHwZljZQp09nsad/ZkIdGAHvbREGJ3HxqV3rw
# N3mfXazL6IRktFLydkf3YYMZ3V+0VAshaG43IbtArF+y3kp9zvU5EmfvDqVjbOSm
# xR3NNg1c1eYbqMFkdECnwHLFuk4fsbVYTXn+149zk6wsOeKlSNbwsDETqVcplicu
# 9Yemj052FVUmcJgmf6AaRyBD40NjgHt1biclkJg6OBGz9vae5jtb7IHeIhTZgirH
# kr+g3uM+onP65x9abJTyUpURK1h0QCirc0PO30qhHGs4xSnzyqqWc0Jon7ZGs506
# o9UD4L/wojzKQtwYSH8UNM/STKvvmz3+DrhkKvp1KCRB7UK/BZxmSVJQ9FHzNklN
# iyDSLFc1eSuo80VgvCONWPfcYd6T/jnA+bIwpUzX6ZhKWD7TA4j+s4/TXkt2ElGT
# yYwMO1uKIqjBJgj5FBASA31fI7tk42PgpuE+9sJ0sj8eCXbsq11GdeJgo1gJASgA
# DoRU7s7pXcheMBK9Rp6103a50g5rmQzSM7TNsQIDAQABo4IBXTCCAVkwEgYDVR0T
# AQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUuhbZbU2FL3MpdpovdYxqII+eyG8wHwYD
# VR0jBBgwFoAU7NfjgtJxXWRM3y5nP+e6mK4cD08wDgYDVR0PAQH/BAQDAgGGMBMG
# A1UdJQQMMAoGCCsGAQUFBwMIMHcGCCsGAQUFBwEBBGswaTAkBggrBgEFBQcwAYYY
# aHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEEGCCsGAQUFBzAChjVodHRwOi8vY2Fj
# ZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkUm9vdEc0LmNydDBDBgNV
# HR8EPDA6MDigNqA0hjJodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRU
# cnVzdGVkUm9vdEc0LmNybDAgBgNVHSAEGTAXMAgGBmeBDAEEAjALBglghkgBhv1s
# BwEwDQYJKoZIhvcNAQELBQADggIBAH1ZjsCTtm+YqUQiAX5m1tghQuGwGC4QTRPP
# MFPOvxj7x1Bd4ksp+3CKDaopafxpwc8dB+k+YMjYC+VcW9dth/qEICU0MWfNthKW
# b8RQTGIdDAiCqBa9qVbPFXONASIlzpVpP0d3+3J0FNf/q0+KLHqrhc1DX+1gtqpP
# kWaeLJ7giqzl/Yy8ZCaHbJK9nXzQcAp876i8dU+6WvepELJd6f8oVInw1YpxdmXa
# zPByoyP6wCeCRK6ZJxurJB4mwbfeKuv2nrF5mYGjVoarCkXJ38SNoOeY+/umnXKv
# xMfBwWpx2cYTgAnEtp/Nh4cku0+jSbl3ZpHxcpzpSwJSpzd+k1OsOx0ISQ+UzTl6
# 3f8lY5knLD0/a6fxZsNBzU+2QJshIUDQtxMkzdwdeDrknq3lNHGS1yZr5Dhzq6YB
# T70/O3itTK37xJV77QpfMzmHQXh6OOmc4d0j/R0o08f56PGYX/sr2H7yRp11LB4n
# LCbbbxV7HhmLNriT1ObyF5lZynDwN7+YAN8gFk8n+2BnFqFmut1VwDophrCYoCvt
# lUG3OtUVmDG0YgkPCr2B2RP+v6TR81fZvAT6gt4y3wSJ8ADNXcL50CN/AAvkdgIm
# 2fBldkKmKYcJRyvmfxqkhQ/8mJb2VVQrH4D6wPIOK+XW+6kvRBVK5xMOHds3OBqh
# K/bt1nz8MYIDdjCCA3ICAQEwdzBjMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGln
# aUNlcnQsIEluYy4xOzA5BgNVBAMTMkRpZ2lDZXJ0IFRydXN0ZWQgRzQgUlNBNDA5
# NiBTSEEyNTYgVGltZVN0YW1waW5nIENBAhAKekqInsmZQpAGYzhNhpedMA0GCWCG
# SAFlAwQCAQUAoIHRMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAcBgkqhkiG
# 9w0BCQUxDxcNMjIwNDA0MTQyMDQyWjArBgsqhkiG9w0BCRACDDEcMBowGDAWBBSF
# CPOGUVyz0wd9trS3wH8bSl5B3jAvBgkqhkiG9w0BCQQxIgQgZMro694vkOyGf6YX
# 4FBeQLLrkdaacJBQk4H5IKP0ZA8wNwYLKoZIhvcNAQkQAi8xKDAmMCQwIgQgnaaQ
# FcNJxsGJeEW6NYKtcMiPpCk722q+nCvSU5J55jswDQYJKoZIhvcNAQEBBQAEggIA
# DnbL90qzYlVgw7KKw04R2uV8y0LLZ4DHI5CAuNfuNGKhPAezJ0jey32ohuv4tB0q
# iiQSOXt+S06DyjiRiWCiZ0adhMrMem9Hm73BbP5k9XClpB0XhvM363jKaRm7Qu6O
# FNb9nNqSVZdtBFydPfttMhg8Dua+NIL/v0OtYdPg90a5sJCF4Cj2YepU9KOKT99f
# UevZXWwHtmbZGD11IP/Q6gIZ+X3TvX5S6uSMtxaXBwHfxC3ffWVIwQh1tW8V+p4p
# hWccWljMYcyh6JzkP+KAAE4/MNNHsTCKjKkmeUmRF+v3bOe+Gvuf2Gk9uxA6UcLL
# DYp+UaXsqizrApdvnPTkDASdkMGgq4exge9g4USVzXW8DxN27UAauC3aDFwPdL1l
# XBnB0UPG3iZoCOw0bD3wWmB3iGbOmNbbyXqTcGzvrELnZ5jMvuFL8wyzvA0EWQMy
# 06arL5SWaWd3PNdZ4O6ujc5N/ZBtjQkxSPl1hLyO4sqfGjARQDaKn3pM2QoQkr+o
# filY1Bz5s92csuDcIQHXTrURRVe93wu0f2NVNyj5qNJfsdPOoNmnFpg3W2ThOjLL
# Yh9K1Q44DS+m1Zl4wy+rUMWGeaE8HD9l+Z/k2XPRxvvf0QJKM62DcSxh+9WAbYY7
# hJ5U2kEZVK1m/bpI+a0oXtGdTk3hN1odX6nEeRKDNFw=
# SIG # End signature block