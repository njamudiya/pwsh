using namespace System.Security.Cryptography.X509Certificates
using namespace VMware.VimAutomation.Sdk.Util10.Cryptography

function Resolve-TrustChain {
    [CmdletBinding()]
    [OutputType([System.Security.Cryptography.X509Certificates.X509Certificate2])]
    Param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true
        )]
        [string]
        $TrustChainPem)
    Process {
        [string] $endLabel = "-----END CERTIFICATE-----"
        [int] $index = 0
        while($index -lt $TrustChainPem.Length) {
            [int] $startLabelIndex = $TrustChainPem.IndexOf("-----BEGIN CERTIFICATE-----", $index)
            if($startLabelIndex -lt 0) {
                # no more certificates found in the PEM
                break
            }

            [int] $endLabelIndex = $TrustChainPem.IndexOf($endLabel, $startLabelIndex)
            if($endLabelIndex -lt 0) {
                # no matching end certificate label found
                throw "PEM format error: -----END CERTIFICATE----- not found matching a -----BEGIN CERTIFICATE----- at position $startLabelIndex"
            }

            $index = $endLabelIndex + $endLabel.Length
            $certificatePem = $TrustChainPem.Substring($startLabelIndex, $index - $startLabelIndex)

            [CertificateUtil]::PemToCertificate($certificatePem) | Write-Output
        }

    }
}

