$a = gc .\associations.ini |
     %{ $_.trim() } |
     ?{ $_ -match "^Filter[0-9]+" } |
     %{ $_ -replace '\t', ' ' } |
     %{ $_ -replace '(?<=^Filter)(\d{1})(?=\D)', '00$1' } |
     %{ $_ -replace '(?<=^Filter)(\d{2})(?=\D)', '0$1' } |
     %{ $_ -replace '(?<=^Filter\d+)=', ' ext '} |
     %{ $_ -replace '(?<=^Filter\d+)\.icon=', ' icon ' } |
     %{ $_ -replace '(?<=^Filter\d+)_open=', ' open ' }
$a = $a -join "`n"

$a -replace     'Filter(?<n>\d+) ext (?<ext>[^\n]+)(\nFilter\k<n> icon (?<icon>[^\n]+))?(\nFilter\k<n> open (?<open>[^\n]+))?', 
                "`${n}`t`${ext}`t`${icon}`t`${open}"