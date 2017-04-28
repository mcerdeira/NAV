Set-ExecutionPolicy unrestricted

Import-Module "C:\Program Files\Microsoft Dynamics NAV\100\Service\NavAdminTool.ps1" | Out-Null

$NavIde = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\finsql.exe"
$NavModelTools = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\NavModelTools.ps1"
. $NavModelTools $NavIde | Out-Null

$DemoDatabase = "NAV2017ORIGBASE"
$SqlServer = "ARNAV001"
$BaseFolder = "C:\NAV\PS scripts\Export Source\"
$SourceFileName = (Join-Path $BaseFolder "Base.txt")

Export-NAVApplicationObject -Verbose -DatabaseName $DemoDatabase -DatabaseServer $SqlServer -Path $SourceFileName