#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_siteX","_textX","_garrison","_size","_positionX"];

_siteX = _this select 0;

_garrison = garrison getVariable [_siteX,[]];

_size = [_siteX] call A3A_fnc_sizeMarker;
_positionX = getMarkerPos _siteX;
_estatic = if (_siteX in outpostsFIA) then {"Technicals"} else {"Mortars"};

//sort garrison into unit types
private _units = [ [],[],[],[],[],[],[],[] ];
{
    _units # (switch _x do {
    case (FactionGet(reb,"unitSL")): {0};
    case (FactionGet(reb,"unitCrew")): {1};
    case (FactionGet(reb,"unitRifle")): {2};
    case (FactionGet(reb,"unitMG")): {3};
    case (FactionGet(reb,"unitMedic")): {4};
    case (FactionGet(reb,"unitGL")): {5};
    case (FactionGet(reb,"unitSniper")): {6};
    case (FactionGet(reb,"unitLAT")): {7};
    }) pushBack _x;
} forEach _garrison;

_textX = format [
    "<br/><br/>Garrison men: %1<br/><br/>Squad Leaders: %2<br/>%11: %3<br/>Riflemen: %4<br/>Autoriflemen: %5<br/>Medics: %6<br/>Grenadiers: %7<br/>Marksmen: %8<br/>AT Men: %9<br/>Static Weap: %10"
    , count _garrison
    , count (_units#0)
    , count (_units#1)
    , count (_units#2)
    , count (_units#3)
    , count (_units#4)
    , count (_units#5)
    , count (_units#6)
    , count (_units#7)
    , {_x distance _positionX < _size} count staticsToSave
    , _estatic
];

_textX
