if (!isServer and hasInterface) exitWith {};

private ["_marcador","_posicion","_escarretera","_tam","_road","_veh","_grupo","_unit","_roadcon"];

_marcador = _this select 0;
_posicion = getMarkerPos _marcador;

_escarretera = false;
if (isOnRoad _posicion) then {_escarretera = true};

if (_escarretera) then
	{
	_tam = 1;
	_garrison = garrison getVariable _marcador;
	_veh = objNull;

	if (isNil "_garrison") then
		{//this is for backward compatibility, remove after v12
		_garrison = [staticCrewBuenos];
		{
		if (random 20 <= skillFIA) then {_garrison pushBack (_x select 1)} else {_garrison pushBack (_x select 0)};
		} forEach gruposSDKAT;
		garrison setVariable [_marcador,_garrison,true];
		};
	while {true} do
		{
		_road = _posicion nearRoads _tam;
		if (count _road > 0) exitWith {};
		_tam = _tam + 5;
		};
	if (staticCrewBuenos in _garrison) then
		{
		_roadcon = roadsConnectedto (_road select 0);
		_dirveh = [_road select 0, _roadcon select 0] call BIS_fnc_DirTo;
		_veh = vehSDKLightArmed createVehicle getPos (_road select 0);
		_veh setDir _dirveh + 90;
		_veh lock 3;
		_nul = [_veh] call A3A_fnc_AIVEHinit;
		sleep 1;
		};
	_grupo = [_posicion, buenos, _garrison] call A3A_fnc_spawnGroup;
	//_unit = _grupo createUnit [staticCrewBuenos, _posicion, [], 0, "NONE"];
	//_unit moveInGunner _veh;
	{[_x,_marcador] spawn A3A_fnc_FIAinitBases; if (typeOf _x == staticCrewBuenos) then {_x moveInGunner _veh}} forEach units _grupo;
	}
else
	{
	_formato = [];
	{
	if (random 20 <= skillFIA) then {_formato pushBack (_x select 1)} else {_formato pushBack (_x select 0)};
	} forEach gruposSDKSniper;
	_grupo = [_posicion, buenos, _formato] call A3A_fnc_spawnGroup;
	_grupo setBehaviour "STEALTH";
	_grupo setCombatMode "GREEN";
	{[_x,_marcador] spawn A3A_fnc_FIAinitBases;} forEach units _grupo;
	};

waitUntil {sleep 1; ((spawner getVariable _marcador == 2)) or ({alive _x} count units _grupo == 0) or (not(_marcador in puestosFIA))};

if ({alive _x} count units _grupo == 0) then
//if ({alive _x} count units _grupo == 0) then
	{
	puestosFIA = puestosFIA - [_marcador]; publicVariable "puestosFIA";
	marcadores = marcadores - [_marcador]; publicVariable "marcadores";
	lados setVariable [_marcador,nil,true];
	_nul = [5,-5,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
	deleteMarker _marcador;
	if (_escarretera) then
		{
		[["TaskFailed", ["", "Roadblock Lost"]],"BIS_fnc_showNotification"] call BIS_fnc_MP;
		}
	else
		{
		[["TaskFailed", ["", "Watchpost Lost"]],"BIS_fnc_showNotification"] call BIS_fnc_MP;
		};
	};

waitUntil {sleep 1; (spawner getVariable _marcador == 2) or (not(_marcador in puestosFIA))};

if (_escarretera) then {if (!isNull _veh) then {deleteVehicle _veh}};
{deleteVehicle _x} forEach units _grupo;
deleteGroup _grupo;