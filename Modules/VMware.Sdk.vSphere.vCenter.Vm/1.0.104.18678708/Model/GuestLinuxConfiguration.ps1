#
# Vm Paths
# The vcenter vm package provides services for managing virtual machines.
# Version: v7.0U3
# Contact: powercli@vmware.com
# Generated by OpenAPI Generator: https://openapi-generator.tech
#

<#
.DESCRIPTION

Guest customization Settings to customize a Linux guest operating system.   The LinuxConfiguration structure contains settings that identify a Linux machine in the same way that the WindowsConfiguration structure identifies a Windows machine. 

.PARAMETER Hostname
No description available.
.PARAMETER Domain
The fully qualified domain name.
.PARAMETER TimeZone
The case-sensitive time zone, such as Europe/Sofia. Valid time zone values are based on the tz (time zone) database used by Linux. The values are strings (string) in the form ""Area/Location,"" in which Area is a continent or ocean name, and Location is the city, island, or other regional designation.   See the https://kb.vmware.com/kb/2145518 for a list of supported time zones for different versions in Linux.  If unset, time zone is not modified inside guest operating system.
.PARAMETER ScriptText
The script to run before and after Linux guest customization.  The max size of the script is 1500 bytes. As long as the script (shell, perl, python...) has the right ""#!"" in the header, it is supported. The caller should not assume any environment variables when the script is run.   The script is invoked by the customization engine using the command line: 1) with argument ""precustomization"" before customization, 2) with argument ""postcustomization"" after customization. The script should parse this argument and implement pre-customization or post-customization task code details in the corresponding block.    A Linux shell script example:     #!/bin/sh  if [ x$1 == x""precustomization"" ]; then  echo ""Do Precustomization tasks""  #code for pre-customization actions...  elif [ x$1 == x""postcustomization"" ]; then  echo ""Do Postcustomization tasks""  #code for post-customization actions...  fi    If unset, no script will be executed.
.OUTPUTS

GuestLinuxConfiguration<PSCustomObject>

.LINK

Online Version: https://developer.vmware.com/docs/vsphere-automation/latest/vcenter/data-structures/Guest/LinuxConfiguration/
#>

function Initialize-GuestLinuxConfiguration {
    [CmdletBinding(HelpURI = "https://developer.vmware.com/docs/vsphere-automation/latest/vcenter/data-structures/Guest/LinuxConfiguration/")]
    Param (
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [PSTypeName("GuestHostnameGenerator")]
        [PSCustomObject]
        ${Hostname},
        [Parameter(Mandatory = $true, Position = 1, ValueFromPipelineByPropertyName = $true)]
        [ValidateScript({ $_ -is [string] })]
        ${Domain},
        [Parameter(Mandatory = $false, Position = 2, ValueFromPipelineByPropertyName = $true)]
        [ValidateScript({ $_ -is [string] })]
        ${TimeZone},
        [Parameter(Mandatory = $false, Position = 3, ValueFromPipelineByPropertyName = $true)]
        [ValidateScript({ $_ -is [string] })]
        ${ScriptText}
    )

    Process {
        'Creating PSCustomObject: VMware.Sdk.vSphere.vCenter.Vm => vSphereGuestLinuxConfiguration' | Write-Debug

        if ($Hostname -eq $null) {
            throw "invalid value for 'Hostname', 'Hostname' cannot be null."
        }


        $PSO = [PSCustomObject]@{
            "PSTypeName" = "GuestLinuxConfiguration"
            "hostname" = ${Hostname}
            "domain" = ${Domain}
            "time_zone" = ${TimeZone}
            "script_text" = ${ScriptText}
        }


        return $PSO
    }
}


