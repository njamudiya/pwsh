Param([String]$pass,[String]$vipass)

Get-Module

Get-Module -Name VMware.* | Import-Module
Set-PowerCLIConfiguration  -InvalidCertificateAction Ignore -Confirm:$false

try{
    Connect-VIServer 192.168.1.20 -User 'srini' -Password 'rM)xBj7#'
    $msg = Get-VM
    $msg = $msg|Select-Object Name,PowerState,Guest,NumCpu,CoresPerSocket,MemoryMB,Version,HardwareVersion,PersistentId,GuestId,UsedSpaceGB,ProvisionedSpaceGB,CreateDate,MemoryHotAddLimit,Id|ConvertTo-Html
    Disconnect-VIServer -Confirm:$false
}
catch{
    $msg = $_
}


$Username = "smtp@jamudiya.live"
$Password = ConvertTo-SecureString $pass -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $Username, $Password

if(!$msg){$msg = "Blank Email Body"}

try{
    Send-MailMessage -SmtpServer smtp.zoho.in -Port 587 -From smtp@jamudiya.live -To nitish@jamudiya.live -Body "$msg" -Subject "VMInfo $((Get-Date).ToString())" -Credential $credential -UseSsl -Verbose -BodyAsHtml
}
catch{
    Write-Host "Failed to send email with error - $_"
    Write-Host "Script output - `n$msg"
}
