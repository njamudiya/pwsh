#
# Module manifest for module 'VMware.DeployAutomation'
#
# Generated by: "VMware"
#
#

@{

# Script module or binary module file associated with this manifest
ModuleToProcess = 'VMware.DeployAutomation.dll'

# Version number of this module.
ModuleVersion = '7.0.3.19599828'

# ID used to uniquely identify this module
GUID = 'e1728e10-8af0-4383-a2ac-299dcbf4e150'

# Author of this module
Author = '"VMware"'

# Company or vendor of this module
CompanyName = 'VMware, Inc.'

# Copyright statement for this module
Copyright = 'Copyright (c) VMware, Inc. All rights reserved.'

# Description of the functionality provided by this module
Description = 'This Windows PowerShell module contains PowerCLI Auto Deploy cmdlets.'

# Minimum version of the Windows PowerShell engine required by this module
#PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
PowerShellHostVersion = ''

# Minimum version of the .NET Framework required by this module
DotNetFrameworkVersion = '4.5'

# Minimum version of the common language runtime (CLR) required by this module
CLRVersion = '4.0'

# Processor architecture (None, X86, Amd64, IA64) required by this module
ProcessorArchitecture = ''

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @(
    'VMware.DeployAutomation.dll',
    'VMware.DeployAutomation.SoapService50.dll',
    'VMware.DeployAutomation.SoapService50.XmlSerializers.dll'
)

# Script files (.ps1) that are run in the caller's environment prior to importing this module
ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = @('VMware.DeployAutomation.Format.ps1xml')

# Modules to import as nested modules of the module specified in ModuleToProcess
NestedModules= @('VMware.DeployAutomation.ps1')

# Functions to export from this module
FunctionsToExport = '*'

# Cmdlets to export from this module
CmdletsToExport = @(
                    'Add-CustomCertificate',
                    'Add-DeployRule',
                    'Add-ProxyServer',
                    'Add-ScriptBundle',
                    'Copy-DeployRule',
                    'Export-AutoDeployState',
                    'Get-CustomCertificates',
                    'Get-DeployOption',
                    'Get-DeployRule',
                    'Get-DeployRuleSet',
                    'Get-ProxyServer',
                    'Get-ScriptBundle',
                    'Get-VMHostAttributes',
                    'Get-VMHostImageProfile',
                    'Get-VMHostMatchingRules',
                    'Import-AutoDeployState',
                    'New-DeployRule',
                    'Remove-CustomCertificates',
                    'Remove-DeployRule'
                    'Remove-ProxyServer',
                    'Remove-ScriptBundle',
                    'Repair-DeployImageCache',
                    'Repair-DeployRuleSetCompliance',
                    'Set-DeployOption',
                    'Set-DeployRule',
                    'Set-DeployRuleSet',
                    'Set-ESXImageProfileAssociation',
                    'Set-ScriptBundleAssociation',
                    'Switch-ActiveDeployRuleSet',
                    'Test-DeployRuleSetCompliance',
                    'Set-LCMClusterRuleWithTransform',
                    'Reset-LCMClusterRuleWithTransform',
                    'New-LCMClusterRuleWithTransform'
)

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module
AliasesToExport = @('Apply-ESXImageProfile', 'Get-DeployCommand')

# List of all modules packaged with this module
ModuleList = @()

# List of all files packaged with this module
FileList =	''

# Private data to pass to the module specified in ModuleToProcess
PrivateData = ''
}

