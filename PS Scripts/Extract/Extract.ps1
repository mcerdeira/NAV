Set-ExecutionPolicy unrestricted

Import-Module "C:\Program Files\Microsoft Dynamics NAV\100\Service\NavAdminTool.ps1" | Out-Null

$NavIde = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\finsql.exe"
$NavModelTools = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\NavModelTools.ps1"
. $NavModelTools $NavIde | Out-Null

$DemoDatabase = "NAV2017DEVBASE"
$SqlServer = "ARNAV001"
$BaseFolder = "C:\NAV\PS scripts\Export Source\"
$ModifiedFileNAme = (Join-Path $BaseFolder "Modified.txt")
$SourceFileName = (Join-Path $BaseFolder "Base.txt")
$DeltaFolder = (Join-Path $BaseFolder "Delta")

Export-NAVApplicationObject -Verbose -DatabaseName $DemoDatabase -DatabaseServer $SqlServer -Path $ModifiedFileNAme

if(Test-Path $DeltaFolder)
{
    Remove-Item -Path $DeltaFolder -Recurse -Force
}
mkdir $DeltaFolder

Compare-NAVApplicationObject -Verbose -Original $SourceFileName -Modified $ModifiedFileNAme -Delta $DeltaFolder