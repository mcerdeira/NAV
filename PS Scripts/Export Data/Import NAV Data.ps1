Set-ExecutionPolicy unrestricted

Import-Module "C:\Program Files\Microsoft Dynamics NAV\100\Service\NavAdminTool.ps1" | Out-Null

$NavIde = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\finsql.exe"
$NavModelTools = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\NavModelTools.ps1"
. $NavModelTools $NavIde | Out-Null

Import-NAVData -ServerInstance "NAV2017DEVBASE" -CompanyName "LOC CRONUS ARG" -FilePath "C:\NAV\PS scripts\Export Data\LOC_ARG.navdata" -Verbose 