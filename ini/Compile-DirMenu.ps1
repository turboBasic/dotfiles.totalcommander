Set-Variable -Name n -Value 0

Get-Content -Path .\DirMenu.ini.src -Encoding utf8 |
ForEach-Object -Process {
  if ($_ -match "^menu=") {
    $n++;
    $_ -replace "^menu=", "menu$n="
  }
  elseif ($_ -match '^cmd=') {
    $_ -replace "^cmd=", "cmd$n="
  }
  else { $_ }
} |
Set-Content -Path DirMenu-new.ini -Encoding Unicode
Remove-Variable  n


Try {
    Rename-Item -Path DirMenu.ini -NewName DirMenu.ini.bak -Force -ErrorAction Stop
}
Catch [System.Management.Automation.ItemNotFoundException] {
  "item not found"
}
Catch {
  "any other undefined errors"
  Remove-Item -Path DirMenu.ini.bak -Force
  Rename-Item -Path DirMenu.ini -NewName DirMenu.ini.bak -Force
  #$error[0]
}
Finally {
  Rename-Item -Path DirMenu-new.ini -NewName DirMenu.ini
}
