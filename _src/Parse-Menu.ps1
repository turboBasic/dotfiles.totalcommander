#   Parse Total Commander menu file
#
#   (c) 2017  @turboBasic
#

function Parse-Menu {

    [CmdletBinding()]
    PARAM(
      [parameter( Mandatory, ValueFromPipeline )]
      [string[]] $inputObject,

      [parameter( Mandatory )]
      [alias( "path" )]
      [string] $menuPath
    )


    function private:Get-BuildName( [string]$menuPath ) { 
        Resolve-Path -path $menuPath | 
            Get-Item | 
            Select -expandProperty BaseName
    }

    function private:Get-MenuText( [string]$menuPath ) {
        Get-Content -path $menuPath |
            ForEach-Object {
              $text = $_.Trim()
              if($text -ne '') { $text }
            }
    }

    function private:Get-Pattern() {
        $private:cCommand = '[$-._a-zA-Z0-9]+'
        $private:cString =  '\" ( [^\r\n]+ )\" '   

        Return ([PSCustomObject] @{
          MenuItem =      [regex] "(?ix) ^\s* MENUITEM \s+ ${cString} \s* , \s* ( ${cCommand} ) \s* $"
          MenuLevelUp =   [regex] "(?ix) ^\s* POPUP \s+ ${cString} \s* $"
          MenuLevelDown = [regex] "(?ix) ^\s* END_POPUP \s* $"
          HelpBreak =     [regex] "(?ix) ^\s* HELP_BREAK \s* $"
          StartMenu =     [regex] "(?ix) ^\s* STARTMENU \s* $"
          MenuSeparator = [regex] "(?ix) ^\s* MENUITEM \s+ SEPARATOR \s* $"
          Comment =       [regex] "(?x)  ^\s*\; "
        })
    }


    $menuPrefix = @()

    Get-MenuText $menuPath | 
      Where-Object{ 
          ($_ -notMatch (Get-Pattern).MenuSeparator) -And
          ($_ -notMatch (Get-Pattern).Comment) 
      } | 
      ForEach-Object {
        if($_ -match (Get-Pattern).MenuLevelUp) { 
            $menuPrefix += $Matches[1]
        } 
        elseif($_ -match (Get-Pattern).MenuLevelDown) {
            $menuPrefix = $menuPrefix[ 0 .. ($menuPrefix.Count-2) ]
        }
        elseif($_ -match (Get-Pattern).MenuItem) {
            [PSCustomObject]@{
              build =     Get-BuildName $menuPath
              menu =      $menuPrefix + $Matches[1]
              command =   $Matches[2]
            }
        } 
        elseif($_ -match (Get-Pattern).HelpBreak) {
            [PSCustomObject]@{
              build =     Get-BuildName $menuPath
              menu =      'HelpBreak'
              command =   'HelpBreak'
            }
        }
        elseif($_ -match (Get-Pattern).StartMenu) {
            [PSCustomObject]@{
              build =     Get-BuildName $menuPath
              menu =      'StartMenu'
              command =   'StartMenu'
            }
        }
        else {
          Write-Warning "Wrong input in the line $_"
        }

      }
}      


function Get-Result {
    Parse-Menu D:\tools\TC\language\wcmd_win10amd64_1_eng.mnu |
      ft    @{ Label="Menu";    Expression={$_.Menu -join ' / '}; Width=180 }, 
            @{ Label="Command"; Expression={$_.Command };         Width=40  } -wrap

    Parse-Menu D:\tools\TC\language\wcmd_win10amd64_1_eng.mnu | 
          Select Command, Menu | 
          %{ [PSCustomObject]@{ 
                  Command = $_.Command
                  Menu=     $_.Menu -join '//' 
             }
          } | 
          Out-Gridview
}
