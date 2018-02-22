Set-Variable -Name n -Value 0

Get-Content -Path .\dirMenu.ini.src -Encoding utf8 |
ForEach-Object -Process {
  if ($_ -match "^menu=") {
    $n++;
    $_ -replace "^menu=", "menu$n="
  }
  elseif ($_ -match '^\s*cmd=') {
    $_ -replace "\s*cmd=", "cmd$n="
  }
  else { $_ }
} |
Set-Content -Path dirMenu-new.ini -Encoding Unicode
Remove-Variable  n


Try {
    Rename-Item -Path dirMenu.ini -NewName dirMenu.ini.bak -Force -ErrorAction Stop
}
Catch [System.Management.Automation.ItemNotFoundException] {
  "item not found"
}
Catch {
  "any other undefined errors"
  Remove-Item -Path dirMenu.ini.bak -Force
  Rename-Item -Path dirMenu.ini -NewName dirMenu.ini.bak -Force
  #$error[0]
}
Finally {
  Rename-Item -Path dirMenu-new.ini -NewName dirMenu.ini
}
