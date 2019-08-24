private ["_siteX","_textX","_garrison","_size","_positionX"];

_siteX = _this select 0;

_garrison = garrison getVariable [_siteX,[]];

_size = [_siteX] call A3A_fnc_sizeMarker;
_positionX = getMarkerPos _siteX;
_estatic = if (_siteX in outpostsFIA) then {"Technicals"} else {"Mortars"};
_textX = format ["\n\nGarrison men: %1\n\nSquad Leaders: %2\n%11: %3\nRiflemen: %4\nAutoriflemen: %5\nMedics: %6\nGrenadiers: %7\nMarksmen: %8\nAT Men: %9\nStatic Weap: %10", count _garrison, {_x in REBELsquadLeader} count _garrison, {_x == REBELstaticCREW} count _garrison, {_x in REBELliteAT} count _garrison, {_x in REBELsoldierMG} count _garrison,{_x in REBELmedic} count _garrison,{_x in REBELsoldierGL} count _garrison,{_x in REBELsniper} count _garrison,{_x in REBELsoldierAT} count _garrison, {_x distance _positionX < _size} count staticsToSave, _estatic];

_textX