param (
    [string]$modFileName = "mod.cpp",
    [string]$metaFileName = "meta.cpp"
)

"Meta file name: $metaFileName`n`n"
Push-Location

Set-Location "$PSScriptRoot\..\..\A3A"

"`nGet version number"
$versionFile = (Get-Content addons\core\Includes\script_version.hpp)
$version = ""
ForEach($line in $versionFile) {
    if (($line) -match "(?<= )([\w\d]*)(?![ \w\d])") {
        $version += $Matches[0] + "."
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

"`nCopy meta.cpp..."
Copy-Item "meta\$metaFileName" $addonOutLocation
Push-Location
Set-Location $addonOutLocation
Rename-Item $metaFileName "meta.cpp"
Pop-Location

"`nCreate key..."
Push-Location
Set-Location "$PSScriptRoot\..\..\build"

.$PSScriptRoot\..\DSSignFile\DSCreateKey "Antistasi $version"
Copy-Item "Antistasi $version.bikey" "$addonOutLocation\Keys\Antistasi $version.bikey" -Force

"`nSign PBO files..."
Push-Location
Set-Location $addonsOutLocation
$pboFiles = Get-ChildItem -Path $addonsOutLocation -Name "*.pbo"
forEach ($file in $pboFiles) {
    "Signing file $file ..."
    .$PSScriptRoot\..\DSSignFile\DSSignFile "..\..\Antistasi $version.biprivatekey" $file
}

Remove-Item "..\..\Antistasi $version.biprivatekey"
Remove-Item "..\..\Antistasi $version.bikey"

Pop-Location

Pop-Location

Pop-Location

$displayTime = Get-Date -DisplayHint DateTime
"Antistasi builder ran at: $displayTime"
"Antistasi version: $version build complete"