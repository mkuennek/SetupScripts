Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/mkuennek/SetupScripts/master/BasicSetup.ps1

Disable-UAC

#--- Visual Studio ---#
choco install visualstudio2017enterprise --package-parameters "--add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Component.Git --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.Universal"
RefreshEnv
choco install visualstudio2017-workload-manageddesktop
choco install visualstudio2017-workload-nativedesktop
choco install visualstudio2017-workload-universal

#-- Visual Studio Extensions ---#
choco install resharper
choco install stylecop

Enable-UAC