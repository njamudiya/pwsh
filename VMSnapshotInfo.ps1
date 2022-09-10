Param(
    [String]$smtppass,
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
    $snapshots = Get-VM | %{Get-Snapshot -VM $_ | Select VM,PowerState,Name,Created,Description}
    $msg = $snapshots|ConvertTo-Html -Property Name,PowerState,Guest,NumCpu,CoresPerSocket,MemoryMB,Version,HardwareVersion,PersistentId,GuestId,UsedSpaceGB,ProvisionedSpaceGB,CreateDate,MemoryHotAddLimit,Id -Head $Header
    Disconnect-VIServer -Confirm:$false
}
catch{
    $msg = $_
}


$Username = "smtp@jamudiya.live"
$Password = ConvertTo-SecureString $smtppass -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $Username, $Password

if(!$msg){$msg = "Blank Email Body"}

try{
    Send-MailMessage -SmtpServer smtp.zoho.in -Port 587 -From smtp@jamudiya.live -To nitish@jamudiya.live -Body "$msg" -Subject "VMSnapshotInfo $((Get-Date).ToString())" -Credential $credential -UseSsl -Verbose -BodyAsHtml
}
catch{
    Write-Host "Failed to send email with error - $_"
    Write-Host "Script output - `n$msg"
}
