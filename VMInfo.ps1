Param([String]$pass,[String]$vipass)

Import-Module -Name VMware.Vim
Import-Module -Name VMware.VimAutomation.Cis.Core
Import-Module -Name VMware.VimAutomation.Cloud
Import-Module -Name VMware.VimAutomation.Common
Import-Module /root/.local/share/powershell/Modules/VMware.VimAutomation.Core
Import-Module -Name VMware.VimAutomation.HorizonView
Import-Module -Name VMware.VimAutomation.License
Import-Module -Name VMware.VimAutomation.Nsxt
Import-Module -Name VMware.VimAutomation.Sdk
Import-Module -Name VMware.VimAutomation.Srm
Import-Module -Name VMware.VimAutomation.Storage
Import-Module -Name VMware.VimAutomation.Vds
Import-Module -Name VMware.VimAutomation.Vmc
Import-Module -Name VMware.VimAutomation.vROps


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
