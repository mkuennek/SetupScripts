function RemoveItemOnDesktop{    param(        [string]$strFileName    )    $desktopPath = [Environment]::GetFolderPath("Desktop")
    $fileToTemove = Join-Path $desktopPath $strFileName
    If (Test-Path $fileToTemove){
	    Remove-Item $fileToTemove
    }}Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/mkuennek/SetupScripts/master/CleanWindows.ps1
Disable-UAC

#--- Utility Programs ---#
choco install -y Microsoft-Hyper-V-All -source windowsFeatures
choco install -y sysinternals
choco install -y docker-for-windows
choco install 7zip.install
choco install notepadplusplus.install

#--- Cleanup Desktop---#
RemoveItemOnDesktop "Docker for Windows.lnk"

Enable-UAC