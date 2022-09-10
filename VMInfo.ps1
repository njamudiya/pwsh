Param([String]$pass,[String]$vipass)

Import-Module /root/.local/share/powershell/Modules/VMware.Vim
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.Cis.Core
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.Cloud
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.Common
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.Core
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.HorizonView
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.License
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.Nsxt
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.Sdk
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.Srm
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.Storage
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.Vds
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.Vmc
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.vROps


try{
    Connect-VIServer 192.168.1.20 -User 'srini' -Password 'rM)xBj7#'
    $msg = Get-VM
    $msg = $msg|Select Name,PowerState,Guest,NumCpu,CoresPerSocket,MemoryMB,Version,HardwareVersion,PersistentId,GuestId,UsedSpaceGB,ProvisionedSpaceGB,CreateDate,MemoryHotAddLimit,Id|ConvertTo-Html
    Disconnect-VIServer -Confirm:$false
}
catch{
    $msg = $_
}


$Username = "smtp@jamudiya.live"
$Password = ConvertTo-SecureString $pass -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $Username, $Password

if($msg -eq $null){$msg = "Balnk Email Body"}

try{
    Send-MailMessage -SmtpServer smtp.zoho.in -Port 587 -From smtp@jamudiya.live -To nitish@jamudiya.live -Body "$msg" -Subject "VMInfo $((Get-Date).ToString())" -Credential $credential -UseSsl -Verbose -BodyAsHtml
}
catch{
    Write-Host "Failed to send email with error - $_"
    Write-Host "Script output - `n$msg"
}
