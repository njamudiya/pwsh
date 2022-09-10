Param([String]$pass)

try{
    Connect-VIServer 192.168.1.20 -User 'srini' -Password 'rM)xBj7#'
    Get-VM
    Disconnect-VIServer -Confirm:$false
}
catch{

}

$msg = "Test Email"
$User = "smtp@jamudiya.live"
$cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, ($pass| ConvertTo-SecureString)
try{
    Send-MailMessage -SmtpServer smtp.zoho.in -Port 587 -From smtp@jamudiya.live -To nitish@jamudiya.live -Body $msg -Subject "VMInfo $((Get-Date).ToString())" -Credential $cred -UseSsl -Verbose
}
catch{
    Write-Host "Failed to send email"
    Write-Host "Script output - `n$msg"
}