#
# Module manifest for module 'VMware.VimAutomation.Core'
#
# Generated by: "VMware"
#
#

@{

# Script module or binary module file associated with this manifest
RootModule = 'VMware.VimAutomation.Core.psm1'

# Version number of this module.
ModuleVersion = '12.7.0.20091293'

# ID used to uniquely identify this module
GUID = '44949982-afb3-47df-919e-8fc646dc0d5a'

# Author of this module
Author = 'VMware'

# Company or vendor of this module
CompanyName = 'VMware, Inc.'

# Copyright statement for this module
Copyright = 'Copyright (c) VMware, Inc. All rights reserved.'

# Description of the functionality provided by this module
Description = 'This Windows PowerShell module contains Windows PowerShell cmdlets for managing vSphere.'

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(
@{"ModuleName"="VMware.VimAutomation.Cis.Core";"ModuleVersion"="12.6.0.19601368"}
)

# Functions to export from this module
FunctionsToExport = '*'

# Cmdlets to export from this module
CmdletsToExport = @('Add-PassthroughDevice','Add-VirtualSwitchPhysicalNetworkAdapter','Add-VMHost','Add-VMHostNtpServer','Connect-VIServer','Copy-ContentLibraryItem','Copy-DatastoreItem','Copy-HardDisk','Copy-VMGuestFile','Disconnect-VIServer','Dismount-Tools','Export-ContentLibraryItem','Export-LcmClusterDesiredState','Export-VApp','Export-VMHostProfile','Format-VMHostDiskPartition','Get-AdvancedSetting','Get-AlarmAction','Get-AlarmActionTrigger','Get-AlarmDefinition','Get-AlarmTrigger','Get-Annotation','Get-ApplianceBackupJob','Get-ApplianceBackupPart','Get-CDDrive','Get-Cluster','Get-ContentLibrary','Get-ContentLibraryItem','Get-CustomAttribute','Get-Datacenter','Get-Datastore','Get-DatastoreCluster','Get-DrsClusterGroup','Get-DrsRecommendation','Get-DrsRule','Get-DrsVMHostRule','Get-EsxCli','Get-EsxTop','Get-EventType','Get-FloppyDrive','Get-Folder','Get-HAPrimaryVMHost','Get-HardDisk','Get-Inventory','Get-IScsiHbaTarget','Get-LcmClusterDesiredStateRecommendation','Get-LcmHardwareCompatibility','Get-LcmImage','Get-Log','Get-LogType','Get-Metric','Get-NetworkAdapter','Get-NicTeamingPolicy','Get-OSCustomizationNicMapping','Get-OSCustomizationSpec','Get-OvfConfiguration','Get-PassthroughDevice','Get-PowerCLIConfiguration','Get-PowerCLIVersion','Get-ResourcePool','Get-ScsiController','Get-ScsiLun','Get-ScsiLunPath','Get-SecurityPolicy','Get-Snapshot','Get-Stat','Get-StatInterval','Get-StatType','Get-Tag','Get-TagAssignment','Get-TagCategory','Get-Template','Get-UsbDevice','Get-VApp','Get-VIAccount','Get-VICredentialStoreItem','Get-VIEvent','Get-View','Get-VIObjectByVIView','Get-VIPermission','Get-VIPrivilege','Get-VIProperty','Get-VIRole','Get-VirtualNetwork','Get-VirtualPortGroup','Get-VirtualSwitch','Get-VM','Get-VMGuest','Get-VMGuestDisk','Get-VMHost','Get-VMHostAccount','Get-VMHostAdvancedConfiguration','Get-VMHostAuthentication','Get-VMHostAvailableTimeZone','Get-VMHostDiagnosticPartition','Get-VMHostDisk','Get-VMHostDiskPartition','Get-VMHostFirewallDefaultPolicy','Get-VMHostFirewallException','Get-VMHostFirmware','Get-VMHostHardware','Get-VMHostHba','Get-VMHostModule','Get-VMHostNetwork','Get-VMHostNetworkAdapter','Get-VMHostNetworkStack','Get-VMHostNtpServer','Get-VMHostPatch','Get-VMHostPciDevice','Get-VMHostProfile','Get-VMHostProfileImageCacheConfiguration','Get-VMHostProfileRequiredInput','Get-VMHostProfileStorageDeviceConfiguration','Get-VMHostProfileUserConfiguration','Get-VMHostProfileVmPortGroupConfiguration','Get-VMHostRoute','Get-VMHostService','Get-VMHostSnmp','Get-VMHostStartPolicy','Get-VMHostStorage','Get-VMHostSysLogServer','Get-VMQuestion','Get-VMResourceConfiguration','Get-VMStartPolicy','Import-LcmClusterDesiredState','Import-VApp','Import-VMHostProfile','Install-VMHostPatch','Invoke-DrsRecommendation','Invoke-VMHostProfile','Invoke-VMScript','Mount-Tools','Move-Cluster','Move-Datacenter','Move-Datastore','Move-Folder','Move-HardDisk','Move-Inventory','Move-ResourcePool','Move-Template','Move-VApp','Move-VM','Move-VMHost','New-AdvancedSetting','New-AlarmAction','New-AlarmActionTrigger','New-AlarmDefinition','New-AlarmTrigger','New-ApplianceBackupJob','New-CDDrive','New-Cluster','New-ContentLibrary','New-ContentLibraryItem','New-CustomAttribute','New-Datacenter','New-Datastore','New-DatastoreCluster','New-DrsClusterGroup','New-DrsRule','New-DrsVMHostRule','New-FloppyDrive','New-Folder','New-HardDisk','New-IScsiHbaTarget','New-NetworkAdapter','New-OSCustomizationNicMapping','New-OSCustomizationSpec','New-ResourcePool','New-ScsiController','New-Snapshot','New-StatInterval','New-Tag','New-TagAssignment','New-TagCategory','New-Template','New-VApp','New-VICredentialStoreItem','New-VIPermission','New-VIProperty','New-VIRole','New-VirtualPortGroup','New-VirtualSwitch','New-VISamlSecurityContext','New-VM','New-VMHostAccount','New-VMHostNetworkAdapter','New-VMHostProfile','New-VMHostProfileVmPortGroupConfiguration','New-VMHostRoute','Open-VMConsoleWindow','Remove-AdvancedSetting','Remove-AlarmAction','Remove-AlarmActionTrigger','Remove-AlarmDefinition','Remove-CDDrive','Remove-Cluster','Remove-ContentLibrary','Remove-ContentLibraryItem','Remove-CustomAttribute','Remove-Datacenter','Remove-Datastore','Remove-DatastoreCluster','Remove-DrsClusterGroup','Remove-DrsRule','Remove-DrsVMHostRule','Remove-FloppyDrive','Remove-Folder','Remove-HardDisk','Remove-Inventory','Remove-IScsiHbaTarget','Remove-NetworkAdapter','Remove-OSCustomizationNicMapping','Remove-OSCustomizationSpec','Remove-PassthroughDevice','Remove-ResourcePool','Remove-Snapshot','Remove-StatInterval','Remove-Tag','Remove-TagAssignment','Remove-TagCategory','Remove-Template','Remove-UsbDevice','Remove-VApp','Remove-VICredentialStoreItem','Remove-VIPermission','Remove-VIProperty','Remove-VIRole','Remove-VirtualPortGroup','Remove-VirtualSwitch','Remove-VirtualSwitchPhysicalNetworkAdapter','Remove-VM','Remove-VMHost','Remove-VMHostAccount','Remove-VMHostNetworkAdapter','Remove-VMHostNtpServer','Remove-VMHostProfile','Remove-VMHostProfileVmPortGroupConfiguration','Remove-VMHostRoute','Restart-VM','Restart-VMGuest','Restart-VMHost','Restart-VMHostService','Set-AdvancedSetting','Set-AlarmDefinition','Set-Annotation','Set-CDDrive','Set-Cluster','Set-ContentLibrary','Set-ContentLibraryItem','Set-CustomAttribute','Set-Datacenter','Set-Datastore','Set-DatastoreCluster','Set-DrsClusterGroup','Set-DrsRule','Set-DrsVMHostRule','Set-FloppyDrive','Set-Folder','Set-HardDisk','Set-IScsiHbaTarget','Set-NetworkAdapter','Set-NicTeamingPolicy','Set-OSCustomizationNicMapping','Set-OSCustomizationSpec','Set-PowerCLIConfiguration','Set-ResourcePool','Set-ScsiController','Set-ScsiLun','Set-ScsiLunPath','Set-SecurityPolicy','Set-Snapshot','Set-StatInterval','Set-Tag','Set-TagCategory','Set-Template','Set-VApp','Set-VIPermission','Set-VIRole','Set-VirtualPortGroup','Set-VirtualSwitch','Set-VM','Set-VMHost','Set-VMHostAccount','Set-VMHostAdvancedConfiguration','Set-VMHostAuthentication','Set-VMHostDiagnosticPartition','Set-VMHostFirewallDefaultPolicy','Set-VMHostFirewallException','Set-VMHostFirmware','Set-VMHostHba','Set-VMHostModule','Set-VMHostNetwork','Set-VMHostNetworkAdapter','Set-VMHostNetworkStack','Set-VMHostProfile','Set-VMHostProfileImageCacheConfiguration','Set-VMHostProfileStorageDeviceConfiguration','Set-VMHostProfileUserConfiguration','Set-VMHostProfileVmPortGroupConfiguration','Set-VMHostRoute','Set-VMHostService','Set-VMHostSnmp','Set-VMHostStartPolicy','Set-VMHostStorage','Set-VMHostSysLogServer','Set-VMQuestion','Set-VMResourceConfiguration','Set-VMStartPolicy','Start-VApp','Start-VM','Start-VMHost','Start-VMHostService','Stop-ApplianceBackupJob','Stop-VApp','Stop-VM','Stop-VMGuest','Stop-VMHost','Stop-VMHostService','Suspend-VM','Suspend-VMGuest','Suspend-VMHost','Test-LcmClusterCompliance','Test-LcmClusterHealth','Test-VMHostProfileCompliance','Test-VMHostSnmp','Update-Tools','Wait-ApplianceBackupJob','Wait-Tools')

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module
AliasesToExport = @('Answer-VMQuestion','Apply-DrsRecommendation','Apply-VMHostProfile','Export-VM','Get-ESX','Get-PowerCLIDocumentation','Get-VC','Get-VIServer','Get-VIToolkitConfiguration','Get-VIToolkitVersion','Set-VIToolkitConfiguration','Shutdown-VMGuest')

PrivateData = @{
    PSData = @{
        IconUri = 'https://raw.githubusercontent.com/vmware/PowerCLI-Example-Scripts/1710f7ccbdd9fe9a3ab3f000e920fa6e8e042c63/resources/powercli-psgallery-icon.svg'
    }
}
}

