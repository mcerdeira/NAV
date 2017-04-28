# 5- Se crea el archivo manifest

Set-ExecutionPolicy unrestricted

Import-Module "C:\Program Files\Microsoft Dynamics NAV\100\Service\NavAdminTool.ps1" | Out-Null

$NavIde = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\finsql.exe"
$NavModelTools = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\NavModelTools.ps1"
. $NavModelTools $NavIde | Out-Null

$AppId = "0e339c88-7f1b-4fcf-afc9-e3fe120ff033"
$AppManifestName = "Axxon Feature 001"
$AppManifestPublisher = "Axxon Consulting S.A."
$AppManifestVersion = "1.0.0.0"
$AppManifestDescription = "Axxon demo feature for Madeira"
$BaseFolder = "C:\NAV\Packages\"
$AppManifestFileName = (Join-Path $BaseFolder "AppManifest.xml")

New-NAVAppManifest -Id $AppId `
                    -Name $AppManifestName `
                    -Publisher $AppManifestPublisher `
                    -Version $AppManifestVersion `
                    -Description $AppManifestDescription `
                    | New-NAVAppManifestFile -Path $AppManifestFileName -Verbose -Force

& NotePad $AppManifestFileName