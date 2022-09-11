Param(
    [String]$smtpuser,
    [String]$smtppass,
    [String]$vcuser,
    [String]$vcpass,
    $VIServer,
    [String]$smtpserver,
    $smtpport,
    [String]$from,
    [String]$to
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
    Connect-VIServer $VIServer -User $vcuser -Password $vcpass

    $msg = Get-VM
    $msg = $msg|ConvertTo-Html -Property Name,PowerState,Guest,NumCpu,CoresPerSocket,MemoryMB,Version,HardwareVersion,PersistentId,GuestId,UsedSpaceGB,ProvisionedSpaceGB,CreateDate,MemoryHotAddLimit,Id -Head $Header

    $snapshots = Get-VM | ForEach-Object{Get-Snapshot -VM $_ | Select-Object VM,PowerState,Name,Created,Description}
    $msg += '<br>'
    $msg += '<hr style="height:2px;border-width:0;color:gray;background-color:gray">'
    $msg += '<br>'
    $snapshots = $snapshots|ConvertTo-Html -Head $Header
    $msg += $snapshots
    Disconnect-VIServer -Confirm:$false
}
catch{
    $msg = $_
}


$Username = $smtpuser
$Password = ConvertTo-SecureString $smtppass -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $Username, $Password

if(!$msg){$msg = "Blank Email Body"}

try{
    Send-MailMessage -SmtpServer $smtpserver -Port $smtpport -From $from -To $to -Body "$msg" -Subject "VMSnapshotInfo $((Get-Date).ToString())" -Credential $credential -UseSsl -Verbose -BodyAsHtml
}
catch{
    Write-Host "Failed to send email with error - $_"
    Write-Host "Script output - `n$msg"
}
