# Este paso es solo para NAV
Set-ExecutionPolicy unrestricted

Import-Module "C:\Program Files\Microsoft Dynamics NAV\100\Service\NavAdminTool.ps1" | Out-Null

$NavIde = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\finsql.exe"
$NavModelTools = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\NavModelTools.ps1"
. $NavModelTools $NavIde | Out-Null

$BaseFolder = "C:\NAV\Packages\"
$AppPackageFileName = (Join-Path $BaseFolder "AppPackage.navx")
$ServerInstance = "DynamicsNAV100"

Install-NAVApp -ServerInstance $ServerInstance -Tenant Default -Path $AppPackageFileName
#Uninstall-NAVApp -ServerInstance $ServerInstance -Path $AppPackageFileName -Tenant Default