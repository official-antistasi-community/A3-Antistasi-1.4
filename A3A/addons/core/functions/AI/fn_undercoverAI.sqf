// Note: leader might not be group leader, so locality isn't guaranteed. This case is a bit broken (disableAI etc)
// AIs may even switch locality mid-function
private ["_unit","_LeaderX","_airportsX","_base","_loadOut", "_oldBehaviour"];

_unit = _this select 0;
if (isPlayer _unit) exitWith {};
_LeaderX = _unit getVariable ["owner",leader group _unit];
if (!isPlayer _LeaderX) exitWith {};
if (!captive _LeaderX) exitWith {};
if (captive _unit) exitWith {};
[_unit,true] remoteExec ["setCaptive",_unit];
_unit setCaptive true;
_unit disableAI "TARGET";
_unit disableAI "AUTOTARGET";

_oldBehaviour = combatBehaviour _unit;		// actually the same as behaviour _unit?

_unit setCombatBehaviour "CARELESS";
_unit setUnitPos "UP";
_loadOut = getUnitLoadout _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeAllWeapons _unit;
_unit forceAddUniform (selectRandom (A3A_faction_civ get "uniforms"));
removeHeadgear _unit;
removeGoggles _unit;

//_airportsX = airportsX + outposts;// + (controlsX select {isOnRoad getMarkerPos _x});
while {(captive _LeaderX) and (captive _unit)} do
	{
	sleep 1;
	if ((vehicle _unit != _unit) and (not((typeOf vehicle _unit) in undercoverVehicles))) exitWith {};
	//_base = [_airportsX,player] call BIS_fnc_nearestPosition;
	//_size = [_base] call A3A_fnc_sizeMarker;
	//if ((_unit inArea _base) and (not(sidesX getVariable [_base,sideUnknown] == teamPlayer))) exitWith {[_unit,false] remoteExec ["setCaptive"]};
	if ((primaryWeapon _unit != "") or (secondaryWeapon _unit != "") or (handgunWeapon _unit != "")) exitWith {};
	};

//_unit removeAllEventHandlers "FIRED";
if (!captive _unit) then {_unit groupChat "Shit, they have spotted me!"} else {[_unit,false] remoteExec ["setCaptive",_unit]; _unit setCaptive false};
if (captive _LeaderX) then {sleep 5};
_unit setCombatBehaviour _oldBehaviour;
_unit enableAI "TARGET";
_unit enableAI "AUTOTARGET";
_unit setUnitPos "AUTO";
_unit setUnitLoadout _loadOut;