# SIG # Begin signature block
# MIIrIAYJKoZIhvcNAQcCoIIrETCCKw0CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDcZCk/CZ8ViQ7p
# lRJSFgpkTXDq5E0W2MpWrQ7MOV0p3aCCDdowggawMIIEmKADAgECAhAIrUCyYNKc
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
# tKncUjJ1xAAtAExGdCh6VD2U5iYxghycMIIcmAIBATB9MGkxCzAJBgNVBAYTAlVT
# MRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1
# c3RlZCBHNCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEzODQgMjAyMSBDQTECEA7G
# 8rJ2oUagfQ5tk1e14QgwDQYJYIZIAWUDBAIBBQCggZYwGQYJKoZIhvcNAQkDMQwG
# CisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwKgYKKwYB
# BAGCNwIBDDEcMBqhGIAWaHR0cDovL3d3dy52bXdhcmUuY29tLzAvBgkqhkiG9w0B
# CQQxIgQgvl9huWF0pk3gQfP+38NUGQi/C/ywq0TxyRbYmKfwqEEwDQYJKoZIhvcN
# AQEBBQAEggGAgApA8wgeK5jyfIp7bYx+cRInbONQEB+aUbI2Fwtn1JIR4pfstZB/
# AxWJVS4A4+p/gKlmDwsDP25xNrdpNETUryDDVRnbXowHIslmPUzenLI8mvK73lut
# 8g3ezeQS4Cg8wgUy5TGi7xfmc2AN9IjrmsE5SSzLnbQJYODCWfUPfDxf7joByxUi
# zygK4nsQy94mEKiZPJDpRZAXSfC/il0uKmo8Xg7cw3K1bXeMcyj+8DZm6j7lk9+o
# BP3gspJrrYjG2fWgc24Dm2LSBZ/WtjNK3waAVNfukSWbDQRIhSbsmmtRAtf9j8b/
# EYb0hgX2dWBvave2zAKPTOYKXYo8xTl/dDJ9GYqjHpVR66T8hTcRMljcVD4xLlOI
# 1rWC+jqaePggrsdYdLcTzWeSr5jhLcQpsUgonYfrotETZQ6ZoirGiPfTKjBL+9zq
# YtDcamw9KDwJ3QdgJY2c6Zo6FGTSNN0EPGn/PD41VVN0AnY12/8puhxzIowis6Wq
# sck9pmOhsaXEoYIZ1zCCGdMGCisGAQQBgjcDAwExghnDMIIZvwYJKoZIhvcNAQcC
# oIIZsDCCGawCAQMxDzANBglghkgBZQMEAgEFADCB3AYLKoZIhvcNAQkQAQSggcwE
# gckwgcYCAQEGCSsGAQQBoDICAzAxMA0GCWCGSAFlAwQCAQUABCBzANFuIGEbseyB
# 9TVWZEhz/BZc+5YMYZ6DbiI6pWRAugIULb9PwuFLlTfxJzwXxm2y1tpAcxIYDzIw
# MjEwOTI0MTYwOTU5WjADAgEBoFekVTBTMQswCQYDVQQGEwJCRTEZMBcGA1UECgwQ
# R2xvYmFsU2lnbiBudi1zYTEpMCcGA1UEAwwgR2xvYmFsc2lnbiBUU0EgZm9yIEFk
# dmFuY2VkIC0gRzSgghVkMIIGVTCCBD2gAwIBAgIQAQBGaVCmBKnZcOgd0k1BnzAN
# BgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2ln
# biBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBUaW1lc3RhbXBpbmcgQ0EgLSBT
# SEEzODQgLSBHNDAeFw0yMTA1MjcwOTU1MjNaFw0zMjA2MjgwOTU1MjJaMFMxCzAJ
# BgNVBAYTAkJFMRkwFwYDVQQKDBBHbG9iYWxTaWduIG52LXNhMSkwJwYDVQQDDCBH
# bG9iYWxzaWduIFRTQSBmb3IgQWR2YW5jZWQgLSBHNDCCAaIwDQYJKoZIhvcNAQEB
# BQADggGPADCCAYoCggGBAN8waZh7lw1uo1S0OV9kWXUEIv5OaW/oF3R0pX1RGA5G
# IB9oLrrlZdbJ0pGh7KT3Veqq7TvM+2KbhEKSejJM+fTyHPiY0bkxgSWtrVZnMqb+
# hzLzXMMtYvFNiQw3tH/rKuNgi29sPTHy7cldgJspnVXg4sT/6naTGB5sqat7yR4S
# YdXA56Dm+JApMyy4v25ast3HB0PRO9swC7R4w+zq8aJUz2CTOMz3ZEP1zwgEFnDI
# tNsO1AqKCNy7k8EdbvKMnOshNZ7/j7ywfsKEOH7mnWR6JqDxILG84dgqJZ0YUuRt
# 1EwwCnjMLUaO7VcLP3mVUKcDsDODMrdAnvS0kpcTDFC3nqq0QU4LmInM+8QhRJAy
# jkjyLEsMF+SEV1umrPuXg/mNZFTC7GpDHs8KdpKyEL/t1qMgD7XRMI4aQLE259CO
# ePMTwC8LiJA7CGHjD61Hsw5UcJV/oEPUWsbdF5+UywCHaA7hrpPuLHIEGzIXkEvX
# K4AlBR/lM/TowGgqeReg7wIDAQABo4IBmzCCAZcwDgYDVR0PAQH/BAQDAgeAMBYG
# A1UdJQEB/wQMMAoGCCsGAQUFBwMIMB0GA1UdDgQWBBSufnCBeCAUKa3yePhZANnM
# piQCjjBMBgNVHSAERTBDMEEGCSsGAQQBoDIBHjA0MDIGCCsGAQUFBwIBFiZodHRw
# czovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMIGQ
# BggrBgEFBQcBAQSBgzCBgDA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFs
# c2lnbi5jb20vY2EvZ3N0c2FjYXNoYTM4NGc0MEMGCCsGAQUFBzAChjdodHRwOi8v
# c2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc3RzYWNhc2hhMzg0ZzQuY3J0
# MB8GA1UdIwQYMBaAFOoWxmnn48tXRTkzpPBAvtDDvWWWMEEGA1UdHwQ6MDgwNqA0
# oDKGMGh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vY2EvZ3N0c2FjYXNoYTM4NGc0
# LmNybDANBgkqhkiG9w0BAQsFAAOCAgEAf2Lo+tl3L0Jvaw/X3UVZPPR1egDsvfZv
# DiNtLTNCchRPRJSBveuMAohMrH/HXc23xCSau5kBaApa6kVh07As132gF+5dgPEa
# 4uf8sd8dMgQoDzaE1wlGLbZ+wEAVIhp5YWeXthKP0E9mLC5UKlgGrJlO/XWtVCYK
# aP+SJ/g8uRltMIEmTIUs83Pcj+DlymRKe0cRTNqi1Lfx5FF65jmwIQcZ4PCMuXFw
# fZHtNJ+LMZ4NxMY+Nitm1sBB1bIjSSLTvl+JNoxa1sVQqj8OTlQJtv4Nkdlx2J82
# PDSOiYO35PNmSs43kItdeuo+o+MHBz2UGRSe+rFnS+u2srcIb5KWRV1M7g5ZWotm
# c2FFNkqGzmNDGW4GOglGOZB0xnMLXkLRzS8ibCQnpwICUZKNAbRdhcf4w0F13WSM
# 8vOY7um3hwmnvQoTMDdiH1nnKXJ3aXV4kLDNHDpcahCGcvcAsjKXWXieTvizZv2v
# K/yJtnWilAo3khNBdd31Pzqup6i0QtPZnFES8vJ61ivsnkwl2W2ckfQfAU9Ix+yP
# +Vuq7PpcEXJgruw3cZS+XEmJTClt81c7GgBXvL6QLkJhgtXf/wCBlnwBVZO4YmTo
# BoarVUpvM8Xz2lgFjd0B9TxVIYX+ezV5xX+y+9itvZ35VQokZHRhiiuXNl9WvfLX
# 4Ox8/fnrktQwggZZMIIEQaADAgECAg0B7BySQN79LkBdfEd0MA0GCSqGSIb3DQEB
# DAUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQK
# EwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTE4MDYyMDAwMDAw
# MFoXDTM0MTIxMDAwMDAwMFowWzELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
# bFNpZ24gbnYtc2ExMTAvBgNVBAMTKEdsb2JhbFNpZ24gVGltZXN0YW1waW5nIENB
# IC0gU0hBMzg0IC0gRzQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDw
# AuIwI/rgG+GadLOvdYNfqUdSx2E6Y3w5I3ltdPwx5HQSGZb6zidiW64HiifuV6PE
# Ne2zNMeswwzrgGZt0ShKwSy7uXDycq6M95laXXauv0SofEEkjo+6xU//NkGrpy39
# eE5DiP6TGRfZ7jHPvIo7bmrEiPDul/bc8xigS5kcDoenJuGIyaDlmeKe9JxMP11b
# 7Lbv0mXPRQtUPbFUUweLmW64VJmKqDGSO/J6ffwOWN+BauGwbB5lgirUIceU/kKW
# O/ELsX9/RpgOhz16ZevRVqkuvftYPbWF+lOZTVt07XJLog2CNxkM0KvqWsHvD9WZ
# uT/0TzXxnA/TNxNS2SU07Zbv+GfqCL6PSXr/kLHU9ykV1/kNXdaHQx50xHAotIB7
# vSqbu4ThDqxvDbm19m1W/oodCT4kDmcmx/yyDaCUsLKUzHvmZ/6mWLLU2EESwVX9
# bpHFu7FMCEue1EIGbxsY1TbqZK7O/fUF5uJm0A4FIayxEQYjGeT7BTRE6giunUln
# EYuC5a1ahqdm/TMDAd6ZJflxbumcXQJMYDzPAo8B/XLukvGnEt5CEk3sqSbldwKs
# DlcMCdFhniaI/MiyTdtk8EWfusE/VKPYdgKVbGqNyiJc9gwE4yn6S7Ac0zd0hNkd
# Zqs0c48efXxeltY9GbCX6oxQkW2vV4Z+EDcdaxoU3wIDAQABo4IBKTCCASUwDgYD
# VR0PAQH/BAQDAgGGMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFOoWxmnn
# 48tXRTkzpPBAvtDDvWWWMB8GA1UdIwQYMBaAFK5sBaOTE+Ki5+LXHNbH8H/IZ1Og
# MD4GCCsGAQUFBwEBBDIwMDAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2Jh
# bHNpZ24uY29tL3Jvb3RyNjA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmds
# b2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMEcGA1UdIARAMD4wPAYEVR0gADA0MDIG
# CCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5
# LzANBgkqhkiG9w0BAQwFAAOCAgEAf+KI2VdnK0JfgacJC7rEuygYVtZMv9sbB3DG
# +wsJrQA6YDMfOcYWaxlASSUIHuSb99akDY8elvKGohfeQb9P4byrze7AI4zGhf5L
# FST5GETsH8KkrNCyz+zCVmUdvX/23oLIt59h07VGSJiXAmd6FpVK22LG0LMCzDRI
# RVXd7OlKn14U7XIQcXZw0g+W8+o3V5SRGK/cjZk4GVjCqaF+om4VJuq0+X8q5+dI
# ZGkv0pqhcvb3JEt0Wn1yhjWzAlcfi5z8u6xM3vreU0yD/RKxtklVT3WdrG9KyC5q
# ucqIwxIwTrIIc59eodaZzul9S5YszBZrGM3kWTeGCSziRdayzW6CdaXajR63Wy+I
# Lj198fKRMAWcznt8oMWsr1EG8BHHHTDFUVZg6HyVPSLj1QokUyeXgPpIiScseeI8
# 5Zse46qEgok+wEr1If5iEO0dMPz2zOpIJ3yLdUJ/a8vzpWuVHwRYNAqJ7YJQ5NF7
# qMnmvkiqK1XZjbclIA4bUaDUY6qD6mxyYUrJ+kPExlfFnbY8sIuwuRwx773vFNgU
# QGwgHcIt6AvGjW2MtnHtUiH+PvafnzkarqzSL3ogsfSsqh3iLRSd+pZqHcY8yvPZ
# HL9TTaRHWXyVxENB+SXiLBB+gfkNlKd98rUJ9dhgckBQlSDUQ0S++qCV5yBZtnjG
# pGqqIpswggVHMIIEL6ADAgECAg0B8kBCQM79ItvpbHH8MA0GCSqGSIb3DQEBDAUA
# MEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMwEQYDVQQKEwpH
# bG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTE5MDIyMDAwMDAwMFoX
# DTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0g
# UjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggIi
# MA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
# LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06
# FQbtZGYLkoDKRN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7Eirxk
# TCEcQ2jXPTyKxbJm1ZCatzEGxb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqi
# HyrScC5757yTu21T4kh8jBAHOP9msndhfuDqjDyqtKT285VKEgdt/Yyyic/QoGF3
# yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MYvms2sjnkrCQ2t/Dv
# thwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptOTloL
# R/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp
# /u6P4W4LsgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX5
# 3AWeJ1lMdjlb6vmlodiDD9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31
# s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPpDW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQa
# J783HjIH2BRjPChMrwIDAQABo4IBJjCCASIwDgYDVR0PAQH/BAQDAgEGMA8GA1Ud
# EwEB/wQFMAMBAf8wHQYDVR0OBBYEFK5sBaOTE+Ki5+LXHNbH8H/IZ1OgMB8GA1Ud
# IwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MD4GCCsGAQUFBwEBBDIwMDAuBggr
# BgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3RyMzA2BgNV
# HR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjMu
# Y3JsMEcGA1UdIARAMD4wPAYEVR0gADA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3
# dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG9w0BAQwFAAOCAQEA
# SaxexYPzWsthKk2XShUpn+QUkKoJ+cR6nzUYigozFW1yhyJOQT9tCp4YrtviX/yV
# 0SyYFDuOwfA2WXnzjYHPdPYYpOThaM/vf2VZQunKVTm808Um7nE4+tchAw+3Ttlb
# YGpDtH0J0GBh3artAF5OMh7gsmyePLLCu5jTkHZqaa0a3KiJ2lhP0sKLMkrOVPs4
# 6TsHC3UKEdsLfCUn8awmzxFT5tzG4mE1MvTO3YPjGTrrwmijcgDIJDxOuFM8sRer
# 5jUs+dNCKeZfYAOsQmGmsVdqM0LfNTGGyj43K9rE2iT1ThLytrm3R+q7IK1hFreg
# M+Mtiae8szwBfyMagAk06TCCA18wggJHoAMCAQICCwQAAAAAASFYUwiiMA0GCSqG
# SIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMw
# EQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5MDMx
# ODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBS
# b290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
# bFNpZ24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1
# wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0EXyTLLkvhYIJG4VKrDIFHcGzdZNHr9Syj
# D4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+JJ5U4nwbXPsnLJlkNc96w
# yOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8unPvQu7/1
# PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/
# kRTvriBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5Nx
# dsZphYIXAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/
# MB0GA1UdDgQWBBSP8Et/qC5FJK5NUPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOC
# AQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigHM8pr5nS5ugAtrqQK0/Xx8Q+K
# v3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmUY/vcU2hnVj6D
# uM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
# 14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCL
# w0FREyOdzvcya5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhy
# ztNiUGUe65KXgzHZs7XKR1g/XzGCA00wggNJAgEBMG8wWzELMAkGA1UEBhMCQkUx
# GTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExMTAvBgNVBAMTKEdsb2JhbFNpZ24g
# VGltZXN0YW1waW5nIENBIC0gU0hBMzg0IC0gRzQCEAEARmlQpgSp2XDoHdJNQZ8w
# DQYJYIZIAWUDBAIBBQCgggEvMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAt
# BgkqhkiG9w0BCTQxIDAeMA0GCWCGSAFlAwQCAQUAoQ0GCSqGSIb3DQEBCwUAMC8G
# CSqGSIb3DQEJBDEiBCD2xULGz+Xsd/U2thcyHK9rUfgyqOmOHDJ3xlGEBYsI/zCB
# sAYLKoZIhvcNAQkQAi8xgaAwgZ0wgZowgZcEIBPW6cQg/21OJ1RyjGjneIJlZGfb
# mhkPgWWX9n+2zMb5MHMwX6RdMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9i
# YWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIFRpbWVzdGFtcGluZyBD
# QSAtIFNIQTM4NCAtIEc0AhABAEZpUKYEqdlw6B3STUGfMA0GCSqGSIb3DQEBCwUA
# BIIBgBL48GOiQJdU8aE1q4+LWFPFxfhHEaGxlbMMdpzusJfsINNMbcE2IGk086Yf
# c3VOprXQ9kbxZ7ED/2DUcstNNMQSLg3vsN+2S8EZ2zQ39uAoCoDVqdxzyEwhfL4c
# wT6pe4e8/K0xbUrXR/aO/2XDfbgnncz8/3ChuW4m+0JlyOriws9VkpOOO6S8Dtva
# tE2kDJ/0FUCpq5hztSxwOCoxJq/KUk5yA4DjlGMCcZoZStU/SpVibGEH57dHkNdh
# bnYw4mSZnfg7F0w1bTzjMrLFWoueTABny0eULxaScozEP1SlXiatzOM60Q9oSiNS
# b0+ZpjI5i9F8flqQibok9EUGg0wmar2nOqMOHu1A9oNHTD+92iJRoIeb2Xo7w8qG
# Ju7tmOsYCd0ev7X73WR1CO6y18JaqaSFJ4b3BsHNhGBv/PQETWVBIS9hVn1KT7v7
# up2H60k2/cuUtqv/boNY8l8SCZNAuFT6Sf5Kw71v/AwhQ5c5Go5uLNGd8bnv5T7s
# OYLX6w==
# SIG # End signature block