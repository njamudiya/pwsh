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

try{
    Connect-VIServer $VIServer -User $vcuser -Password $vcpass
    $nuc = Get-VmHost
    $percpu = ($nuc.CpuUsageMhz)*100/($nuc.CpuTotalMhz)
    $permem = ($nuc.MemoryUsageGB)*100/($nuc.MemoryTotalGB)
    if($percpu -ge 50){
        $sub = "Alert : High CPU utilzation"
    }

    if($percpu -ge 80){
        $sub = "Alert : High Memory utilzation"
    }

    $ds = Get-Datastore
    $ds | foreach{
        $perstorage = ($_.FreeSpaceGB)*100/($_.CapacityGB)
        if($perstorage -ge 85){
            $sub = "Alert : High Storage utilzation"
        }
    }

    $ds | Select Name, FreeSpaceGB, CapacityGB | Format-Table

    $msg = $nuc| Select Name,ConnectionState,PowerState,NumCpu,CpuUsageMhz,CpuTotalMhz,MemoryUsageGB,MemoryTotalGB,Version | ConvertTo-Html
    $msg += $ds| Select Name,FreeSpaceGB,CapacityGB | ConvertTo-Html


    Disconnect-VIServer -Confirm:$false
}
catch{
    $msg = $_
    $sub = "Alert : Failed ot get ESXI information"
}

$Username = $smtpuser
$Password = ConvertTo-SecureString $smtppass -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $Username, $Password


if($sub){
    Send-MailMessage -SmtpServer $smtpserver -Port $smtpport -From $from -To $to -Body "$msg" -Subject "$sub $((Get-Date).ToString())" -Credential $credential -UseSsl -Verbose -BodyAsHtml
}