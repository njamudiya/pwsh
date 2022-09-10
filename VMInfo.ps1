Param(
    $smtpcred,
    [String]$vcuser,
    [String]$vcpass
)

Set-PowerCLIConfiguration  -InvalidCertificateAction Ignore -Confirm:$false

$Header = @"
<style>
TABLE {border-width: 1px; border-style: solid; border-color: black; border-collapse: collapse;}
TH {border-width: 1px; padding: 3px; border-style: solid; border-color: black; background-color: #6495ED;}
TD {border-width: 1px; padding: 3px; border-style: solid; border-color: black;}
</style>
"@

try{
    Connect-VIServer 192.168.1.20 -User $vcuser -Password $vcpass
    $msg = Get-VM
    $msg = $msg|ConvertTo-Html -Property Name,PowerState,Guest,NumCpu,CoresPerSocket,MemoryMB,Version,HardwareVersion,PersistentId,GuestId,UsedSpaceGB,ProvisionedSpaceGB,CreateDate,MemoryHotAddLimit,Id -Head $Header
    Disconnect-VIServer -Confirm:$false
}
catch{
    $msg = $_
}


if(!$msg){$msg = "Blank Email Body"}

try{
    Send-MailMessage -SmtpServer smtp.zoho.in -Port 587 -From smtp@jamudiya.live -To nitish@jamudiya.live -Body "$msg" -Subject "VMInfo $((Get-Date).ToString())" -Credential $smtpcred -UseSsl -Verbose -BodyAsHtml
}
catch{
    Write-Host "Failed to send email with error - $_"
    Write-Host "Script output - `n$msg"
}
