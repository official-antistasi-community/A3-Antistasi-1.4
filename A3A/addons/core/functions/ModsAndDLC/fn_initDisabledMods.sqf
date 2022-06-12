scriptName "fn_initDisabledMods.sqf";
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _disabledMods = [];

if (!allowDLCKart) then {_disabledMods pushBack "kart"};
if (!allowDLCMark) then {_disabledMods pushBack "mark"};
if (!allowDLCHeli) then {_disabledMods pushBack "heli"};
if (!allowDLCExpansion) then {_disabledMods pushBack "expansion"};
if (!allowDLCJets) then {_disabledMods pushBack "jets"};
if (!allowDLCOrange) then {_disabledMods pushBack "orange"};
if (!allowDLCTanks) then {_disabledMods pushBack "tanks"};
if (!allowDLCGlobMob) then {_disabledMods pushBack "gm"};
if (!allowDLCEnoch) then {_disabledMods pushBack "enoch"};
if (!allowDLCAoW) then {_disabledMods pushBack "aow"};
if (!allowDLCVN) then {_disabledMods pushBack "vn"};
if (!allowDLCWS) then {_disabledMods pushBack "ws"};

Info_1("Disabled DLC: %1",_disabledMods);

_disabledMods;
