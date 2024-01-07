Function Write-Log {
    Param(
        [parameter(Mandatory = $True)][string]$log,
        [parameter(Mandatory = $True)][int]$id,
        [parameter(Mandatory = $True)][ValidateSet('Info','Warning','Error')][string[]]$type,
        $eventLog = "Application",
        $eventSource = "NashPowerShell"
    )
    If ([System.Diagnostics.EventLog]::SourceExists($eventSource) -eq $False) {
        New-EventLog -LogName Application -Source $eventSource
    }
    Write-EventLog -LogName $eventLog -EventID $id -EntryType $type -Source $eventSource -Message "$log`nUser - $env:USERNAME" -Category 0
}
