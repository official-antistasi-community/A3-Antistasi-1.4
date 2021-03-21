# ❗❗ HEY YOU, READ THIS! &nbsp;&nbsp; HEY DU, LIES DAS! ❗❗
### 👉 BASIC AND QUICK START 👈
0.  Run arma.
1.  Make empty mp-mission on any map (community or official) with just one player.
2.  Save and close editor.
3.  Copy Everything in this folder (includes: /Collections/; /function/; /description.ext; /functions.hpp; /NG_importGUI.hpp)
4.  Paste into the folder of the mp mission you created. Usually in `C:\Users\User\Documents\Arma 3 - Other Profiles\YOUR_ARMA_NAME\mpmissions\MISSION_NAME.MAP\`
5.  Start host LAN multiplayer.
6.  Run and join mission.
7.  Press `Esc` on your keyboard to open debug console.
8.  Paste `[50,15] spawn A3A_fnc_NG_main` into big large debug window.
9.  Click the button `Local Exec`.
10. Wait for hint to say `Done`&`navGridDB copied to clipboard!`
11. Open a new file.
12. Paste into the new file.
13. Save.

<br/>
<br/>

***
***
*Visual Studio Code has a markdown preview button in the top-right corner.*
<br/>
<br/>


# 🗺 Generate navGridDB
Executing `[] spawn A3A_fnc_NG_main` will run with default settings.<br/>
However, you may need to tweak some arguments depending on the simplification level required for the map.<br/>

### ⚙ A3A_fnc_NG_main Arguments:
1.  <SCALAR> Max drift is how far the simplified line segment can stray from the road in metres. (Default = 50)
2.  <SCALAR> Junctions are only merged if within this distance from each other. (Default = 15)
3.  <BOOLEAN> True to start the drawing script automatically. (Default = false)

So running with default settings would also look like this `[50,15] spawn A3A_fnc_NG_main;`<br/>
To run with default and just draw use `[nil,nil,true] spawn A3A_fnc_NG_main;`<br/>
Max drift is not the only thing that affects road simplification: It will only simplify if the nearestTerrainObject from its position will still return one of it's neighbouring roads. This prevents virtual convoys that are trying to spawn vehicles from jumping to another nearby road because that is the closest navGrid node.

# 📍 Draw Markers
**Run after you have generate a navGrid or have imported one.**<br/>
To draw markers with default settings run `[] spawn A3A_fnc_NG_main_draw;`<br/>
You can re-run this command as much as you want, everytime it will delete the old markers and redraw new. (But please wait for the last one to finish otherwise bad things will happen.)<br/>

### ⚙ Here are some settings which you can tweak:
1.  <SCALAR> Thickness of line, 1-high density, 4-normal, 8-Stratis world view, 16-Seattle world view. (Set to 0 to disable) (Default = 4)
2.  <BOOLEAN> False if line partially transparent, true if solid and opaque. (Default = false)
3.  <BOOLEAN> True to draw distance between road segments. (Only draws if above 5m) (Default = false)
4.  <SCALAR> Size of road node dots. (Set to 0 to disable) (Default = 0.8)
5.  <SCALAR> Size of island dots. (Set to 0 to disable) (Default = 1.5)

Therefore, the default execution would also look like this: `[4,false,false,0.8,1] spawn A3A_fnc_NG_main_draw;`<br/>

### 🆓 Presents:
* Inspect road network overview `[6,true,false,0,1] spawn A3A_fnc_NG_main_draw;`
* Inspect Junctions `[1,false,false,0.4,0.8] spawn A3A_fnc_NG_main_draw;`
* Only road dots and islands: `[0,false,false,0.8,1] spawn A3A_fnc_NG_main_draw;`
* Only large lines and distances: `[6,false,true,0,0] spawn A3A_fnc_NG_main_draw;`

# 📥 Import navGridDB
If you have already generated a navGridDB before loading the world and you do not want to regenerate it again: you can use the import function to load it into Arma 3 for viewing or editing.

1. Copy, paste, and local exec `[] spawn A3A_fnc_NG_import` in the debug console.
2. Press `Continue` to close debug console. (If you press `Esc`, you will close the import dialogue!)
3. Switch to real-life and open the navGridDB file and Copy everything.
4. Switch to Arma 3 and paste it into the editBox and press the the import button.

# 🔎 Further Reading
You can find further satisfying and accurate documentation on all sorts of things by looking into the headers of files in `./functions/NavGridPP/`.

<br/>
<br/>

***

![Unit_traits_hint](https://i.imgur.com/wAMAYlX.png)
