_nul=createDialog "first_load";

_bypass = false;

if (count _this > 0) then {_bypass = true};
//bypass es true cuando un JIP carga
waitUntil {dialog};
hint "W A R N I N G\n\nREAD THIS!!!\n\n\nAntistasi does NOT support vanilla save. Do not expect 100% of functionalities if you Save&Exit and after you come back with Resume option. Both on SP and MP.\n\n\nAntistasi has an in built save system, GTA alike, which is the system you have to use in order to have full functionalities.\n\nTo Save: Go to the Map Board, select ""Game Options"" and hit on ""Persistent Save"" button.\n\nTo load: RESTART the game and click YES on this window";
waitUntil {!dialog};
