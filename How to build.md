# How to build (Mod)
## Common setup
* install Arma 3 Tools in the same steam library that Arma 3 is installed
## With Vs code Arma Dev Extension
### First time setup
* Install extension from [marketplace](https://marketplace.visualstudio.com/items?itemName=ole1986.arma-dev)
* configure the extension from the Antistasi workspace by opening the command pallet <kbd>Ctrl</kbd>/<kbd>⌘</kbd> + <kbd>P</kbd> and running the `Arma 3: configure` command
* fill in the configuration `.json` file something like this
```json
{
	"title": "A3 Antistasi",
	"name": "A3A",
	"author": "Official Antistasi dev team",
	"website": "https://antistasi.de/",
	"version": "2.5.4",
	"buildPath": "build",
	"privateKey": "", //add the path to a private bikey for signing when building
	"serverDirs": [],
	"serverUse32bit": false,
	"clientDirs": [ //should list all addons the mod provides
        "A3A/addons/core",
        "A3A/addons/Garage",
        "A3A/addons/JeroenArsenal",
        "A3A/addons/maps"
    ],
	"clientMods": [],
	"ftpConnection": {},
    "steamPath": "H:\\SteamLibrary" //arma 3 install steam library, arma 3 tools should be in the same folder
}
```
* Run the command `Extensions: Open Extension Folder` and navigate to `ole1986.arma-dev-0.0.20 -> out -> helpers -> runArma.js -> ln 54` and add `'-debug'` to the list
```js
let args = [
                '2', '1', '0', '-exe', 'arma3_x64.exe',
                '-mod=' + clientMods.join(';'),
                '-nosplash',
                '-world empty',
                '-skipIntro',
                '-debug'
            ];
```
* now run the `Arma 3: Build` command, this will output into your build folder with packed addons (and signed if you have a key designated)
* run the `Arma 3: Toggle code live` command this will create symlinked folders in your arma directory for filepatching, allowing "live editing" of code, by editing the source files (dosnt include anything processed by the config.cpp)
* run the `Arma 3: Run client` or `Arma 3: Run client (with logging)` command
arma should start with everything ready for you, (the logging alternate will open the rpt thats created on arma launch)

## With Arma 3 Tools
### Packing
* open `Addon Builder` from `Arma 3 Tools`
* click options
  * add to `List of files to copy directly` this line `*.p3d;*.paa;*.hpp;*.sqf`
  * click the tree dots next to `Path to project folder` and navigate to the repository's `A3A` folder
  * optionally add a path to a `.biprivatekey` for signing, this allows you to leave key verification on for dedicated server testing
* back in the main window, add a source directory, this will be in turn each addon folder in `repository -> A3A -> addons -> {folder to build}`
* and add a destination folder, this would be for example `repository -> build -> @A3A -> addons`
* ensure for testing that it dosnt binarize the files
* now to simply press build and repeat for each folder in the `A3A -> addons`

### Running
* copy the folder in your build directory to your arma 3 directory (or symbolic link it, recommended)
* in the arma 3 launcher, under the `Mods` tab click `...More` -> `Add watched folder...` -> `Add 'Arma 3' folder`, this will automatically add local mods in yuor arma directory to your mods list for easy loading

### Live editing
* for live editing you need to create this folder structure in your arma 3 directory `x\A3A\addons`, and the create symbolic links from each folder in your repositorys `A3A\addons` folder to the one in your arma directory
* next you need to go in your arma 3 launchers `Parameters` tab and under `All Parameters` section `Advanced` thick of the parameter `Enable File-Pathcing`, then under the section `Author` thick of the parameter `Debug Mode` (i recommend favoriting these two for ease of use later on)
* now when you start with the build loaded under the `Mods` tab, it will start in `Dev` mode and allow for recompilation of functions on the go either by reloading the missing or by calling the function `A3A_fnc_prepFunctions`
