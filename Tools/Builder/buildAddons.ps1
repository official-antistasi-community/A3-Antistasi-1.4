param (
    [string]$modFileName = "mod.cpp",
    [string]$WorkshopID = ""
)

"Workshop ID: $WorkshopID`n`n"
Push-Location

Set-Location "$PSScriptRoot\..\..\A3A"

"`nGet version number"
$versionFile = (Get-Content addons\core\Includes\script_version.hpp)
$version = ""
ForEach($line in $versionFile) {
    if (($line) -match "(?<= )([\w\d]*)(?![ \w\d])") {
        $version += $Matches[0] + "-"
    }
}
$version = $version.Substring(0, $version.Length -1)

"Setup temporary directories..."
if (Test-Path "..\build") {
    Remove-Item -Path "..\build" -Recurse -Force
}
New-Item -Path "..\build" -ItemType Directory -Force > $null
New-Item -Path "..\build\A3A" -ItemType Directory -Force > $null
New-Item -Path "..\build\A3A\addons" -ItemType Directory -Force > $null
New-Item -Path "..\build\A3A\Keys" -ItemType Directory -Force > $null

$addonLocation = "." # We are here already
$addonOutLocation = "$PSScriptRoot\..\..\build\A3A"
$addonsOutLocation = "$addonOutLocation\addons"

"`nBuild addons..."
$modules = Get-Childitem "$addonLocation\addons" -Directory
foreach ($module in $modules) {
    $pboName = "$($module.Name).pbo"
    #"Building $pboName...  $addonLocation\addons\$($module.Name)   -> $addonsOutLocation\$pboName"
    "Building $pboName ..."
    .$PSScriptRoot\hemtt armake pack --force $module.fullName "$addonsOutLocation\$pboName"
}

"`nCopy mod.cpp..."
Copy-Item "$modFileName" $addonOutLocation
Push-Location
Set-Location $addonOutLocation
Rename-Item $modFileName "mod.cpp"
Pop-Location

"`nCreating meta string..."
$modName = switch ($WorkshopID) {
    "2867537125" {"`nname = ""Antistasi - The Mod"";"}
    "2729074499" {"`nname = ""[Dev1] Antistasi Dev Build"";"}
    "2873632521" {"`nname = ""[Dev2] Antistasi Dev Build"";"}
    Default {""}
}

$metaContents = if ([String]::IsNullOrEmpty($WorkshopID)) {
    "protocol = 1;$modName"
} else {
    "protocol = 1;`npublishedid = $WorkshopID;$modName"
}

"`nCreating meta.cpp..."
Set-Location $addonOutLocation
New-Item "meta.cpp"
Set-Content "meta.cpp" $metaContents
Pop-Location

"`nCreate key..."
$keyName = switch ($WorkshopID) {
    "2867537125" {"antistasi"}
    "2729074499" {"antistasi_dev1"}
    "2873632521" {"antistasi_dev2"}
    Default {"a3a"}
}
Push-Location
Set-Location "$PSScriptRoot\..\..\build"

.$PSScriptRoot\..\DSSignFile\DSCreateKey "$keyName"
Copy-Item "$keyName.bikey" "$addonOutLocation\Keys\$keyName.bikey" -Force

"`nSign PBO files..."
Push-Location
Set-Location $addonsOutLocation
$pboFiles = Get-ChildItem -Path $addonsOutLocation -Name "*.pbo"
forEach ($file in $pboFiles) {
    "Signing file $file ..."
    .$PSScriptRoot\..\DSSignFile\DSSignFile "..\..\$keyName.biprivatekey" $file
}

Remove-Item "..\..\$keyName.biprivatekey"
Remove-Item "..\..\$keyName.bikey"

Pop-Location

Pop-Location

Pop-Location

$displayTime = Get-Date -DisplayHint DateTime
"Antistasi builder ran at: $displayTime"
"Antistasi version: $version build complete"
