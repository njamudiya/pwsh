using namespace System.Collections.Generic
using namespace VMware.VimAutomation.ViCore.Types.V1

. (Join-Path $PSScriptRoot "./Get-ConnectionUid.ps1")
function GetActiveServer() {
    param (
        [VIServer] $server
    )

    if($server) {
        return $server
    } else {
        if((Test-Path variable:global:DefaultVIServers) -and ($null -ne $global:DefaultVIServers)) {
            if($global:DefaultVIServers.Length -eq 1) {
                return [VIServer] $global:DefaultVIServers[0]
            } else {
                throw "This command require a connection to only a single vCenter. Use the -Server parameter to specify the server if there are more than one connections to vCenter."
            }
        } else {
            throw "Not connected to a vCenter that is in the default list of connections. You can use Connect-VIServer to connect to a server."
        }
    }
}

function Get-ServerByUid() {
   param (
      [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
      [ValidateScript({
         [VMware.VimAutomation.Sdk.Types.V1.DistinguishedName]::IsDistinguishedName($_)
      })]
      [string]
      $Uid
   )

   return [VMware.VimAutomation.Sdk.Interop.V1.CoreServiceFactory]::CoreService.ConnectionService.GetConnection($Uid)
}

function GetApiServer() {
    param (
        [Parameter(Mandatory = $true)]
        [VIServer] $server
    )

    return New-vSphereServerConfiguration -VIConnection $server
}

function ValidateApiVersionSupported() {
    param (
        [Parameter(Mandatory = $true)]
        [VIServer] $server,
        [Parameter(Mandatory = $true)]
        [int] $major,
        [Parameter(Mandatory = $true)]
        [int] $minor
    )

    try {
        $server.GetClient().ConnectivityService.TryValidateApiVersionSupported($major, $minor)
    } catch {
        throw "This operation requires that server '$server' supports at least version '$major.$minor'."
    }
}

function ValidateSameServer() {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [VIServer]
        $ExpectedServer,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $ServerObject
    )

    if(-not $ServerObject.Uid) {
        throw "Object does not have a Uid."
    }

    if((Get-ConnectionUid $ServerObject.Uid) -ne $ExpectedServer.Uid) {
        throw "Object '$($ServerObject) - $($ServerObject.Uid)' is not from the target server '$($ExpectedServer.Uid)'"
    }
}


function Group-ByServer {
    [CmdletBinding()]
    [OutputType([hashtable])]
    param(
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true)]
        [object[]]
        $ServerObjects
    )
    Begin {
        [hashtable] $result = @{}
    }
    Process {
        $ServerObjects | ForEach-Object {
            $connectionId = $UidUtil.GetConnectionUid($_.Uid)

            [List[object]] $list = $null
            if($result.Contains($connectionId)) {
                $list = $result[$connectionId]
            } else {
                $list = [List[object]]::new()
                $result[$connectionId] = $list
            }
            $list.Add($_)
        }
    }
    End {
        return $result
    }
}

