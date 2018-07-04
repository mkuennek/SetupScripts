#--- Define Functionssx ---#
function RemoveApp{
    param(
        [string]$name
    )
    Write-Host "Removing " + $name -ForegroundColor "Yellow"
    Get-AppxPackage $name -AllUsers | Remove-AppxPackage
    Get-AppXProvisionedPackage -Online | Where DisplayNam -like $name | Remove-AppxProvisionedPackage -Online
}
function RemoveItemOnDesktop{    param(        [string]$strFileName    )    $desktopPath = [Environment]::GetFolderPath("Desktop")
    $fileToTemove = Join-Path $desktopPath $strFileName
    If (Test-Path $fileToTemove){
	    Remove-Item $fileToTemove
    }}

Disable-UAC

#--- Configuring Windows properties ---
#--- Windows Features ---
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

#--- File Explorer Settings ---
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

#--- Windows Settings ---#
Write-Host "Configuring Windows..." -ForegroundColor "Yellow"
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" "BingSearchEnabled" 0
Set-ItemProperty "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" "AllowCortana" 0
# Uninstall preinstalled apps
Write-Host "Removing preinstalled Apps" -ForegroundColor "Yellow"
RemoveApp "Microsoft.3DBuilder"
RemoveApp "Microsoft.WindowsAlarms"
RemoveApp "*.AutodeskSketchBook"
RemoveApp "Microsoft.BingFinance"
RemoveApp "Microsoft.BingNews"
RemoveApp "Microsoft.BingSports"
RemoveApp "Microsoft.BingWeather"
RemoveApp "king.com.BubbleWitch3Saga"
RemoveApp "Microsoft.WindowsCommunicationsApps"
RemoveApp "king.com.CandyCrushSodaSaga"
RemoveApp "*.DisneyMagicKingdoms"
RemoveApp "DolbyLaboratories.DolbyAccess" 
RemoveApp "*.Facebook"
RemoveApp "Microsoft.MicrosoftOfficeHub"
RemoveApp "Microsoft.GetStarted"
RemoveApp "Microsoft.WindowsMaps"
RemoveApp "*.MarchofEmpires"
RemoveApp "Microsoft.Messaging"
RemoveApp "Microsoft.OneConnect"
RemoveApp "Microsoft.People"
RemoveApp "Microsoft.Print3D"
RemoveApp "Microsoft.SkypeApp"
RemoveApp "*.SlingTV"
RemoveApp "Microsoft.MicrosoftSolitaireCollection"
RemoveApp "SpotifyAB.SpotifyMusic"
RemoveApp "Microsoft.MicrosoftStickyNotes"
RemoveApp "Microsoft.Office.Sway"
RemoveApp "*.Twitter"
RemoveApp "Microsoft.WindowsFeedbackHub"
RemoveApp "Microsoft.WindowsSoundRecorder"
RemoveApp "Microsoft.WindowsPhone"
RemoveApp "Microsoft.XboxApp"
RemoveApp "Microsoft.ZuneMusic" 
RemoveApp "Microsoft.ZuneVideo"
RemoveApp "*.EclipseManager"
RemoveApp "*.Duolingo-LearnLanguagesforFree"
RemoveApp "AdobeSystemsIncorporated.AdobePhotoshopExpress"
RemoveApp "Microsoft.FreshPaint"
RemoveApp "Microsoft.Microsoft3DViewer"
RemoveApp "Microsoft.NetworkSpeedTest"
RemoveApp "Microsoft.WindowsFeedbackHub"
RemoveApp "Microsoft.GetHelp"
RemoveApp "Microsoft.MSPaint"
# Prevent "Suggested Applications" from returning
if (!(Test-Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent")) {New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" -Type Folder | Out-Null}
Set-ItemProperty "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" "DisableWindowsConsumerFeatures" 1

#--- Cleanup Desktop---#
RemoveItemOnDesktop "Microsoft Edge.lnk"

#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula