private ["_unit","_lider","_aeropuertos","_base","_loadOut"];

_unit = _this select 0;
if (isPlayer _unit) exitWith {};
_lider = _unit getVariable ["owner",leader group _unit];
if (!isPlayer _lider) exitWith {};
if (!captive _lider) exitWith {};
if (captive _unit) exitWith {};
[_unit,true] remoteExec ["setCaptive",0,_unit];
_unit setCaptive true;
_unit disableAI "TARGET";
_unit disableAI "AUTOTARGET";
_unit setUnitPos "UP";
_loadOut = getUnitLoadout _unit;
_unit setUnitLoadout (selectRandom arrayCivs);

//_aeropuertos = aeropuertos + puestos;// + (controles select {isOnRoad getMarkerPos _x});
while {(captive _lider) and (captive _unit)} do
	{
	sleep 1;
	if ((vehicle _unit != _unit) and (not((typeOf vehicle _unit) in arrayCivVeh))) exitWith {};
	//_base = [_aeropuertos,player] call BIS_fnc_nearestPosition;
	//_size = [_base] call A3A_fnc_sizeMarker;
	//if ((_unit inArea _base) and (not(lados getVariable [_base,sideUnknown] == buenos))) exitWith {[_unit,false] remoteExec ["setCaptive"]};
	if ((primaryWeapon _unit != "") or (secondaryWeapon _unit != "") or (handgunWeapon _unit != "")) exitWith {};
	};

//_unit removeAllEventHandlers "FIRED";
if (!captive _unit) then {_unit groupChat "Shit, they have spotted me!"} else {[_unit,false] remoteExec ["setCaptive",0,_unit]; _unit setCaptive false};
if (captive player) then {sleep 5};
_unit enableAI "TARGET";
_unit enableAI "AUTOTARGET";
_unit setUnitPos "AUTO";
_unit setUnitLoadout _loadOut;