# SIG # Begin signature block
# MIIrGgYJKoZIhvcNAQcCoIIrCzCCKwcCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCARNpXBF6lzwCor
# 8/5LVMGJQrd8zPH9NNV8HQLVlzmP+qCCDdowggawMIIEmKADAgECAhAIrUCyYNKc
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
# tKncUjJ1xAAtAExGdCh6VD2U5iYxghyWMIIckgIBATB9MGkxCzAJBgNVBAYTAlVT
# MRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1
# c3RlZCBHNCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEzODQgMjAyMSBDQTECEA7G
# 8rJ2oUagfQ5tk1e14QgwDQYJYIZIAWUDBAIBBQCggZYwGQYJKoZIhvcNAQkDMQwG
# CisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwKgYKKwYB
# BAGCNwIBDDEcMBqhGIAWaHR0cDovL3d3dy52bXdhcmUuY29tLzAvBgkqhkiG9w0B
# CQQxIgQghYwPWnbSRsbAnObZEnuxrzuqsXo4AqwxQW+2gNmyfsEwDQYJKoZIhvcN
# AQEBBQAEggGAsKu0allDQELkYoH11+NNbw9qonISCfEjD+DKeqVWiM45/6VJcDel
# wUsSUs7t3yYFYr7TOlueWVgRPgxQYL02n3cL7/RrAilr1+Y2KPA3BPgZiPZHe8US
# Y/2uItYVkQYLpRQ81ctkNr8rjyeSPoUEtpVSKpK0bqwpOFI0V9yqAyF8h7aJmNWb
# GO450JzWxSH6Kl1/Zz5ZEoilIWA4XVA6o8qIPddjrXTsvu4yTgmUlqDRtJATtpiw
# sqnXmA6iCiqW724jr70a1+b8/a5gTNhSG+N2xDcPNEx1Buoo6T9gP53nxWLemrMe
# IPxPphCP5BTtvXwon5vkFTQlFRNEGnpjk0wcV5ukBYfRs8dMnLbb5Y2hMsgOsa5W
# KlMkl/ggsjrJvc6Q4blYcJhD4kk+1gvzJgdrMj0yHuRQGO3dVtAAvzCQ6RgDdKcn
# MIXFK/bf1oZIHi9hFD5NOvxC6B29FFqN5VFkKcz/vBl8iZVcReyPBErq8rPambpv
# RX3ZYJzbVyVuoYIZ0TCCGc0GCisGAQQBgjcDAwExghm9MIIZuQYJKoZIhvcNAQcC
# oIIZqjCCGaYCAQMxDTALBglghkgBZQMEAgEwgdwGCyqGSIb3DQEJEAEEoIHMBIHJ
# MIHGAgEBBgkrBgEEAaAyAgMwMTANBglghkgBZQMEAgEFAAQgBhsnkiOjjO10gp2Q
# e8huRFF/qqhFg291bTL8OI2hexUCFFu5uObn/wo2q0CUPwBUB7k2TnASGA8yMDIy
# MDQwNDE0MTk1OFowAwIBAaBXpFUwUzELMAkGA1UEBhMCQkUxGTAXBgNVBAoMEEds
# b2JhbFNpZ24gbnYtc2ExKTAnBgNVBAMMIEdsb2JhbHNpZ24gVFNBIGZvciBBZHZh
# bmNlZCAtIEc0oIIVZDCCBlUwggQ9oAMCAQICEAEARmlQpgSp2XDoHdJNQZ8wDQYJ
# KoZIhvcNAQELBQAwWzELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24g
# bnYtc2ExMTAvBgNVBAMTKEdsb2JhbFNpZ24gVGltZXN0YW1waW5nIENBIC0gU0hB
# Mzg0IC0gRzQwHhcNMjEwNTI3MDk1NTIzWhcNMzIwNjI4MDk1NTIyWjBTMQswCQYD
# VQQGEwJCRTEZMBcGA1UECgwQR2xvYmFsU2lnbiBudi1zYTEpMCcGA1UEAwwgR2xv
# YmFsc2lnbiBUU0EgZm9yIEFkdmFuY2VkIC0gRzQwggGiMA0GCSqGSIb3DQEBAQUA
# A4IBjwAwggGKAoIBgQDfMGmYe5cNbqNUtDlfZFl1BCL+Tmlv6Bd0dKV9URgORiAf
# aC665WXWydKRoeyk91Xqqu07zPtim4RCknoyTPn08hz4mNG5MYElra1WZzKm/ocy
# 81zDLWLxTYkMN7R/6yrjYItvbD0x8u3JXYCbKZ1V4OLE/+p2kxgebKmre8keEmHV
# wOeg5viQKTMsuL9uWrLdxwdD0TvbMAu0eMPs6vGiVM9gkzjM92RD9c8IBBZwyLTb
# DtQKigjcu5PBHW7yjJzrITWe/4+8sH7ChDh+5p1keiag8SCxvOHYKiWdGFLkbdRM
# MAp4zC1Gju1XCz95lVCnA7AzgzK3QJ70tJKXEwxQt56qtEFOC5iJzPvEIUSQMo5I
# 8ixLDBfkhFdbpqz7l4P5jWRUwuxqQx7PCnaSshC/7dajIA+10TCOGkCxNufQjnjz
# E8AvC4iQOwhh4w+tR7MOVHCVf6BD1FrG3ReflMsAh2gO4a6T7ixyBBsyF5BL1yuA
# JQUf5TP06MBoKnkXoO8CAwEAAaOCAZswggGXMA4GA1UdDwEB/wQEAwIHgDAWBgNV
# HSUBAf8EDDAKBggrBgEFBQcDCDAdBgNVHQ4EFgQUrn5wgXggFCmt8nj4WQDZzKYk
# Ao4wTAYDVR0gBEUwQzBBBgkrBgEEAaAyAR4wNDAyBggrBgEFBQcCARYmaHR0cHM6
# Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADCBkAYI
# KwYBBQUHAQEEgYMwgYAwOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNp
# Z24uY29tL2NhL2dzdHNhY2FzaGEzODRnNDBDBggrBgEFBQcwAoY3aHR0cDovL3Nl
# Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3N0c2FjYXNoYTM4NGc0LmNydDAf
# BgNVHSMEGDAWgBTqFsZp5+PLV0U5M6TwQL7Qw71lljBBBgNVHR8EOjA4MDagNKAy
# hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2NhL2dzdHNhY2FzaGEzODRnNC5j
# cmwwDQYJKoZIhvcNAQELBQADggIBAH9i6PrZdy9Cb2sP191FWTz0dXoA7L32bw4j
# bS0zQnIUT0SUgb3rjAKITKx/x13Nt8QkmruZAWgKWupFYdOwLNd9oBfuXYDxGuLn
# /LHfHTIEKA82hNcJRi22fsBAFSIaeWFnl7YSj9BPZiwuVCpYBqyZTv11rVQmCmj/
# kif4PLkZbTCBJkyFLPNz3I/g5cpkSntHEUzaotS38eRReuY5sCEHGeDwjLlxcH2R
# 7TSfizGeDcTGPjYrZtbAQdWyI0ki075fiTaMWtbFUKo/Dk5UCbb+DZHZcdifNjw0
# jomDt+TzZkrON5CLXXrqPqPjBwc9lBkUnvqxZ0vrtrK3CG+SlkVdTO4OWVqLZnNh
# RTZKhs5jQxluBjoJRjmQdMZzC15C0c0vImwkJ6cCAlGSjQG0XYXH+MNBdd1kjPLz
# mO7pt4cJp70KEzA3Yh9Z5ylyd2l1eJCwzRw6XGoQhnL3ALIyl1l4nk74s2b9ryv8
# ibZ1opQKN5ITQXXd9T86rqeotELT2ZxREvLyetYr7J5MJdltnJH0HwFPSMfsj/lb
# quz6XBFyYK7sN3GUvlxJiUwpbfNXOxoAV7y+kC5CYYLV3/8AgZZ8AVWTuGJk6AaG
# q1VKbzPF89pYBY3dAfU8VSGF/ns1ecV/svvYrb2d+VUKJGR0YYorlzZfVr3y1+Ds
# fP3565LUMIIGWTCCBEGgAwIBAgINAewckkDe/S5AXXxHdDANBgkqhkiG9w0BAQwF
# ADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMK
# R2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0xODA2MjAwMDAwMDBa
# Fw0zNDEyMTAwMDAwMDBaMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxT
# aWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIFRpbWVzdGFtcGluZyBDQSAt
# IFNIQTM4NCAtIEc0MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA8ALi
# MCP64BvhmnSzr3WDX6lHUsdhOmN8OSN5bXT8MeR0EhmW+s4nYluuB4on7lejxDXt
# szTHrMMM64BmbdEoSsEsu7lw8nKujPeZWl12rr9EqHxBJI6PusVP/zZBq6ct/XhO
# Q4j+kxkX2e4xz7yKO25qxIjw7pf23PMYoEuZHA6HpybhiMmg5ZninvScTD9dW+y2
# 79Jlz0ULVD2xVFMHi5luuFSZiqgxkjvyen38DljfgWrhsGweZYIq1CHHlP5Cljvx
# C7F/f0aYDoc9emXr0VapLr37WD21hfpTmU1bdO1yS6INgjcZDNCr6lrB7w/Vmbk/
# 9E818ZwP0zcTUtklNO2W7/hn6gi+j0l6/5Cx1PcpFdf5DV3Wh0MedMRwKLSAe70q
# m7uE4Q6sbw25tfZtVv6KHQk+JA5nJsf8sg2glLCylMx75mf+pliy1NhBEsFV/W6R
# xbuxTAhLntRCBm8bGNU26mSuzv31BebiZtAOBSGssREGIxnk+wU0ROoIrp1JZxGL
# guWtWoanZv0zAwHemSX5cW7pnF0CTGA8zwKPAf1y7pLxpxLeQhJN7Kkm5XcCrA5X
# DAnRYZ4miPzIsk3bZPBFn7rBP1Sj2HYClWxqjcoiXPYMBOMp+kuwHNM3dITZHWar
# NHOPHn18XpbWPRmwl+qMUJFtr1eGfhA3HWsaFN8CAwEAAaOCASkwggElMA4GA1Ud
# DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdDgQWBBTqFsZp5+PL
# V0U5M6TwQL7Qw71lljAfBgNVHSMEGDAWgBSubAWjkxPioufi1xzWx/B/yGdToDA+
# BggrBgEFBQcBAQQyMDAwLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9iYWxz
# aWduLmNvbS9yb290cjYwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9i
# YWxzaWduLmNvbS9yb290LXI2LmNybDBHBgNVHSAEQDA+MDwGBFUdIAAwNDAyBggr
# BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8w
# DQYJKoZIhvcNAQEMBQADggIBAH/iiNlXZytCX4GnCQu6xLsoGFbWTL/bGwdwxvsL
# Ca0AOmAzHznGFmsZQEklCB7km/fWpA2PHpbyhqIX3kG/T+G8q83uwCOMxoX+SxUk
# +RhE7B/CpKzQss/swlZlHb1/9t6CyLefYdO1RkiYlwJnehaVSttixtCzAsw0SEVV
# 3ezpSp9eFO1yEHF2cNIPlvPqN1eUkRiv3I2ZOBlYwqmhfqJuFSbqtPl/KufnSGRp
# L9KaoXL29yRLdFp9coY1swJXH4uc/LusTN763lNMg/0SsbZJVU91naxvSsguarnK
# iMMSME6yCHOfXqHWmc7pfUuWLMwWaxjN5Fk3hgks4kXWss1ugnWl2o0et1sviC49
# ffHykTAFnM57fKDFrK9RBvARxx0wxVFWYOh8lT0i49UKJFMnl4D6SIknLHniPOWb
# HuOqhIKJPsBK9SH+YhDtHTD89szqSCd8i3VCf2vL86VrlR8EWDQKie2CUOTRe6jJ
# 5r5IqitV2Y23JSAOG1Gg1GOqg+pscmFKyfpDxMZXxZ22PLCLsLkcMe+97xTYFEBs
# IB3CLegLxo1tjLZx7VIh/j72n585Gq6s0i96ILH0rKod4i0UnfqWah3GPMrz2Ry/
# U02kR1l8lcRDQfkl4iwQfoH5DZSnffK1CfXYYHJAUJUg1ENEvvqglecgWbZ4xqRq
# qiKbMIIFRzCCBC+gAwIBAgINAfJAQkDO/SLb6Wxx/DANBgkqhkiG9w0BAQwFADBM
# MSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xv
# YmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0xOTAyMjAwMDAwMDBaFw0y
# OTAzMTgxMDAwMDBaMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2
# MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMIICIjAN
# BgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAlQfoc8pm+ewUyns89w0I8bRFCyyC
# tEjG61s8roO4QZIzFKRvf+kqzMawiGvFtonRxrL/FM5RFCHsSt0bWsbWh+5NOhUG
# 7WRmC5KAykTec5RO86eJf094YwjIElBtQmYvTbl5KE1SGooagLcZgQ5+xIq8ZEwh
# HENo1z08isWyZtWQmrcxBsW+4m0yBqYe+bnrqqO4v76CY1DQ8BiJ3+QPefXqoh8q
# 0nAue+e8k7ttU+JIfIwQBzj/ZrJ3YX7g6ow8qrSk9vOVShIHbf2MsonP0KBhd8hY
# dLDUIzr3XTrKotudCd5dRC2Q8YHNV5L6frxQBGM032uTGL5rNrI55KwkNrfw77Yc
# E1eTtt6y+OKFt3OiuDWqRfLgnTahb1SK8XJWbi6IxVFCRBWU7qPFOJabTk5aC0fz
# BjZJdzC8cTflpuwhCHX85mEWP3fV2ZGXhAps1AJNdMAU7f05+4PyXhShBLAL6f7u
# j+FuC7IIs2FmCWqxBjplllnA8DX9ydoojRoRh3CBCqiadR2eOoYFAJ7bgNYl+dwF
# nidZTHY5W+r5paHYgw/R/98wEfmFzzNI9cptZBQselhP00sIScWVZBpjDnk99bOM
# ylitnEJFeW4OhxlcVLFltr+Mm9wT6Q1vuC7cZ27JixG1hBSKABlwg3mRl5HUGie/
# Nx4yB9gUYzwoTK8CAwEAAaOCASYwggEiMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
# Af8EBTADAQH/MB0GA1UdDgQWBBSubAWjkxPioufi1xzWx/B/yGdToDAfBgNVHSME
# GDAWgBSP8Et/qC5FJK5NUPpjmove4t0bvDA+BggrBgEFBQcBAQQyMDAwLgYIKwYB
# BQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9iYWxzaWduLmNvbS9yb290cjMwNgYDVR0f
# BC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIzLmNy
# bDBHBgNVHSAEQDA+MDwGBFUdIAAwNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cu
# Z2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDQYJKoZIhvcNAQEMBQADggEBAEms
# XsWD81rLYSpNl0oVKZ/kFJCqCfnEep81GIoKMxVtcociTkE/bQqeGK7b4l/8ldEs
# mBQ7jsHwNll5842Bz3T2GKTk4WjP739lWULpylU5vNPFJu5xOPrXIQMPt07ZW2Bq
# Q7R9CdBgYd2q7QBeTjIe4LJsnjyywruY05B2ammtGtyoidpYT9LCizJKzlT7OOk7
# Bwt1ChHbC3wlJ/GsJs8RU+bcxuJhNTL0zt2D4xk668Joo3IAyCQ8TrhTPLEXq+Y1
# LPnTQinmX2ADrEJhprFXajNC3zUxhso+NyvaxNok9U4S8ra5t0fquyCtYRa3oDPj
# LYmnvLM8AX8jGoAJNOkwggNfMIICR6ADAgECAgsEAAAAAAEhWFMIojANBgkqhkiG
# 9w0BAQsFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEG
# A1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0wOTAzMTgx
# MDAwMDBaFw0yOTAzMTgxMDAwMDBaMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
# dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxT
# aWduMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzCV2kHkGeCIW9cCD
# toTKKJ79BXYRxa2IcvxGAkPHsoqdBF8kyy5L4WCCRuFSqwyBR3Bs3WTR6/Usow+C
# PQwrrpfXthSGEHm7OxOAd4wI4UnSamIvH176lmjfiSeVOJ8G1z7JyyZZDXPesMjp
# Jg6DFcbvW4vSBGDKSaYo9mk79svIKJHlnYphVzesdBTcdOA67nIvLpz70Lu/9T0A
# 4QYz6IIrrlOmOhZzjN1BDiA6wLSnoemyT5AuMmDpV8u5BJJoaOU4JmB1sp93/5EU
# 764gSfytQBVI0QIxYRleuJfvrXe3ZJp6v1/BE++bYvsNbOBUaRapA9pu6YOTcXbG
# aYWCFwIDAQABo0IwQDAOBgNVHQ8BAf8EBAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAd
# BgNVHQ4EFgQUj/BLf6guRSSuTVD6Y5qL3uLdG7wwDQYJKoZIhvcNAQELBQADggEB
# AEtA28BQqv7IDO/3llRFSbuWAAlBrLMThoYoBzPKa+Z0uboALa6kCtP18fEPir9z
# Z0qDx0R7eOCvbmxvAymOMzlFw47kuVdsqvwSluxTxi3kJGy5lGP73FNoZ1Y+g7jP
# NSHDyWj+ztrCU6rMkIrp8F1GjJXdelgoGi8d3s0AN0GP7URt11Mol37zZwQeFdeK
# lrTT3kwnpEwbc3N29BeZwh96DuMtCK0KHCz/PKtVDg+Rfjbrw1dJvuEuLXxgi8NB
# URMjnc73MmuUAaiZ5ywzHzo7JdKGQM47LIZ4yWEvFLru21Vv34TuBQlNvSjYcs7T
# YlBlHuuSl4Mx2bO1ykdYP18xggNJMIIDRQIBATBvMFsxCzAJBgNVBAYTAkJFMRkw
# FwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIFRp
# bWVzdGFtcGluZyBDQSAtIFNIQTM4NCAtIEc0AhABAEZpUKYEqdlw6B3STUGfMAsG
# CWCGSAFlAwQCAaCCAS0wGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMCsGCSqG
# SIb3DQEJNDEeMBwwCwYJYIZIAWUDBAIBoQ0GCSqGSIb3DQEBCwUAMC8GCSqGSIb3
# DQEJBDEiBCDr34G4PHu9tk/aWg7/TEvhUao/0TeJBnHv4qMf4jKthTCBsAYLKoZI
# hvcNAQkQAi8xgaAwgZ0wgZowgZcEIBPW6cQg/21OJ1RyjGjneIJlZGfbmhkPgWWX
# 9n+2zMb5MHMwX6RdMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWdu
# IG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIFRpbWVzdGFtcGluZyBDQSAtIFNI
# QTM4NCAtIEc0AhABAEZpUKYEqdlw6B3STUGfMA0GCSqGSIb3DQEBCwUABIIBgEr/
# a0TZiwattbxuZ+cgkyaz49zy1RONzxXyzyjTZ26EztzC/3c9DA+rWOJR3LZLqxGw
# mjDAsTQm/z1cf76WjPneb59t+2M3uNpD41n2e/u7rN0TlMOhJeI03dIF8+dBuf9L
# 9L3HQf8doaI40k759zOBi7rQ3sKKTOkS+URTXun/5tVxqGtmdm8lmtF9sK6kKLkA
# WR9IRg+GsZnvaBigUhnOed+wPGLsdo5Oq9qgXFZPe6dFSkMUvqaB4iAM8F9LXim3
# Pw0FVK6dU7Ox6bGrP+C0fdFXwT+A3M9GIvu3x/lNYvp+CQr91gntGCa8M0Vz2jjh
# NSxVSLIWodbC4fhg66AqA3Uobgp5Y+y5w0YKWtzUWZ3Aq76UAB988eBDgq4K+tWy
# a8N4S86FpNRW1kN/eWZsPI1VJW26m923xlqvOcRQm0rcbpTr4PgWmddUpMNgkE+g
# Zt/XAbCauU3GZldTc0kRdco7D11Y/FfROXoHF0nNgQbaZsabxRvT53py5+IVbQ==
# SIG # End signature block