# SIG # Begin signature block
# MIIrHQYJKoZIhvcNAQcCoIIrDjCCKwoCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCB1v9EUSu24vE6U
# CIeWJ3vHi3oPS3u7POxhDkQX9IviNqCCDdowggawMIIEmKADAgECAhAIrUCyYNKc
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
# CQQxIgQgZFIOWwAy3Xf4Alvfr6jV1uDprARkcSQoyTu0Cx2ifA0wDQYJKoZIhvcN
# AQEBBQAEggGAoXEhbODxS8pt65ko3UEBVUHQpO3J7AZdqC5eS3EP5WtH/dA7R53n
# vOlY3P5Yp0tqyAfCOaEoszJSPkgYt6TdYchv3j/nKB5PiCX8Z9gwlgVfUMt9/If0
# LzWwvE43n0pTHhp6wjJiF0u3YFpBgSNDqTUp6jMj4dGxY/ulsT1AHI+3H2eoYQQ+
# wsSUi8EDZQIlAC2v5VrRLGpbnUUvmERAr6KLR20fmGC2zzMYy4vjXHYldt9J6VCX
# SKPLrwf10y4+zAhPHj+bEJ0vOERYm37RmOVJzSr7nrYsuu7hqoOqPJ21AC1yPveb
# lbUwY7lb6m+nON74m2ijKJItOApS0NENKXlXGtR64qZnxqirHpnIju6RDmhLG/tF
# rKEqj2DkL9djmmFgUczBBsQUgRx1ndiRg1/HZYiGjGVI2+jAg8I3ZwRhxVzMyz+B
# VJ/0cR/Th4g10ef0y26kuz8VpBQm40JMUIwStJnUlTym/LdeS5pHIkbi+2UBs9cz
# rYwe/qT9GFkEoYIZ1DCCGdAGCisGAQQBgjcDAwExghnAMIIZvAYJKoZIhvcNAQcC
# oIIZrTCCGakCAQMxDTALBglghkgBZQMEAgEwgdwGCyqGSIb3DQEJEAEEoIHMBIHJ
# MIHGAgEBBgkrBgEEAaAyAgMwMTANBglghkgBZQMEAgEFAAQg/bQOYnUxdSgrLxev
# OCNgu9TXOlb1ojfBuCrLb/s71mECFGah7a1IzZWL8gu5bXPNMfGhDveVGA8yMDIy
# MDcxMTEyNDYxMlowAwIBAaBXpFUwUzELMAkGA1UEBhMCQkUxGTAXBgNVBAoMEEds
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
# SIb3DQEJBDEiBCCGhx6gx7oRJajIpFlhbQXJ6WA3dIpCeNlrQjKCWT6NHTCBsAYL
# KoZIhvcNAQkQAi8xgaAwgZ0wgZowgZcEIK+AMe1uyzkUREiVvQsdDOsSlZTbXgws
# bfa+crElQkfQMHMwX6RdMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxT
# aWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIFRpbWVzdGFtcGluZyBDQSAt
# IFNIQTM4NCAtIEc0AhABwpx69HqmAlgOrzKxI7EdMA0GCSqGSIb3DQEBCwUABIIB
# gEL/menwa+uKN5oRrUo42NCcsZMewsyvKFeqotrYjgBACx0wizvmHxXDk6WLGDiX
# RUNGgSDw6Glj13Z3+acaS3BeO/Jd31k7vRaYPHprA7caIAjEM3bHzVcVivwECkIc
# wB3+ocWjwYNqET3BXuT+O9Dh3Y17q+j3usf8XNNLhMaqMHoa7HjJkmU9L4OKWZeV
# F9/GDpKChNhXNXbCR/05ZgZtNJPiVjsYKz+hSWdAcfwqcOUgBOCJSxPHLlE16lZp
# eV3pR6ciqlaexeEmSMR6hZK81qxRTc88RZ+Gq1ljIvOGEgdw+Tl8/EZ9bbasWAEF
# wVqaNH1vJ/9Ca76ykyxVvhuQZ3F1yqkg386w5gBqSp5KKklRQPFiPInqC+aK7nvV
# jOJVN78qtgwiExXUFz6a/B6lGgaenRezI6BlrBwqsRuw0iiJQHVzhc960xwnFA40
# yLZBZXULMLFG0Senkbqe+xYuvCxjuqD9AA/wtHaet4SyTfruchLCA9K6UX4QATu9
# Mg==
# SIG # End signature block
