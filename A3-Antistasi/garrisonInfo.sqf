private ["_siteX","_textX","_garrison","_size","_positionX"];

_siteX = _this select 0;

_garrison = garrison getVariable [_siteX,[]];

_size = [_siteX] call A3A_fnc_sizeMarker;
_positionX = getMarkerPos _siteX;
_estatic = if (_siteX in rebelWatchpostsAndRoadblocks) then {"Technicals"} else {"Mortars"};
_textX = format ["\n\nGarrison men: %1\n\nSquad Leaders: %2\n%11: %3\nRiflemen: %4\nAutoriflemen: %5\nMedics: %6\nGrenadiers: %7\nMarksmen: %8\nAT Men: %9\nStatic Weap: %10", count _garrison, {_x in rebelSquadLeader} count _garrison, {_x == rebelStaticCrew} count _garrison, {_x in rebelLiteAT} count _garrison, {_x in rebelHeavyGunner} count _garrison,{_x in rebelMedic} count _garrison,{_x in rebelGrenadier} count _garrison,{_x in rebelSniper} count _garrison,{_x in rebelAT} count _garrison, {_x distance _positionX < _size} count staticsToSave, _estatic];

_textX