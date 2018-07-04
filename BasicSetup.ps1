Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/mkuennek/SetupScripts/master/CleanWindows.ps1
Disable-UAC

#--- Utility Programs ---#
choco install -y Microsoft-Hyper-V-All -source windowsFeatures
choco install -y sysinternals
choco install -y docker-for-windows
choco install 7zip.install
choco install notepadplusplus.install

Enable-UAC