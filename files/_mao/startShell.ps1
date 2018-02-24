Param(
    [ValidateSet( "powershell", "cmd" )]
    [string] $shell,
    [switch] $elevate,
    [switch] $cmder
)


if ($cmder) {

    $ConEmu = "${ENV:CMDER_ROOT}\vendor\conemu-maximus5\ConEmu64.exe"

    $taskName = $shell
    if( $elevate ) {
      $taskName += ".admin"
    }

    $settings = @{
      filePath =      $ConEmu
      argumentList =  "-Single", 
                      "-run {$taskName}",
                      ('-new_console:t:"{0}"' -f $taskName)
    }

    Start-Process @settings

} else {

    $settings = @{
        filePath =  "$shell.exe"
    }
    if ($elevate) {
        $settings.verb = "runas"
    }
    if ($shell -eq "powershell") {
        $settings.argumentList = "-noLogo", "-noExit", "-noProfile", "-executionPolicy RemoteSigned"
    }

    Start-Process @settings

}

# $AdministratorRole = [Security.Principal.WindowsBuiltInRole]::Administrator 
# $CurrentIdentity = [Security.Principal.WindowsIdentity]::GetCurrent() -as [Security.Principal.WindowsPrincipal] 

# if( $elevate -and -not $CurrentIdentity.IsInRole($AdministratorRole) ) { 
# 	Start-Process -filePath Powershell.exe -verb RunAs -argumentList ('-noLogo -noExit -noProfile -executionPolicy RemoteSigned -file "{0}" ' -f $psCommandPath)
#	Exit 
# }