# SIG # Begin signature block
# MIIhwQYJKoZIhvcNAQcCoIIhsjCCIa4CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUkjbBvac6rVftkdBRPJljuF36
# /gmgghtWMIIGrjCCBJagAwIBAgIQBzY3tyRUfNhHrP0oZipeWzANBgkqhkiG9w0B
# AQsFADBiMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYD
# VQQLExB3d3cuZGlnaWNlcnQuY29tMSEwHwYDVQQDExhEaWdpQ2VydCBUcnVzdGVk
# IFJvb3QgRzQwHhcNMjIwMzIzMDAwMDAwWhcNMzcwMzIyMjM1OTU5WjBjMQswCQYD
# VQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4xOzA5BgNVBAMTMkRpZ2lD
# ZXJ0IFRydXN0ZWQgRzQgUlNBNDA5NiBTSEEyNTYgVGltZVN0YW1waW5nIENBMIIC
# IjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAxoY1BkmzwT1ySVFVxyUDxPKR
# N6mXUaHW0oPRnkyibaCwzIP5WvYRoUQVQl+kiPNo+n3znIkLf50fng8zH1ATCyZz
# lm34V6gCff1DtITaEfFzsbPuK4CEiiIY3+vaPcQXf6sZKz5C3GeO6lE98NZW1Oco
# LevTsbV15x8GZY2UKdPZ7Gnf2ZCHRgB720RBidx8ald68Dd5n12sy+iEZLRS8nZH
# 92GDGd1ftFQLIWhuNyG7QKxfst5Kfc71ORJn7w6lY2zkpsUdzTYNXNXmG6jBZHRA
# p8ByxbpOH7G1WE15/tePc5OsLDnipUjW8LAxE6lXKZYnLvWHpo9OdhVVJnCYJn+g
# GkcgQ+NDY4B7dW4nJZCYOjgRs/b2nuY7W+yB3iIU2YIqx5K/oN7jPqJz+ucfWmyU
# 8lKVEStYdEAoq3NDzt9KoRxrOMUp88qqlnNCaJ+2RrOdOqPVA+C/8KI8ykLcGEh/
# FDTP0kyr75s9/g64ZCr6dSgkQe1CvwWcZklSUPRR8zZJTYsg0ixXNXkrqPNFYLwj
# jVj33GHek/45wPmyMKVM1+mYSlg+0wOI/rOP015LdhJRk8mMDDtbiiKowSYI+RQQ
# EgN9XyO7ZONj4KbhPvbCdLI/Hgl27KtdRnXiYKNYCQEoAA6EVO7O6V3IXjASvUae
# tdN2udIOa5kM0jO0zbECAwEAAaOCAV0wggFZMBIGA1UdEwEB/wQIMAYBAf8CAQAw
# HQYDVR0OBBYEFLoW2W1NhS9zKXaaL3WMaiCPnshvMB8GA1UdIwQYMBaAFOzX44LS
# cV1kTN8uZz/nupiuHA9PMA4GA1UdDwEB/wQEAwIBhjATBgNVHSUEDDAKBggrBgEF
# BQcDCDB3BggrBgEFBQcBAQRrMGkwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRp
# Z2ljZXJ0LmNvbTBBBggrBgEFBQcwAoY1aHR0cDovL2NhY2VydHMuZGlnaWNlcnQu
# Y29tL0RpZ2lDZXJ0VHJ1c3RlZFJvb3RHNC5jcnQwQwYDVR0fBDwwOjA4oDagNIYy
# aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZFJvb3RHNC5j
# cmwwIAYDVR0gBBkwFzAIBgZngQwBBAIwCwYJYIZIAYb9bAcBMA0GCSqGSIb3DQEB
# CwUAA4ICAQB9WY7Ak7ZvmKlEIgF+ZtbYIULhsBguEE0TzzBTzr8Y+8dQXeJLKftw
# ig2qKWn8acHPHQfpPmDI2AvlXFvXbYf6hCAlNDFnzbYSlm/EUExiHQwIgqgWvalW
# zxVzjQEiJc6VaT9Hd/tydBTX/6tPiix6q4XNQ1/tYLaqT5Fmniye4Iqs5f2MvGQm
# h2ySvZ180HAKfO+ovHVPulr3qRCyXen/KFSJ8NWKcXZl2szwcqMj+sAngkSumScb
# qyQeJsG33irr9p6xeZmBo1aGqwpFyd/EjaDnmPv7pp1yr8THwcFqcdnGE4AJxLaf
# zYeHJLtPo0m5d2aR8XKc6UsCUqc3fpNTrDsdCEkPlM05et3/JWOZJyw9P2un8WbD
# Qc1PtkCbISFA0LcTJM3cHXg65J6t5TRxktcma+Q4c6umAU+9Pzt4rUyt+8SVe+0K
# XzM5h0F4ejjpnOHdI/0dKNPH+ejxmF/7K9h+8kaddSweJywm228Vex4Ziza4k9Tm
# 8heZWcpw8De/mADfIBZPJ/tgZxahZrrdVcA6KYawmKAr7ZVBtzrVFZgxtGIJDwq9
# gdkT/r+k0fNX2bwE+oLeMt8EifAAzV3C+dAjfwAL5HYCJtnwZXZCpimHCUcr5n8a
# pIUP/JiW9lVUKx+A+sDyDivl1vupL0QVSucTDh3bNzgaoSv27dZ8/DCCBrAwggSY
# oAMCAQICEAitQLJg0pxMn17Nqb2TrtkwDQYJKoZIhvcNAQEMBQAwYjELMAkGA1UE
# BhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2lj
# ZXJ0LmNvbTEhMB8GA1UEAxMYRGlnaUNlcnQgVHJ1c3RlZCBSb290IEc0MB4XDTIx
# MDQyOTAwMDAwMFoXDTM2MDQyODIzNTk1OVowaTELMAkGA1UEBhMCVVMxFzAVBgNV
# BAoTDkRpZ2lDZXJ0LCBJbmMuMUEwPwYDVQQDEzhEaWdpQ2VydCBUcnVzdGVkIEc0
# IENvZGUgU2lnbmluZyBSU0E0MDk2IFNIQTM4NCAyMDIxIENBMTCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBANW0L0LQKK14t13VOVkbsYhC9TOM6z2Bl3DF
# u8SFJjCfpI5o2Fz16zQkB+FLT9N4Q/QX1x7a+dLVZxpSTw6hV/yImcGRzIEDPk1w
# JGSzjeIIfTR9TIBXEmtDmpnyxTsf8u/LR1oTpkyzASAl8xDTi7L7CPCK4J0JwGWn
# +piASTWHPVEZ6JAheEUuoZ8s4RjCGszF7pNJcEIyj/vG6hzzZWiRok1MghFIUmje
# EL0UV13oGBNlxX+yT4UsSKRWhDXW+S6cqgAV0Tf+GgaUwnzI6hsy5srC9KejAw50
# pa85tqtgEuPo1rn3MeHcreQYoNjBI0dHs6EPbqOrbZgGgxu3amct0r1EGpIQgY+w
# OwnXx5syWsL/amBUi0nBk+3htFzgb+sm+YzVsvk4EObqzpH1vtP7b5NhNFy8k0Uo
# gzYqZihfsHPOiyYlBrKD1Fz2FRlM7WLgXjPy6OjsCqewAyuRsjZ5vvetCB51pmXM
# u+NIUPN3kRr+21CiRshhWJj1fAIWPIMorTmG7NS3DVPQ+EfmdTCN7DCTdhSmW0td
# dGFNPxKRdt6/WMtyEClB8NXFbSZ2aBFBE1ia3CYrAfSJTVnbeM+BSj5AR1/JgVBz
# hRAjIVlgimRUwcwhGug4GXxmHM14OEUwmU//Y09Mu6oNCFNBfFg9R7P6tuyMMgkC
# zGw8DFYRAgMBAAGjggFZMIIBVTASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdDgQW
# BBRoN+Drtjv4XxGG+/5hewiIZfROQjAfBgNVHSMEGDAWgBTs1+OC0nFdZEzfLmc/
# 57qYrhwPTzAOBgNVHQ8BAf8EBAMCAYYwEwYDVR0lBAwwCgYIKwYBBQUHAwMwdwYI
# KwYBBQUHAQEEazBpMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5j
# b20wQQYIKwYBBQUHMAKGNWh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdp
# Q2VydFRydXN0ZWRSb290RzQuY3J0MEMGA1UdHwQ8MDowOKA2oDSGMmh0dHA6Ly9j
# cmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRSb290RzQuY3JsMBwGA1Ud
# IAQVMBMwBwYFZ4EMAQMwCAYGZ4EMAQQBMA0GCSqGSIb3DQEBDAUAA4ICAQA6I0Q9
# jQh27o+8OpnTVuACGqX4SDTzLLbmdGb3lHKxAMqvbDAnExKekESfS/2eo3wm1Te8
# Ol1IbZXVP0n0J7sWgUVQ/Zy9toXgdn43ccsi91qqkM/1k2rj6yDR1VB5iJqKisG2
# vaFIGH7c2IAaERkYzWGZgVb2yeN258TkG19D+D6U/3Y5PZ7Umc9K3SjrXyahlVhI
# 1Rr+1yc//ZDRdobdHLBgXPMNqO7giaG9OeE4Ttpuuzad++UhU1rDyulq8aI+20O4
# M8hPOBSSmfXdzlRt2V0CFB9AM3wD4pWywiF1c1LLRtjENByipUuNzW92NyyFPxrO
# JukYvpAHsEN/lYgggnDwzMrv/Sk1XB+JOFX3N4qLCaHLC+kxGv8uGVw5ceG+nKcK
# BtYmZ7eS5k5f3nqsSc8upHSSrds8pJyGH+PBVhsrI/+PteqIe3Br5qC6/To/RabE
# 6BaRUotBwEiES5ZNq0RA443wFSjO7fEYVgcqLxDEDAhkPDOPriiMPMuPiAsNvzv0
# zh57ju+168u38HcT5ucoP6wSrqUvImxB+YJcFWbMbA7KxYbD9iYzDAdLoNMHAmpq
# QDBISzSoUSC7rRuFCOJZDW3KBVAr6kocnqX9oKcfBnTn8tZSkP2vhUgh+Vc7tJwD
# 7YZF9LRhbr9o4iZghurIr6n+lB3nYxs6hlZ4TjCCBsYwggSuoAMCAQICEAp6Soie
# yZlCkAZjOE2Gl50wDQYJKoZIhvcNAQELBQAwYzELMAkGA1UEBhMCVVMxFzAVBgNV
# BAoTDkRpZ2lDZXJ0LCBJbmMuMTswOQYDVQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0
# IFJTQTQwOTYgU0hBMjU2IFRpbWVTdGFtcGluZyBDQTAeFw0yMjAzMjkwMDAwMDBa
# Fw0zMzAzMTQyMzU5NTlaMEwxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2Vy
# dCwgSW5jLjEkMCIGA1UEAxMbRGlnaUNlcnQgVGltZXN0YW1wIDIwMjIgLSAyMIIC
# IjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAuSqWI6ZcvF/WSfAVghj0M+7M
# XGzj4CUu0jHkPECu+6vE43hdflw26vUljUOjges4Y/k8iGnePNIwUQ0xB7pGbumj
# S0joiUF/DbLW+YTxmD4LvwqEEnFsoWImAdPOw2z9rDt+3Cocqb0wxhbY2rzrsvGD
# 0Z/NCcW5QWpFQiNBWvhg02UsPn5evZan8Pyx9PQoz0J5HzvHkwdoaOVENFJfD1De
# 1FksRHTAMkcZW+KYLo/Qyj//xmfPPJOVToTpdhiYmREUxSsMoDPbTSSF6IKU4S8D
# 7n+FAsmG4dUYFLcERfPgOL2ivXpxmOwV5/0u7NKbAIqsHY07gGj+0FmYJs7g7a5/
# KC7CnuALS8gI0TK7g/ojPNn/0oy790Mj3+fDWgVifnAs5SuyPWPqyK6BIGtDich+
# X7Aa3Rm9n3RBCq+5jgnTdKEvsFR2wZBPlOyGYf/bES+SAzDOMLeLD11Es0MdI1DN
# kdcvnfv8zbHBp8QOxO9APhk6AtQxqWmgSfl14ZvoaORqDI/r5LEhe4ZnWH5/H+gr
# 5BSyFtaBocraMJBr7m91wLA2JrIIO/+9vn9sExjfxm2keUmti39hhwVo99Rw40KV
# 6J67m0uy4rZBPeevpxooya1hsKBBGBlO7UebYZXtPgthWuo+epiSUc0/yUTngIsp
# QnL3ebLdhOon7v59emsCAwEAAaOCAYswggGHMA4GA1UdDwEB/wQEAwIHgDAMBgNV
# HRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMCAGA1UdIAQZMBcwCAYG
# Z4EMAQQCMAsGCWCGSAGG/WwHATAfBgNVHSMEGDAWgBS6FtltTYUvcyl2mi91jGog
# j57IbzAdBgNVHQ4EFgQUjWS3iSH+VlhEhGGn6m8cNo/drw0wWgYDVR0fBFMwUTBP
# oE2gS4ZJaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZEc0
# UlNBNDA5NlNIQTI1NlRpbWVTdGFtcGluZ0NBLmNybDCBkAYIKwYBBQUHAQEEgYMw
# gYAwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBYBggrBgEF
# BQcwAoZMaHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3Rl
# ZEc0UlNBNDA5NlNIQTI1NlRpbWVTdGFtcGluZ0NBLmNydDANBgkqhkiG9w0BAQsF
# AAOCAgEADS0jdKbR9fjqS5k/AeT2DOSvFp3Zs4yXgimcQ28BLas4tXARv4QZiz9d
# 5YZPvpM63io5WjlO2IRZpbwbmKrobO/RSGkZOFvPiTkdcHDZTt8jImzV3/ZZy6HC
# 6kx2yqHcoSuWuJtVqRprfdH1AglPgtalc4jEmIDf7kmVt7PMxafuDuHvHjiKn+8R
# yTFKWLbfOHzL+lz35FO/bgp8ftfemNUpZYkPopzAZfQBImXH6l50pls1klB89Bem
# h2RPPkaJFmMga8vye9A140pwSKm25x1gvQQiFSVwBnKpRDtpRxHT7unHoD5PELkw
# NuTzqmkJqIt+ZKJllBH7bjLx9bs4rc3AkxHVMnhKSzcqTPNc3LaFwLtwMFV41pj+
# VG1/calIGnjdRncuG3rAM4r4SiiMEqhzzy350yPynhngDZQooOvbGlGglYKOKGuk
# zp123qlzqkhqWUOuX+r4DwZCnd8GaJb+KqB0W2Nm3mssuHiqTXBt8CzxBxV+NbTm
# tQyimaXXFWs1DoXW4CzM4AwkuHxSCx6ZfO/IyMWMWGmvqz3hz8x9Fa4Uv4px38qX
# sdhH6hyF4EVOEhwUKVjMb9N/y77BDkpvIJyu2XMyWQjnLZKhGhH+MpimXSuX4IvT
# nMxttQ2uR2M4RxdbbxPaahBuH0m3RFu0CAqHWlkEdhGhp3cCExwwggciMIIFCqAD
# AgECAhAOxvKydqFGoH0ObZNXteEIMA0GCSqGSIb3DQEBCwUAMGkxCzAJBgNVBAYT
# AlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQg
# VHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEzODQgMjAyMSBDQTEw
# HhcNMjEwODEwMDAwMDAwWhcNMjMwODEwMjM1OTU5WjCBhzELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCkNhbGlmb3JuaWExEjAQBgNVBAcTCVBhbG8gQWx0bzEVMBMGA1UE
# ChMMVk13YXJlLCBJbmMuMRUwEwYDVQQDEwxWTXdhcmUsIEluYy4xITAfBgkqhkiG
# 9w0BCQEWEm5vcmVwbHlAdm13YXJlLmNvbTCCAaIwDQYJKoZIhvcNAQEBBQADggGP
# ADCCAYoCggGBAMD6lJG8OWkM12huIQpO/q9JnhhhW5UyW9if3/UnoFY3oqmp0JYX
# /ZrXogUHYXmbt2gk01zz2P5Z89mM4gqRbGYC2tx+Lez4GxVkyslVPI3PXYcYSaRp
# 39JsF3yYifnp9R+ON8O3Gf5/4EaFmbeTElDCFBfExPMqtSvPZDqekodzX+4SK1PI
# ZxCyR3gml8R3/wzhb6Li0mG7l0evQUD0FQAbKJMlBk863apeX4ALFZtrnCpnMlOj
# Rb85LsjV5Ku4OhxQi1jlf8wR+za9C3DUki60/yiWPu+XXwEUqGInIihECBbp7hfF
# WrnCCaOgahsVpgz8kKg/XN4OFq7rbh4q5IkTauqFhHaE7HKM5bbIBkZ+YJs2SYvu
# 7aHjw4Z8aRjaIbXhI1G+NtaNY7kSRrE4fAyC2X2zV5i4a0AuAMM40C1Wm3gTaNtR
# THnka/pbynUlFjP+KqAZhOniJg4AUfjXsG+PG1LH2+w/sfDl1A8liXSZU1qJtUs3
# wBQFoSGEaGBeDQIDAQABo4ICJTCCAiEwHwYDVR0jBBgwFoAUaDfg67Y7+F8Rhvv+
# YXsIiGX0TkIwHQYDVR0OBBYEFIhC+HL9QlvsWsztP/I5wYwdfCFNMB0GA1UdEQQW
# MBSBEm5vcmVwbHlAdm13YXJlLmNvbTAOBgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAww
# CgYIKwYBBQUHAwMwgbUGA1UdHwSBrTCBqjBToFGgT4ZNaHR0cDovL2NybDMuZGln
# aWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZEc0Q29kZVNpZ25pbmdSU0E0MDk2U0hB
# Mzg0MjAyMUNBMS5jcmwwU6BRoE+GTWh0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9E
# aWdpQ2VydFRydXN0ZWRHNENvZGVTaWduaW5nUlNBNDA5NlNIQTM4NDIwMjFDQTEu
# Y3JsMD4GA1UdIAQ3MDUwMwYGZ4EMAQQBMCkwJwYIKwYBBQUHAgEWG2h0dHA6Ly93
# d3cuZGlnaWNlcnQuY29tL0NQUzCBlAYIKwYBBQUHAQEEgYcwgYQwJAYIKwYBBQUH
# MAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBcBggrBgEFBQcwAoZQaHR0cDov
# L2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZEc0Q29kZVNpZ25p
# bmdSU0E0MDk2U0hBMzg0MjAyMUNBMS5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG
# 9w0BAQsFAAOCAgEACQAYaQI6Nt2KgxdN6qqfcHB33EZRSXkvs8O9iPZkdDjEx+2f
# gbBPLUvk9A7T8mRw7brbcJv4PLTYJDFoc5mlcmG7/5zwTOuIs2nBGXc/uxCnyW8p
# 7kD4Y0JxPKEVQoIQ8lJS9Uy/hBjyakeVef982JyzvDbOlLBy6AS3ZpXVkRY5y3Va
# +3v0R/0xJ+JRxUicQhiZRidq2TCiWEasd+tLL6jrKaBO+rmP52IM4eS9d4Yids7o
# gKEBAlJi0NbvuKO0CkgOlFjp1tOvD4sQtaHIMmqi40p4Tjyf/sY6yGjROXbMeeF1
# vlwbBAASPWpQuEIxrNHoVN30YfJyuOWjzdiJUTpeLn9XdjM3UlhfaHP+oIAKcmkd
# 33c40SFRlQG9+P9Wlm7TcPxGU4wzXI8nCw/h235jFlAAiWq9L2r7Un7YduqsheJV
# pGoXmRXJH0T2G2eNFS5/+2sLn98kN2CnJ7j6C242onjkZuGL2/+gqx8m5Jbpu9P4
# IAeTC1He/mX9j6XpIu+7uBoRVwuWD1i0N5SiUz7Lfnbr6Q1tHMXKDLFdwVKZos2A
# KEZhv4SU0WvenMJKDgkkhVeHPHbTahQfP1MetR8tdRs7uyTWAjPK5xf5DLEkXbMr
# UkpJ089fPvAGVHBcHRMqFA5egexOb6sjtKncUjJ1xAAtAExGdCh6VD2U5iYxggXV
# MIIF0QIBATB9MGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5j
# LjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcgUlNB
# NDA5NiBTSEEzODQgMjAyMSBDQTECEA7G8rJ2oUagfQ5tk1e14QgwCQYFKw4DAhoF
# AKCBijAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4w
# DAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUPl2viG1tpwhWo6H8s87l4OCn
# TzYwKgYKKwYBBAGCNwIBDDEcMBqhGIAWaHR0cDovL3d3dy52bXdhcmUuY29tLzAN
# BgkqhkiG9w0BAQEFAASCAYBmanDbhe5eedxeP8rz3XBhJGp8+VvpXWj84EtsfQES
# buQu40sy2hXqmTIlkuVv2RQeetXn9v2hnK0cPTYM2gQZkmoEJD/996GTTweoZXbd
# d6Ivi6tOD59zOQnQ4NPnazfN2FREzD05N88CrK7zIVGqZJt1I2zQINg2+QWxJzmq
# PWoyVEd5JCRoH0liMltv5BybY6w2YC/xY7AtFgdFn1FWDVyihaVmsNi3EFGUIvMH
# H7jB/8fqw/DGPJh+MG91KGw0rtV5Sj0ev5IqAEtqwsc/ExaHx5uXGlFxUADtYvXA
# TKlb9+NmhZPmecrlteyl+kRYchiAOyrGTvSIaEvqr4v7kBlk4FhKxjIkd46j8/EM
# 30KZCWh4CrHBpEpFm2+Ui3BosWP/2oG101ii0SPduHt2DDn5YrpY0/WHf9A35gmK
# MMCo3c6S+eKYct0D6ObYvA+NexLsxt9iO7jLDV+oH3Es94rin67dWj54sT52u1MJ
# 4vzVQ+UKmwv+w+pv0fSocsShggMgMIIDHAYJKoZIhvcNAQkGMYIDDTCCAwkCAQEw
# dzBjMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4xOzA5BgNV
# BAMTMkRpZ2lDZXJ0IFRydXN0ZWQgRzQgUlNBNDA5NiBTSEEyNTYgVGltZVN0YW1w
# aW5nIENBAhAKekqInsmZQpAGYzhNhpedMA0GCWCGSAFlAwQCAQUAoGkwGAYJKoZI
# hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjIwNDA0MTMxMTUw
# WjAvBgkqhkiG9w0BCQQxIgQg/qOMdWTPuPCt5EVkEfOlgJt+EhdxOWlWY7ydA9za
# i3cwDQYJKoZIhvcNAQEBBQAEggIAVxNo+4p+OP1ZdEvgO7JuNgwgOv/KAIsXJVCH
# lnbLahxXKOQZE2/nKwTq1BvGUkYjHRUv6oH2OFq+Osqzqg6td+rs+AYe/pAKXk2D
# 8Fsxj4hC+Z50gn/89zN7aw4cKn9FcWnCnKM+DmQPaLIjGMdOP75+1F2xcHa9Uems
# Y/0NHJxzFLUxuwAgn0cSYF+8JHcwi1EHR0ymAEFdoeoSJw6eK9W8d/GVjYcKr8zG
# aQQf9I+Ete96DWI7rDdtrtx4uSD+cEeV30IxhUJVA7ODYBKEI8SYRwSwDipCxNgQ
# gVtVW0IrGaqCJ8h10cqo1nIlccql32oGQ1owx8aj/klv28bbTEHAa1krbrp3odiW
# zVJ/bfjbUpQDF2UjQejCfx/IEZ2YXK7PPqCIi4vuhpGCBR+PgnF9vKJquxI+De0i
# AHLnoOSIZd+t2Z3WxiQitDhyf+zCnFJPeZPHZwbu2nXlHnyha6f0YQ0JbeRV3MCI
# iRzfhAJPeBswsYtyqble2aAl/XSu/h/6WD5byyC7XJOUfX7tM5uIEgLcuRH/VzYs
# RcpLLxrsZ1Bzvt84Wi0UViZ32pLTi8TtgBBcRZEcervB+a3aGCakDLgqC+Ut0cVV
# RI9Q7xvEAL52/BoHG/Sg/pvW7EKgf/pNT+I8Av2WuK6H9n2o0rk1X4FW8/ZxCaC0
# 8X1/YmI=
# SIG # End signature block