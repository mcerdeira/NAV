# 3 - Se crea un delta entre la base sin modificaciones y la base con modificaciones
#     incluir dlls de addins en la carpeta 3Delta para que sea incluida en el package

Set-ExecutionPolicy unrestricted

Import-Module "C:\Program Files\Microsoft Dynamics NAV\100\Service\NavAdminTool.ps1" | Out-Null

$NavIde = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\finsql.exe"
$NavModelTools = "C:\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client\NavModelTools.ps1"
. $NavModelTools $NavIde | Out-Null

$DemoDatabase = "Demo Database NAV (10-0)"
$SqlServer = "ARNAV001"
$BaseFolder = "C:\NAV\Packages\"
$SourceFileName = (Join-Path $BaseFolder "1Base\Base.txt")
$ModifiedFileNAme = (Join-Path $BaseFolder "2Modified\Modified.txt")
$DeltaFolder = (Join-Path $BaseFolder "3Delta")

if(Test-Path $DeltaFolder)
{
    Remove-Item -Path $DeltaFolder -Recurse -Force
}
mkdir $DeltaFolder


Compare-NAVApplicationObject -Verbose -Original $SourceFileName -Modified $ModifiedFileNAme -Delta $DeltaFolder