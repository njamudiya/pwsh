Function Get-FileSize {
 
  Param(
    [String]$FilePath
  )

  [int]$Length = (Get-Item $FilePath).length
 
  If ($Length -ge 1TB) {
    return "{0:N2} TB" -f ($Length / 1TB)
  }
  elseif ($Length -ge 1GB) { 
    return "{0:N2} GB" -f ($Length / 1GB)
  }
  elseif ($Length -ge 1MB) {
    return "{0:N2} MB" -f ($Length / 1MB)
  }
  elseif ($Length -ge 1KB) {
    return "{0:N2} KB" -f ($Length / 1KB)
  }
  else {
    return "$($Length) bytes"
  }
}
