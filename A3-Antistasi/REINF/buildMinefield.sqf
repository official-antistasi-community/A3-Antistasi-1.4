if (!isServer and hasInterface) exitWith {};

private ["_tipo","_cantidad","_tipoMuni","_grupo","_unit","_tam","_roads","_road","_pos","_camion","_texto","_mrk","_ATminesAdd","_APminesAdd","_posicionTel","_tsk","_magazines","_typeMagazines","_cantMagazines","_newCantMagazines","_mina","_tipo","_camion"];

_tipo = _this select 0;
_posicionTel = _this select 1;
_cantidad = _this select 2;
_coste = (2*(server getVariable (SDKExp select 0))) + ([vehSDKTruck] call A3A_fnc_vehiclePrice);
[-2,(-1*_coste)] remoteExecCall ["A3A_fnc_resourcesFIA",2];

if (_tipo == "ATMine") then
	{
	_tipoMuni = ATMineMag;
	};
if (_tipo == "APERSMine") then
	{
	_tipoMuni = APERSMineMag;
	};

/*
_magazines = getMagazineCargo caja;
_typeMagazines = _magazines select 0;
_cantMagazines = _magazines select 1;
_newCantMagazines = [];

for "_i" from 0 to (count _typeMagazines) - 1 do
	{
	if ((_typeMagazines select _i) != _tipoMuni) then
		{
		_newCantMagazines pushBack (_cantMagazines select _i);
		}
	else
		{
		_cuantasHay = (_cantMagazines select _i);
		_cuantasHay = _cuantasHay - _cantidad;
		if (_cuantasHay < 0) then {_cuentasHay = 0};
		_newCantMagazines pushBack _cuantasHay;
		};
	};

clearMagazineCargoGlobal caja;

for "_i" from 0 to (count _typeMagazines) - 1 do
	{
	caja addMagazineCargoGlobal [_typeMagazines select _i,_newCantMagazines select _i];
	};
*/

#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

_index = _tipoMuni call jn_fnc_arsenal_itemType;
[_index,_tipoMuni,_cantidad] call jn_fnc_arsenal_removeItem;

_mrk = createMarker [format ["Minefield%1", random 1000], _posicionTel];
_mrk setMarkerShape "ELLIPSE";
_mrk setMarkerSize [100,100];
_mrk setMarkerType "hd_warning";
_mrk setMarkerColor "ColorRed";
_mrk setMarkerBrush "DiagGrid";
_mrk setMarkerText _texto;
[_mrk,0] remoteExec ["setMarkerAlpha",[malos,muyMalos]];

[[buenos,civilian],"Mines",[format ["An Engineer Team has been deployed at your command with High Command Option. Once they reach the position, they will start to deploy %1 mines in the area. Cover them in the meantime.",_cantidad],"Minefield Deploy",_mrk],_posicionTel,false,0,true,"map",true] call BIS_fnc_taskCreate;
//_tsk = ["Mines",[buenos,civilian],[format ["An Engineer Team has been deployed at your command with High Command Option. Once they reach the position, they will start to deploy %1 mines in the area. Cover them in the meantime.",_cantidad],"Minefield Deploy",_mrk],_posicionTel,"CREATED",5,true,true,"map"] call BIS_fnc_setTask;
//misiones pushBack _tsk; publicVariable "misiones";

_grupo = createGroup buenos;

_unit = _grupo createUnit [(SDKExp select 0), (getMarkerPos respawnBuenos), [], 0, "NONE"];
sleep 1;
_unit = _grupo createUnit [(SDKExp select 0), (getMarkerPos respawnBuenos), [], 0, "NONE"];
_grupo setGroupId ["MineF"];

_road = [getMarkerPos respawnBuenos] call A3A_fnc_findNearestGoodRoad;
_pos = position _road findEmptyPosition [1,30,vehSDKTruck];

_camion = vehSDKTruck createVehicle _pos;

_grupo addVehicle _camion;
{[_x] spawn A3A_fnc_FIAinit; [_x] orderGetIn true} forEach units _grupo;
_nul = [_camion] call A3A_fnc_AIVEHinit;
leader _grupo setBehaviour "SAFE";
theBoss hcSetGroup [_grupo];
_camion allowCrewInImmobile true;

//waitUntil {sleep 1; (count crew _camion > 0) or (!alive _camion) or ({alive _x} count units _grupo == 0)};

waitUntil {sleep 1; (!alive _camion) or ((_camion distance _posicionTel < 50) and ({alive _x} count units _grupo > 0))};

if ((_camion distance _posicionTel < 50) and ({alive _x} count units _grupo > 0)) then
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
	theBoss hcRemoveGroup _grupo;
	[petros,"hint","Engineer Team deploying mines."] remoteExec ["A3A_fnc_commsMP",[buenos,civilian]];
	_nul = [leader _grupo, _mrk, "SAFE","SPAWNED", "SHOWMARKER"] execVM "scripts\UPSMON.sqf";
	sleep 30*_cantidad;
	if ((alive _camion) and ({alive _x} count units _grupo > 0)) then
		{
		{deleteVehicle _x} forEach units _grupo;
		deleteGroup _grupo;
		deleteVehicle _camion;
		for "_i" from 1 to _cantidad do
			{
			_mina = createMine [_tipo,_posicionTel,[],100];
			buenos revealMine _mina;
			};
		["Mines",[format ["An Engineer Team has been deployed at your command with High Command Option. Once they reach the position, they will start to deploy %1 mines in the area. Cover them in the meantime.",_cantidad],"Minefield Deploy",_mrk],_posicionTel,"SUCCEEDED","Map"] call A3A_fnc_taskUpdate;
		sleep 15;
		//_nul = [_tsk,true] call BIS_fnc_deleteTask;
		_nul = [0,"Mines"] spawn A3A_fnc_borrarTask;
		[2,_coste] remoteExec ["A3A_fnc_resourcesFIA",2];
		}
	else
		{
		["Mines",[format ["An Engineer Team has been deployed at your command with High Command Option. Once they reach the position, they will start to deploy %1 mines in the area. Cover them in the meantime.",_cantidad],"Minefield Deploy",_mrk],_posicionTel,"FAILED","Map"] call A3A_fnc_taskUpdate;
		sleep 15;
		theBoss hcRemoveGroup _grupo;
		//_nul = [_tsk,true] call BIS_fnc_deleteTask;
		_nul = [0,"Mines"] spawn A3A_fnc_borrarTask;
		{deleteVehicle _x} forEach units _grupo;
		deleteGroup _grupo;
		deleteVehicle _camion;
		deleteMarker _mrk;
		};
	}
else
	{
	["Mines",[format ["An Engineer Team has been deployed at your command with High Command Option. Once they reach the position, they will start to deploy %1 mines in the area. Cover them in the meantime.",_cantidad],"Minefield Deploy",_mrk],_posicionTel,"FAILED","Map"] call A3A_fnc_taskUpdate;
	sleep 15;
	theBoss hcRemoveGroup _grupo;
	//_nul = [_tsk,true] call BIS_fnc_deleteTask;
	_nul = [0,"Mines"] spawn A3A_fnc_borrarTask;
	{deleteVehicle _x} forEach units _grupo;
	deleteGroup _grupo;
	deleteVehicle _camion;
	deleteMarker _mrk;
	};