# SIG # Begin signature block
# MIIi+wYJKoZIhvcNAQcCoIIi7DCCIugCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCP4g7AXz8ec4aG
# cyVyvwDX11i+WJ+DOBkSEoTFvsPKvaCCDdowggawMIIEmKADAgECAhAIrUCyYNKc
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
# tKncUjJ1xAAtAExGdCh6VD2U5iYxghR3MIIUcwIBATB9MGkxCzAJBgNVBAYTAlVT
# MRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1
# c3RlZCBHNCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEzODQgMjAyMSBDQTECEA7G
# 8rJ2oUagfQ5tk1e14QgwDQYJYIZIAWUDBAIBBQCggZYwGQYJKoZIhvcNAQkDMQwG
# CisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwKgYKKwYB
# BAGCNwIBDDEcMBqhGIAWaHR0cDovL3d3dy52bXdhcmUuY29tLzAvBgkqhkiG9w0B
# CQQxIgQgl9cuH/QoEjt7DRarlIydvv26l7Zq8wA8SOAtjLWEA4AwDQYJKoZIhvcN
# AQEBBQAEggGAaa9ByfnJKqrCixSJNfQUfhnp25EvJaebkmEo1bZkj3KHZXqgpbCZ
# HPBLalEEVwaH1lMsOT493MJ9D+VchiERaMvItAD+qHQlyA6BydNU++EAJdVTnjrA
# xfOCwLwQ4GstgALsBio4RPrWjSfIGBI8J20SQ9WBrkUdDIuKOevYrYr5vj//nSQq
# pIcouW6fYotwBppgjIRZjioGbc76Rhyjz1UETYN0XU/JWXB7dEA+lWtx0gi0zv/j
# 57Ssx8h6zIgmbRftVmMSkpP1GonBxoMxLyq+jC1FSuVLCbIuFXDObqPb6gz4F0Ba
# YssrH5o8Ckxn7LSqEtuT87IgI1jmaYxiP6JR/XgNGogTClclvTogyumTgS+eS+se
# fwSbTxEFRa8X6kmAy2Wy7L0n2tzIw+gQPTf6TF6JtrE0Fwrs9oW8VqXSAVakdMLM
# JRsDvxToYR0K3DTPwwIAIjExWusJpuyuHdPPOkFhqPx3/zLRG9QoSvnxxf5NCwqo
# /CYYia6RcCZtoYIRsjCCEa4GCisGAQQBgjcDAwExghGeMIIRmgYJKoZIhvcNAQcC
# oIIRizCCEYcCAQMxDzANBglghkgBZQMEAgEFADB3BgsqhkiG9w0BCRABBKBoBGYw
# ZAIBAQYJYIZIAYb9bAcBMDEwDQYJYIZIAWUDBAIBBQAEIGLssrBo7Pdm80JS+WCv
# fioZigD52Y0BKxTkkpkhmoWWAhAaZAhbd+n6mY4bg967R7AJGA8yMDIyMDQwNDE0
# MjAzM1qggg18MIIGxjCCBK6gAwIBAgIQCnpKiJ7JmUKQBmM4TYaXnTANBgkqhkiG
# 9w0BAQsFADBjMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4x
# OzA5BgNVBAMTMkRpZ2lDZXJ0IFRydXN0ZWQgRzQgUlNBNDA5NiBTSEEyNTYgVGlt
# ZVN0YW1waW5nIENBMB4XDTIyMDMyOTAwMDAwMFoXDTMzMDMxNDIzNTk1OVowTDEL
# MAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMSQwIgYDVQQDExtE
# aWdpQ2VydCBUaW1lc3RhbXAgMjAyMiAtIDIwggIiMA0GCSqGSIb3DQEBAQUAA4IC
# DwAwggIKAoICAQC5KpYjply8X9ZJ8BWCGPQz7sxcbOPgJS7SMeQ8QK77q8TjeF1+
# XDbq9SWNQ6OB6zhj+TyIad480jBRDTEHukZu6aNLSOiJQX8Nstb5hPGYPgu/CoQS
# cWyhYiYB087DbP2sO37cKhypvTDGFtjavOuy8YPRn80JxblBakVCI0Fa+GDTZSw+
# fl69lqfw/LH09CjPQnkfO8eTB2ho5UQ0Ul8PUN7UWSxEdMAyRxlb4pguj9DKP//G
# Z888k5VOhOl2GJiZERTFKwygM9tNJIXogpThLwPuf4UCyYbh1RgUtwRF8+A4vaK9
# enGY7BXn/S7s0psAiqwdjTuAaP7QWZgmzuDtrn8oLsKe4AtLyAjRMruD+iM82f/S
# jLv3QyPf58NaBWJ+cCzlK7I9Y+rIroEga0OJyH5fsBrdGb2fdEEKr7mOCdN0oS+w
# VHbBkE+U7IZh/9sRL5IDMM4wt4sPXUSzQx0jUM2R1y+d+/zNscGnxA7E70A+GToC
# 1DGpaaBJ+XXhm+ho5GoMj+vksSF7hmdYfn8f6CvkFLIW1oGhytowkGvub3XAsDYm
# sgg7/72+f2wTGN/GbaR5Sa2Lf2GHBWj31HDjQpXonrubS7LitkE956+nGijJrWGw
# oEEYGU7tR5thle0+C2Fa6j56mJJRzT/JROeAiylCcvd5st2E6ifu/n16awIDAQAB
# o4IBizCCAYcwDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/
# BAwwCgYIKwYBBQUHAwgwIAYDVR0gBBkwFzAIBgZngQwBBAIwCwYJYIZIAYb9bAcB
# MB8GA1UdIwQYMBaAFLoW2W1NhS9zKXaaL3WMaiCPnshvMB0GA1UdDgQWBBSNZLeJ
# If5WWESEYafqbxw2j92vDTBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsMy5k
# aWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkRzRSU0E0MDk2U0hBMjU2VGltZVN0
# YW1waW5nQ0EuY3JsMIGQBggrBgEFBQcBAQSBgzCBgDAkBggrBgEFBQcwAYYYaHR0
# cDovL29jc3AuZGlnaWNlcnQuY29tMFgGCCsGAQUFBzAChkxodHRwOi8vY2FjZXJ0
# cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkRzRSU0E0MDk2U0hBMjU2VGlt
# ZVN0YW1waW5nQ0EuY3J0MA0GCSqGSIb3DQEBCwUAA4ICAQANLSN0ptH1+OpLmT8B
# 5PYM5K8WndmzjJeCKZxDbwEtqzi1cBG/hBmLP13lhk++kzreKjlaOU7YhFmlvBuY
# quhs79FIaRk4W8+JOR1wcNlO3yMibNXf9lnLocLqTHbKodyhK5a4m1WpGmt90fUC
# CU+C1qVziMSYgN/uSZW3s8zFp+4O4e8eOIqf7xHJMUpYtt84fMv6XPfkU79uCnx+
# 196Y1SlliQ+inMBl9AEiZcfqXnSmWzWSUHz0F6aHZE8+RokWYyBry/J70DXjSnBI
# qbbnHWC9BCIVJXAGcqlEO2lHEdPu6cegPk8QuTA25POqaQmoi35komWUEftuMvH1
# uzitzcCTEdUyeEpLNypM81zctoXAu3AwVXjWmP5UbX9xqUgaeN1Gdy4besAzivhK
# KIwSqHPPLfnTI/KeGeANlCig69saUaCVgo4oa6TOnXbeqXOqSGpZQ65f6vgPBkKd
# 3wZolv4qoHRbY2beayy4eKpNcG3wLPEHFX41tOa1DKKZpdcVazUOhdbgLMzgDCS4
# fFILHpl878jIxYxYaa+rPeHPzH0VrhS/inHfypex2EfqHIXgRU4SHBQpWMxv03/L
# vsEOSm8gnK7ZczJZCOctkqEaEf4ymKZdK5fgi9OczG21Da5HYzhHF1tvE9pqEG4f
# SbdEW7QICodaWQR2EaGndwITHDCCBq4wggSWoAMCAQICEAc2N7ckVHzYR6z9KGYq
# XlswDQYJKoZIhvcNAQELBQAwYjELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lD
# ZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEhMB8GA1UEAxMYRGln
# aUNlcnQgVHJ1c3RlZCBSb290IEc0MB4XDTIyMDMyMzAwMDAwMFoXDTM3MDMyMjIz
# NTk1OVowYzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMTsw
# OQYDVQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQwOTYgU0hBMjU2IFRpbWVT
# dGFtcGluZyBDQTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAMaGNQZJ
# s8E9cklRVcclA8TykTepl1Gh1tKD0Z5Mom2gsMyD+Vr2EaFEFUJfpIjzaPp985yJ
# C3+dH54PMx9QEwsmc5Zt+FeoAn39Q7SE2hHxc7Gz7iuAhIoiGN/r2j3EF3+rGSs+
# QtxnjupRPfDWVtTnKC3r07G1decfBmWNlCnT2exp39mQh0YAe9tEQYncfGpXevA3
# eZ9drMvohGS0UvJ2R/dhgxndX7RUCyFobjchu0CsX7LeSn3O9TkSZ+8OpWNs5KbF
# Hc02DVzV5huowWR0QKfAcsW6Th+xtVhNef7Xj3OTrCw54qVI1vCwMROpVymWJy71
# h6aPTnYVVSZwmCZ/oBpHIEPjQ2OAe3VuJyWQmDo4EbP29p7mO1vsgd4iFNmCKseS
# v6De4z6ic/rnH1pslPJSlRErWHRAKKtzQ87fSqEcazjFKfPKqpZzQmiftkaznTqj
# 1QPgv/CiPMpC3BhIfxQ0z9JMq++bPf4OuGQq+nUoJEHtQr8FnGZJUlD0UfM2SU2L
# INIsVzV5K6jzRWC8I41Y99xh3pP+OcD5sjClTNfpmEpYPtMDiP6zj9NeS3YSUZPJ
# jAw7W4oiqMEmCPkUEBIDfV8ju2TjY+Cm4T72wnSyPx4JduyrXUZ14mCjWAkBKAAO
# hFTuzuldyF4wEr1GnrXTdrnSDmuZDNIztM2xAgMBAAGjggFdMIIBWTASBgNVHRMB
# Af8ECDAGAQH/AgEAMB0GA1UdDgQWBBS6FtltTYUvcyl2mi91jGogj57IbzAfBgNV
# HSMEGDAWgBTs1+OC0nFdZEzfLmc/57qYrhwPTzAOBgNVHQ8BAf8EBAMCAYYwEwYD
# VR0lBAwwCgYIKwYBBQUHAwgwdwYIKwYBBQUHAQEEazBpMCQGCCsGAQUFBzABhhho
# dHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQQYIKwYBBQUHMAKGNWh0dHA6Ly9jYWNl
# cnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRSb290RzQuY3J0MEMGA1Ud
# HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRy
# dXN0ZWRSb290RzQuY3JsMCAGA1UdIAQZMBcwCAYGZ4EMAQQCMAsGCWCGSAGG/WwH
# ATANBgkqhkiG9w0BAQsFAAOCAgEAfVmOwJO2b5ipRCIBfmbW2CFC4bAYLhBNE88w
# U86/GPvHUF3iSyn7cIoNqilp/GnBzx0H6T5gyNgL5Vxb122H+oQgJTQxZ822EpZv
# xFBMYh0MCIKoFr2pVs8Vc40BIiXOlWk/R3f7cnQU1/+rT4osequFzUNf7WC2qk+R
# Zp4snuCKrOX9jLxkJodskr2dfNBwCnzvqLx1T7pa96kQsl3p/yhUifDVinF2ZdrM
# 8HKjI/rAJ4JErpknG6skHibBt94q6/aesXmZgaNWhqsKRcnfxI2g55j7+6adcq/E
# x8HBanHZxhOACcS2n82HhyS7T6NJuXdmkfFynOlLAlKnN36TU6w7HQhJD5TNOXrd
# /yVjmScsPT9rp/Fmw0HNT7ZAmyEhQNC3EyTN3B14OuSereU0cZLXJmvkOHOrpgFP
# vT87eK1MrfvElXvtCl8zOYdBeHo46Zzh3SP9HSjTx/no8Zhf+yvYfvJGnXUsHics
# JttvFXseGYs2uJPU5vIXmVnKcPA3v5gA3yAWTyf7YGcWoWa63VXAOimGsJigK+2V
# Qbc61RWYMbRiCQ8KvYHZE/6/pNHzV9m8BPqC3jLfBInwAM1dwvnQI38AC+R2AibZ
# 8GV2QqYphwlHK+Z/GqSFD/yYlvZVVCsfgPrA8g4r5db7qS9EFUrnEw4d2zc4GqEr
# 9u3WfPwxggN2MIIDcgIBATB3MGMxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdp
# Q2VydCwgSW5jLjE7MDkGA1UEAxMyRGlnaUNlcnQgVHJ1c3RlZCBHNCBSU0E0MDk2
# IFNIQTI1NiBUaW1lU3RhbXBpbmcgQ0ECEAp6SoieyZlCkAZjOE2Gl50wDQYJYIZI
# AWUDBAIBBQCggdEwGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMBwGCSqGSIb3
# DQEJBTEPFw0yMjA0MDQxNDIwMzNaMCsGCyqGSIb3DQEJEAIMMRwwGjAYMBYEFIUI
# 84ZRXLPTB322tLfAfxtKXkHeMC8GCSqGSIb3DQEJBDEiBCDgpUoSvH1aVt+yk+Ew
# CcW9PkPRDxx0njRvH5mJXdDl3DA3BgsqhkiG9w0BCRACLzEoMCYwJDAiBCCdppAV
# w0nGwYl4Rbo1gq1wyI+kKTvbar6cK9JTknnmOzANBgkqhkiG9w0BAQEFAASCAgAc
# fa7IoL5u8/zUQ0rpThuDph2auRtFCdDZaUio7ZBo07aj0WWP/yFnH4bUOwzLejfj
# GMrQiDXl+jvfGZx1Vk+E04Kam79lDxmZapV99y8hrUisLlbDr+zec51JUfDu+sGb
# aI/QZKIB4HqXsrYPrTGnDfifsqEAAq9ny2/XL9sCSaP1Nm9QTOR+MyvPq3fhMWJK
# /KpYp/952sMMdrAS+IrDDlmNJWfHl03qtvftzI2C0vF7hskRV7MRD78dK7XFtXl4
# ZRNBhd5WG9IWtiwaxNZOxbcf5msYSxikVDBDhGGAp+7rLFSxG3VZVVeE/YQ7pZgn
# frA1YpqlyE0iZ1ZOXJIo4v4LhYHCzaRrx+zCzBnCpz0H9HRioEJM4QO6+ysGu1ei
# w1RxjeD7+w8rKMnVVan7jug06cf3/Ox8GFiRAW2yfM8UaOKvmOEIB5yH0pCsuw03
# gEyCGbqHABHXygluQT5sJ5Y0YfzXA+oOhBNNYhazM++Y6bLI0PYGWUWcKYir1RHu
# b/R+t2UV7/xD41LiQbVRjVtvYsssUu3Zy12M09DrS+EH3IN/n4Mgr1nsmpMALKRd
# 8wwiyXTsnwSYN25t7ooAV3gXVk9zI8KQWtSYLgEDav2Omu0RIUGH+rVu43UX4Wz3
# AzmyFRji7xWB9EktROpX65ahc/R5DSCLfgOG0lzbaw==
# SIG # End signature block
