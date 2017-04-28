# 1 - Exportamos la base sin modificaciones

Set-ExecutionPolicy unrestricted

Import-Module "C:\Program Files\Microsoft Dynamics NAV\100\Service\NavAdminTool.ps1" | Out-Null

$NavIde = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\finsql.exe"
$NavModelTools = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\NavModelTools.ps1"
. $NavModelTools $NavIde | Out-Null

$DemoDatabase = "Demo Database NAV (10-0)"
$SqlServer = "ARNAV001"
$BaseFolder = "C:\NAV\Packages\"
$SourceFileName = (Join-Path $BaseFolder "1Base\Base.txt")


Export-NAVApplicationObject -Verbose -DatabaseName $DemoDatabase -DatabaseServer $SqlServer -Path $SourceFileName