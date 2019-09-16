if (hasInterface) then {
  [] call A3A_fnc_loadPlayer;
};

if (!isMultiplayer) then {
  [] execVM "statSave\loadServer.sqf";
};
