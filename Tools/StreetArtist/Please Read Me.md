# 🚀 Quick Start Guide
0.  Run Arma 3.
1.  Make an empty mp-mission on any map (community or official) with just one player.
2.  Save and close the editor.
3.  Locate the folder `A3-Antistasi\Tools\StreetArtist\`.
4.  Copy Everything in this folder (includes: /Collections/; /functions/; /description.ext; /functions.hpp; /NG_importGUI.hpp; /init.sqf)
5.  Paste into the folder of the mp mission you created. Usually in `C:\Users\User\Documents\Arma 3 - Other Profiles\YOUR_ARMA_NAME\mpmissions\MISSION_NAME.MAP\`
6.  Start host LAN multiplayer.
7.  Run and join the mission.
8.  Click **Generate NavGridDB with Default Settings**.
9.  Look down, and wait for the map to automatically open.
10. Alt-tab from Arma, and open a new file.
11. Paste into the new file.
12. Save.

<br/>
<br/>

***

# ✏ Directly open the StreetArtist Editor
See [Steet Artist Editor](https://github.com/official-antistasi-community/A3-Antistasi/wiki/Street-Artist-Editor) for A3-Antistasi navGrid Guidelines (and GIFs!).<br/>

## 📥 Import Exising navGridDB
If you have already generated a navGridDB before loading the world and you do not want to regenerate it again: you can use the import function to load it into Arma 3 for viewing or editing.

1. Click **Import Existing NavGridDB**.
2. Alt-tab to desktop and open the navGridDB file and Copy everything.
3. Switch to Arma 3 and paste it into the editBox and press the the import button.<br/>

## 🏜 Start Fresh from an Empty Grid
If the map road connections are too messy, you may prefer to draw the map yourself.<br/>
To do so, click **Start Fresh from an Empty Grid**.

<br/>
<br/>

***

# 🗺 NavGridDB Generation
Looking down gives the best performance during this process. You can lower render distance if it helps.<br/>
However, you may need to tweak some arguments depending on the simplification level required for the map.<br/>
### ⚙ Start with Custom Settings
1. From the Hello window, you can click **Close Menu to use Command Line**.
2.  Press `Esc` on your keyboard to open debug console.
3.  Paste `[nil,nil,nil] spawn A3A_fnc_NG_main` into big large debug window (replace nils with selected arguments).
4. Click the button `Local Exec`.

**Arguments:**
1.  `<SCALAR>` Max drift is how far the simplified line segment can stray from the road in metres. (Default = 50)
2.  `<SCALAR>` Junctions are only merged if within this distance from each other. (Default = 15)
3.  `<BOOLEAN>` True to automatically start the StreetArtist Editor. (Default = true)

To run with default and not edit use `[nil,nil,false] spawn A3A_fnc_NG_main;`<br/>
Max drift is not the only thing that affects road simplification: It will only simplify if the nearestTerrainObject from its position will still return one of it's neighbouring roads. This prevents virtual convoys that are trying to spawn vehicles from jumping to another nearby road because that is the closest navGrid node.<br/>
Note that if the junction merge distance is too large, urban areas might have intersections merge (But this can be fixed in the StreetArtist Editor).<br/>

### 🔄 Multiple Simplification Iterations
Sometimes a map's roads might be complex and messay. As a tempory solution you can increase the simplification steps to cut down a few nodes and connections. Before running `A3A_fnc_NG_main` Set the variable `A3A_NGSA_generation_simplifyLoops = 5;` or a smaller number. More than 5 loops ussually don't make any impact on the nav grid.<br/>
This is complimented well by increasing the junction merge distance to `20` metres.
### ☢ Data Model Assertions
If you discover a map that causes StreetArtist to produce errors and corrupted data, well done! If you want to fix the problem yourself, great! You can set `A3A_NGSA_navRoad_assert = true;` and `A3A_NGSA_navRoadHM_assert = true;` before running `A3A_fnc_NG_main`. This will ussually take 10x longer to run, but it will show you where data corruption first appears.


***

![Unit_traits_hint](https://i.imgur.com/wAMAYlX.png)
