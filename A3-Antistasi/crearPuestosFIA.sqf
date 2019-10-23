if (!isServer) exitWith {};

private ["_tipo","_coste","_grupo","_unit","_tam","_roads","_road","_pos","_camion","_texto","_mrk","_hr","_unidades","_formato"];

_tipo = _this select 0;
_posicionTel = _this select 1;

if (_tipo == "delete") exitWith {hint "Deprecated option. Use Remove Garrison from HQ instead"};

_escarretera = isOnRoad _posicionTel;

_texto = format ["%1 Observation Post",nameBuenos];
_tipogrupo = gruposSDKSniper;
_tipoVeh = vehSDKBike;
private _tsk = "";
if (_escarretera) then
	{
	_texto = format ["%1 Roadblock",nameBuenos];
	_tipogrupo = gruposSDKAT;
	_tipoVeh = vehSDKTruck;
	};

_mrk = createMarker [format ["FIAPost%1", random 1000], _posicionTel];
_mrk setMarkerShape "ICON";

_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + 60];
_fechalimnum = dateToNumber _fechalim;
[[buenos,civilian],"PuestosFIA",["We are sending a team to establish a Watchpost/Roadblock. Use HC to send the team to their destination","Post \ Roadblock Deploy",_mrk],_posicionTel,false,0,true,"Move",true] call BIS_fnc_taskCreate;
//_tsk = ["PuestosFIA",[buenos,civilian],["We are sending a team to establish a Watchpost/Roadblock. Use HC to send the team to their destination","Post \ Roadblock Deploy",_mrk],_posicionTel,"CREATED",5,true,true,"Move"] call BIS_fnc_setTask;
//misiones pushBackUnique _tsk; publicVariable "misiones";
_formato = [];
{
if (random 20 <= skillFIA) then {_formato pushBack (_x select 1)} else {_formato pushBack (_x select 0)};
} forEach _tipoGrupo;
_grupo = [getMarkerPos respawnBuenos, buenos, _formato] call A3A_fnc_spawnGroup;
_grupo setGroupId ["Post"];
_road = [getMarkerPos respawnBuenos] call A3A_fnc_findNearestGoodRoad;
_pos = position _road findEmptyPosition [1,30,"B_G_Van_01_transport_F"];
_camion = _tipoVeh createVehicle _pos;
//_nul = [_grupo] spawn dismountFIA;
_grupo addVehicle _camion;
{[_x] call A3A_fnc_FIAinit} forEach units _grupo;
leader _grupo setBehaviour "SAFE";
(units _grupo) orderGetIn true;
theBoss hcSetGroup [_grupo];

waitUntil {sleep 1; ({alive _x} count units _grupo == 0) or ({(alive _x) and (_x distance _posicionTel < 10)} count units _grupo > 0) or (dateToNumber date > _fechalimnum)};

if ({(alive _x) and (_x distance _posicionTel < 10)} count units _grupo > 0) then
	{
	if (isPlayer leader _grupo) then
		{
		_owner = (leader _grupo) getVariable ["owner",leader _grupo];
		(leader _grupo) remoteExec ["removeAllActions",leader _grupo];
		_owner remoteExec ["selectPlayer",leader _grupo];
		(leader _grupo) setVariable ["owner",_owner,true];
		{[_x] joinsilent group _owner} forEach units group _owner;
		[group _owner, _owner] remoteExec ["selectLeader", _owner];
		"" remoteExec ["hint",_owner];
		waitUntil {!(isPlayer leader _grupo)};
		};
	puestosFIA = puestosFIA + [_mrk]; publicVariable "puestosFIA";
	lados setVariable [_mrk,buenos,true];
	marcadores = marcadores + [_mrk];
	publicVariable "marcadores";
	spawner setVariable [_mrk,2,true];
	["PuestosFIA",["We are sending a team to establish a Watchpost/Roadblock. Use HC to send the team to their destination","Post \ Roadblock Deploy",_mrk],_posicionTel,"SUCCEEDED"] call A3A_fnc_taskUpdate;
	//["PuestosFIA", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
	_nul = [-5,5,_posiciontel] remoteExec ["A3A_fnc_citySupportChange",2];
	_mrk setMarkerType "loc_bunker";
	_mrk setMarkerColor colorBuenos;
	_mrk setMarkerText _texto;
	if (_esCarretera) then
		{
		_garrison = [staticCrewBuenos];
		{
		if (random 20 <= skillFIA) then {_garrison pushBack (_x select 1)} else {_garrison pushBack (_x select 0)};
		} forEach gruposSDKAT;
		garrison setVariable [_mrk,_garrison,true];
		};
	}
else
	{
	["PuestosFIA",["We are sending a team to establish a Watchpost/Roadblock. Use HC to send the team to their destination","Post \ Roadblock Deploy",_mrk],_posicionTel,"FAILED"] call A3A_fnc_taskUpdate;
	//["PuestosFIA", "FAILED",true] spawn BIS_fnc_taskSetState;
	sleep 3;
	deleteMarker _mrk;
	};

theBoss hcRemoveGroup _grupo;
{deleteVehicle _x} forEach units _grupo;
deleteVehicle _camion;
deleteGroup _grupo;
sleep 15;

_nul = [0,"PuestosFIA"] spawn A3A_fnc_borrarTask;











