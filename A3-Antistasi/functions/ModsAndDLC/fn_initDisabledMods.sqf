scriptName "fn_initDisabledMods.sqf";
private _fileName = "fn_initDisabledMods.sqf";
private _disabledMods = [];

if (!allowDLCKart) then {_disabledMods pushBack "kart"};
if (!allowDLCMark) then {_disabledMods pushBack "mark"};
if (!allowDLCHeli) then {_disabledMods pushBack "heli"};
if (!allowDLCExpansion) then {_disabledMods pushBack "expansion"};
if (!allowDLCJets) then {_disabledMods pushBack "jets"};
if (!allowDLCOrange) then {_disabledMods pushBack "orange"};
if (!allowDLCTanks) then {_disabledMods pushBack "tanks"};
if (!allowDLCGlobMob) then {_disabledMods pushBack "globmob"};
if (!allowDLCEnoch) then {_disabledMods pushBack "enoch"};
if (!allowDLCOfficialMod) then {_disabledMods pushBack "officialmod"};
if (!allowDLCAoW) then {_disabledMods pushBack "aow"};

[2,format ["Disabled DLC: %1",_disabledMods],_fileName] call A3A_fnc_log;

_disabledMods;
