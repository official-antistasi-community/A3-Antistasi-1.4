if (!isServer and hasInterface) exitWith{};

private ["_unit","_marcador","_posicion","_cuenta"];

_marcador = _this select 0;

_dificil = if (random 10 < tierWar) then {true} else {false};
_salir = false;
_contacto = objNull;
_grpContacto = grpNull;
_tsk = "";
_posicion = getMarkerPos _marcador;

_POWs = [];

_tiempolim = if (_dificil) then {30} else {120};//120
if (hayIFA) then {_tiempolim = _tiempolim * 2};
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_nombredest = [_marcador] call A3A_fnc_localizar;

[[buenos,civilian],"RES",[format ["A group of POWs is awaiting for execution in %1. We must rescue them before %2:%3. Bring them to HQ",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"POW Rescue",_marcador],_posicion,false,0,true,"run",true] call BIS_fnc_taskCreate;
//_blacklistbld = ["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F"];
misiones pushBack ["RES","CREATED"]; publicVariable "misiones";
_poscasa = [];
_cuenta = 0;
//_casas = nearestObjects [_posicion, ["house"], 50];
_casas = (nearestObjects [_posicion, ["house"], 50]) select {!((typeOf _x) in UPSMON_Bld_remove)};
_casa = "";
_posibles = [];
for "_i" from 0 to (count _casas) - 1 do
	{
	_casa = (_casas select _i);
	_poscasa = [_casa] call BIS_fnc_buildingPositions;
	if (count _poscasa > 1) then {_posibles pushBack _casa};
	};

if (count _posibles > 0) then
	{
	_casa = _posibles call BIS_Fnc_selectRandom;
	_poscasa = [_casa] call BIS_fnc_buildingPositions;
	_cuenta = (count _poscasa) - 1;
	if (_cuenta > 10) then {_cuenta = 10};
	}
else
	{
	_cuenta = round random 10;
	for "_i" from 0 to _cuenta do
		{
		_postmp = [_posicion, 5, random 360] call BIS_Fnc_relPos;
		_poscasa pushBack _postmp;
		};
	};
_grpPOW = createGroup buenos;
for "_i" from 0 to _cuenta do
	{
	_unit = _grpPOW createUnit [SDKUnarmed, (_poscasa select _i), [], 0, "NONE"];
	_unit allowDamage false;
	[_unit,true] remoteExec ["setCaptive",0,_unit];
	_unit setCaptive true;
	_unit disableAI "MOVE";
	_unit disableAI "AUTOTARGET";
	_unit disableAI "TARGET";
	_unit setUnitPos "UP";
	_unit setBehaviour "CARELESS";
	_unit allowFleeing 0;
	//_unit disableAI "ANIM";
	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	sleep 1;
	//if (alive _unit) then {_unit playMove "UnaErcPoslechVelitele1";};
	_POWS pushBack _unit;
	[_unit,"prisionero"] remoteExec ["A3A_fnc_flagaction",[buenos,civilian],_unit];
	[_unit] call A3A_fnc_reDress;
	};

sleep 5;

{_x allowDamage true} forEach _POWS;

waitUntil {sleep 1; ({alive _x} count _POWs == 0) or ({(alive _x) and (_x distance getMarkerPos respawnBuenos < 50)} count _POWs > 0) or (dateToNumber date > _fechalimnum)};

if (dateToNumber date > _fechalimnum) then
	{
	if (spawner getVariable _marcador == 2) then
		{
		{
		if (group _x == _grpPOW) then
			{
			_x setDamage 1;
			};
		} forEach _POWS;
		}
	else
		{
		{
		if (group _x == _grpPOW) then
			{
			[_x,false] remoteExec ["setCaptive",0,_x];
			_x setCaptive false;
			_x enableAI "MOVE";
			_x doMove _posicion;
			};
		} forEach _POWS;
		};
	};

waitUntil {sleep 1; ({alive _x} count _POWs == 0) or ({(alive _x) and (_x distance getMarkerPos respawnBuenos < 50)} count _POWs > 0)};

_bonus = if (_dificil) then {2} else {1};

if ({alive _x} count _POWs == 0) then
	{
	["RES",[format ["A group of POWs is awaiting for execution in %1. We must rescue them before %2:%3. Bring them to HQ",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"POW Rescue",_marcador],_posicion,"FAILED","run"] call A3A_fnc_taskUpdate;
	{[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false} forEach _POWs;
	[-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
	}
else
	{
	sleep 5;
	["RES",[format ["A group of POWs is awaiting for execution in %1. We must rescue them before %2:%3. Bring them to HQ",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"POW Rescue",_marcador],_posicion,"SUCCEEDED","run"] call A3A_fnc_taskUpdate;
	_cuenta = {(alive _x) and (_x distance getMarkerPos respawnBuenos < 150)} count _POWs;
	_hr = 2 * (_cuenta);
	_resourcesFIA = 100 * _cuenta*_bonus;
	[_hr,_resourcesFIA] remoteExec ["A3A_fnc_resourcesFIA",2];
	[0,10*_bonus,_posicion] remoteExec ["A3A_fnc_citySupportChange",2];
	//[_cuenta,0] remoteExec ["A3A_fnc_prestige",2];
	{if (_x distance getMarkerPos respawnBuenos < 500) then {[_cuenta,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
	[round (_cuenta*_bonus/2),theBoss] call A3A_fnc_playerScoreAdd;
	{[_x] join _grpPOW; [_x] orderGetin false} forEach _POWs;
	};

sleep 60;
_items = [];
_municion = [];
_armas = [];
{
_unit = _x;
if (_unit distance getMarkerPos respawnBuenos < 150) then
	{
	{if (not(([_x] call BIS_fnc_baseWeapon) in unlockedWeapons)) then {_armas pushBack ([_x] call BIS_fnc_baseWeapon)}} forEach weapons _unit;
	{if (not(_x in unlockedMagazines)) then {_municion pushBack _x}} forEach magazines _unit;
	_items = _items + (items _unit) + (primaryWeaponItems _unit) + (assignedItems _unit) + (secondaryWeaponItems _unit);
	};
deleteVehicle _unit;
} forEach _POWs;
deleteGroup _grpPOW;
{caja addWeaponCargoGlobal [_x,1]} forEach _armas;
{caja addMagazineCargoGlobal [_x,1]} forEach _municion;
{caja addItemCargoGlobal [_x,1]} forEach _items;

_nul = [1200,"RES"] spawn A3A_fnc_borrarTask;

