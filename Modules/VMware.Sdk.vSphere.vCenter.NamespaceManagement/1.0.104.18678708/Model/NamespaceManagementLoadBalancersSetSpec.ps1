#
# NamespaceManagement Paths
# The vcenter namespace_management package provides services for managing Namespaces.
# Version: v7.0U3
# Contact: powercli@vmware.com
# Generated by OpenAPI Generator: https://openapi-generator.tech
#

<#
.DESCRIPTION

The LoadBalancers.SetSpec encapsulates configuration allowed for setting a new configuration for a load balancer.

.PARAMETER AddressRanges
List of address ranges that will be used to derive frontend IP addresses for L4 virtual servers. At least one range must be provided. A set operation only allows for addition of new IP ranges to the existing list of IP ranges.
.PARAMETER Provider
No description available.
.PARAMETER HaProxyConfigSetSpec
No description available.
.PARAMETER AviConfigSetSpec
No description available.
.OUTPUTS

NamespaceManagementLoadBalancersSetSpec<PSCustomObject>

.LINK

Online Version: https://developer.vmware.com/docs/vsphere-automation/latest/vcenter/data-structures/NamespaceManagement/LoadBalancers/SetSpec/
#>

function Initialize-NamespaceManagementLoadBalancersSetSpec {
    [CmdletBinding(HelpURI = "https://developer.vmware.com/docs/vsphere-automation/latest/vcenter/data-structures/NamespaceManagement/LoadBalancers/SetSpec/")]
    Param (
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true)]
        [PSCustomObject[]]
        ${AddressRanges},
        [Parameter(Mandatory = $true, Position = 1, ValueFromPipelineByPropertyName = $true)]
        [ValidateSet("HA_PROXY", "AVI")]
        ${Provider},
        [Parameter(Mandatory = $false, Position = 2, ValueFromPipelineByPropertyName = $true)]
        [PSTypeName("NamespaceManagementLoadBalancersHAProxyConfigSetSpec")]
        [PSCustomObject]
        ${HaProxyConfigSetSpec},
        [Parameter(Mandatory = $false, Position = 3, ValueFromPipelineByPropertyName = $true)]
        [PSTypeName("NamespaceManagementLoadBalancersAviConfigSetSpec")]
        [PSCustomObject]
        ${AviConfigSetSpec}
    )

    Process {
        'Creating PSCustomObject: VMware.Sdk.vSphere.vCenter.NamespaceManagement => vSphereNamespaceManagementLoadBalancersSetSpec' | Write-Debug

        if ($AddressRanges -eq $null) {
            throw "invalid value for 'AddressRanges', 'AddressRanges' cannot be null."
        }

        if ($Provider -eq $null) {
            throw "invalid value for 'Provider', 'Provider' cannot be null."
        }


        $PSO = [PSCustomObject]@{
            "PSTypeName" = "NamespaceManagementLoadBalancersSetSpec"
            "address_ranges" = ${AddressRanges}
            "provider" = ${Provider}
            "ha_proxy_config_set_spec" = ${HaProxyConfigSetSpec}
            "avi_config_set_spec" = ${AviConfigSetSpec}
        }


        return $PSO
    }
}


# SIG # Begin signature block
# MIIexgYJKoZIhvcNAQcCoIIetzCCHrMCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCACBkv6NSNUHRRo
# gNfB7TYcrgiF4iuV0iD0zvdxid46F6CCDdowggawMIIEmKADAgECAhAIrUCyYNKc
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
# CQQxIgQgSwM4HQDF0YVeKK9a5uDdrrH45MA1Bn82DyjMbFJi8hcwDQYJKoZIhvcN
# AQEBBQAEggGAYEMMTtMCOMzS21LmQBhcQ/w6XalVvKZJLibBH78ftP7OYIUMCtLR
# G7wDe8xx72QVzcsX7CfIKad1E5/n6avEmgy28K1/4GW91pqj5aGpvSTcnkcXGmsI
# gckXCIpq8WhSDGhtmq2mLTX6Z4k1/HRDIpKkDPk8tuxKGy4ioPlW0V6I5O/rSpVR
# Q7d1DwQxnhMkF/EZ9nAkmsVkUSpwsPi6l6z/4/3GgouIGyMphc+fcmIyzIrzFRlf
# 87uSQbw8BDdC9Dhp1N2hEI7VkllOi6+6FXvWSStrayiH2BEyAT9Yctg9JIPL+SBp
# miRtoabjAn4pvT/ZA8+VpIxc+sDmrMzExK3iMN/G49gDL+uCnWKqhH0vo7hpM6Sc
# VgjC6pHNlfJPW+GHq7sjLC1cWvMH3/tMorrPxgVpz5ixdS49fk+L1M1JUNwVq56E
# C8kh/T4o7Au8NnjNcaiEyiSskdkzgP+Ui0Htm1OmpohlCFeQeQ8k1SkbpqTxOySS
# JKf8cCAqmMoIoYINfTCCDXkGCisGAQQBgjcDAwExgg1pMIINZQYJKoZIhvcNAQcC
# oIINVjCCDVICAQMxDzANBglghkgBZQMEAgEFADB3BgsqhkiG9w0BCRABBKBoBGYw
# ZAIBAQYJYIZIAYb9bAcBMDEwDQYJYIZIAWUDBAIBBQAEION60q8V8S5I/yj/lMjz
# kyDBBeyFk/QVym/EfIjH2GbXAhBMSRdTE79GnbKvCW226SRfGA8yMDIxMDkyNDE2
# MDc0NFqgggo3MIIE/jCCA+agAwIBAgIQDUJK4L46iP9gQCHOFADw3TANBgkqhkiG
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
# DxcNMjEwOTI0MTYwNzQ0WjArBgsqhkiG9w0BCRACDDEcMBowGDAWBBTh14Ko4ZG+
# 72vKFpG1qrSUpiSb8zAvBgkqhkiG9w0BCQQxIgQgW3ua+6ZQtq8FZugfNMP7NVRN
# OYpQta21ghgC75s8cQQwNwYLKoZIhvcNAQkQAi8xKDAmMCQwIgQgsxCQBrwK2YMH
# kVcp4EQDQVyD4ykrYU8mlkyNNXHs9akwDQYJKoZIhvcNAQEBBQAEggEAiar5zZ1Y
# 8PT92H87pOTbva1FCf0e3dqDV2ZM7gv7yuLc4YJlyjhF8nMiPIF1n7AeYay7BV6g
# rVOyJqXt4hBDaOWCmvlLxYj166uuAdAMNz7l9MzylSu+iBGqLeflKSwd7zldQmT+
# GCQmCzrzDXcykuz3WLwk3dUm/ApUXvU/ZRgrnIUFa5VzCj3bB+6ksnfo2jljrHDG
# QgdpelynF4t7ytuZavqesxGaBi6YXUsvSHkSEJk085RJ730txs/PAXuP0WAqSviK
# T0OzUsCAQgtOkBgavGBUfUuwPhu8XpSwdF377N4r01RLcjozZjidEemJmQM/F+9F
# pt+hu9Abx64/Kw==
# SIG # End signature block
