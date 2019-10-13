$root = $PSScriptRoot;

$folderForPreparedMissions = New-Item -Path $root -Name "PreparedMissions" -ItemType "directory" -Force;

Remove-Item $folderForPreparedMissions -Recurse;

$missionTemplateFolders = Get-ChildItem -Path ".\Map-Templates" ;

$mainDataPath = Join-Path $root 'A3-Antistasi';
$stringTablePath = Join-Path $root 'A3-Antistasi\Stringtable.xml';

$stringTable = New-Object -TypeName XML;
$stringTable.Load($stringTablePath);

$versionId = $stringTable.Project.Package.Container | Where-Object { $_.name -eq "credits_generic" } | ForEach-Object {$_.Key} | Where-Object {$_.ID -eq "STR_antistasi_credits_generic_version_text"} | ForEach {$_.Original};
$formattedVersionId = $versionId.Split("\.") -join "-";

ForEach ($templateFolder in $missionTemplateFolders) {
	$folderName = $templateFolder.Name;
	$pair = $folderName.Split("\.");
	$missionFolderName = $pair[0] + "-" + $formattedVersionId + "." + $pair[1]; 
	$destinationPath = $(Join-Path $folderForPreparedMissions.FullName $missionFolderName);
	Copy-Item -Path $mainDataPath -Destination $destinationPath -Recurse;
	Copy-Item -Path $(Join-Path $templateFolder.FullName "*") -Destination $destinationPath -Recurse -Force;
}