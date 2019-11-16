params ["_pos"];

_mainMarker = [_pos] call A3A_fnc_getClosestMainMarker;

_navPoints =  missionNamespace getVariable [(format ["%1_data", _mainMarker]), []];

_currentNearest = objNull;
_currentDistance = 0;

{
    _data = navGrid select _x;
    _navPos = _data select 1;

    _distance = _navPos distance _pos;
    if((!(_currentNearest isEqualType 1)) || {_currentDistance > _distance}) then
    {
      _currentNearest = _x;
      _currentDistance = _distance;
    };
} forEach _navPoints;

_currentNearest;
