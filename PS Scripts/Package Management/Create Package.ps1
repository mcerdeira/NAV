# 6 - Se crea el package
#     incluir dlls de addins en la carpeta 3Delta para que sea incluida en el package

Set-ExecutionPolicy unrestricted

Import-Module "C:\Program Files\Microsoft Dynamics NAV\100\Service\NavAdminTool.ps1" | Out-Null

$NavIde = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\finsql.exe"
$NavModelTools = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\NavModelTools.ps1"
. $NavModelTools $NavIde | Out-Null

$BaseFolder = "C:\NAV\Packages\"
$DeltaFolder = (Join-Path $BaseFolder "3Delta")
$AppManifestFileName = (Join-Path $BaseFolder "AppManifest.xml")
$AppPackageFileName = (Join-Path $BaseFolder "AppPackage.navx")

Get-NAVAppManifest -Path $AppManifestFileName `
                   | New-NAVAppPackage -Verbose `
                   -Path $AppPackageFileName `
                   -SourcePath $DeltaFolder `
                   -Force