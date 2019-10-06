if (!isServer and hasInterface) exitWith{};

private ["_markerX","_vehiclesX","_groups","_soldiers","_positionX","_pos","_size","_veh","_staticsX","_garrison","_radiusX","_countX","_groupX","_groupMortar","_typeX","_unit"];

_markerX = _this select 0;

_vehiclesX = [];
_groups = [];
_soldiers = [];
_civs = [];
//_typeCiv = "";
_positionX = getMarkerPos (_markerX);
_pos = [];
_unit = objNull;
_veh = objNull;
_size = [_markerX] call A3A_fnc_sizeMarker;

if (_markerX != "Synd_HQ") then
	{
	if (!(_markerX in citiesX)) then
		{
		_veh = createVehicle [SDKFlag, _positionX, [],0, "NONE"];
		if (hasIFA) then {_veh setFlagTexture SDKFlagTexture};
		_veh allowDamage false;
		_vehiclesX pushBack _veh;
		[_veh,"SDKFlag"] remoteExec ["A3A_fnc_flagaction",0,_veh];
		//[_veh,"unit"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_veh];
		//[_veh,"vehicle"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_veh];
		//[_veh,"garage"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_veh];
		};
	if ((_markerX in resourcesX) or (_markerX in factories)) then
		{
		if (not(_markerX in destroyedSites)) then
			{
			if ((daytime > 8) and (daytime < 18)) then
				{
				_groupX = createGroup civilian;
				_groups pushBack _groupX;
				for "_i" from 1 to 4 do
					{
					if (spawner getVariable _markerX != 2) then
						{
						_civ = _groupX createUnit ["C_man_w_worker_F", _positionX, [],0, "NONE"];
						_nul = [_civ] spawn A3A_fnc_CIVinit;
						_civs pushBack _civ;
						_civ setVariable ["markerX",_markerX,true];
						sleep 0.5;
						_civ addEventHandler ["Killed",
							{
							if (({alive _x} count units group (_this select 0)) == 0) then
								{
								_markerX = (_this select 0) getVariable "markerX";
								_nameX = [_markerX] call A3A_fnc_localizar;
								destroyedSites pushBackUnique _markerX;
								publicVariable "destroyedSites";
								["TaskFailed", ["", format ["%1 Destroyed",_nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer,civilian]];
								};
							}];
						};
					};
				//_nul = [_markerX,_civs] spawn destroyCheck;
				_nul = [leader _groupX, _markerX, "SAFE", "SPAWNED","NOFOLLOW", "NOSHARE","DORELAX","NOVEH2"] execVM "scripts\UPSMON.sqf";//TODO need delete UPSMON link
				};
			};
		};
	if (_markerX in seaports) then
		{
		[_veh,"seaport"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_veh];
		};
	};
_staticsX = staticsToSave select {_x distance2D _positionX < _size};

_garrison = [];
_garrison = _garrison + (garrison getVariable [_markerX,[]]);
_groupX = createGroup teamPlayer;
_groupEst = createGroup teamPlayer;
_groupMortar = createGroup teamPlayer;
{
_index = _garrison findIf {_x in SDKMil};
if (_index == -1) exitWith {};
if (typeOf _x == SDKMortar) then
	{
	_unit = _groupMortar createUnit [(_garrison select _index), _positionX, [], 0, "NONE"];
	_unit moveInGunner _x;
	_nul=[_x] execVM "scripts\UPSMON\MON_artillery_add.sqf";//TODO need delete UPSMON link
	}
else
	{
	_unit = _groupEst createUnit [(_garrison select _index), _positionX, [], 0, "NONE"];
	_unit moveInGunner _x;
	};
[_unit,_markerX] call A3A_fnc_FIAinitBases;
_soldiers pushBack _unit;
_garrison deleteAT _index;
} forEach _staticsX;

if (staticCrewTeamPlayer in _garrison) then
	{
	{
	_unit = _groupMortar createUnit [staticCrewTeamPlayer, _positionX, [], 0, "NONE"];
	_pos = [_positionX] call A3A_fnc_mortarPos;
	_veh = SDKMortar createVehicle _pos;
	_vehiclesX pushBack _veh;
	_nul=[_veh] execVM "scripts\UPSMON\MON_artillery_add.sqf";//TODO need delete UPSMON link
	_unit assignAsGunner _veh;
	_unit moveInGunner _veh;
	[_veh] call A3A_fnc_AIVEHinit;
	_soldiers pushBack _unit;
	} forEach (_garrison select {_x == staticCrewTeamPlayer});
	_garrison = _garrison - [staticCrewTeamPlayer];
	};
_garrison = _garrison call A3A_fnc_garrisonReorg;
_radiusX = count _garrison;
_countX = 0;
_countGroup = 0;
while {(spawner getVariable _markerX != 2) and (_countX < _radiusX)} do
	{
	_typeX = _garrison select _countX;
	_unit = _groupX createUnit [_typeX, _positionX, [], 0, "NONE"];
	if (_typeX in SDKSL) then {_groupX selectLeader _unit};
	[_unit,_markerX] call A3A_fnc_FIAinitBases;
	_soldiers pushBack _unit;
	_countX = _countX + 1;
	sleep 0.5;
	if (_countGroup == 8) then
		{
		_groupX = createGroup teamPlayer;
		_groups pushBack _groupX;
		_countGroup = 0;
		};
	};

for "_i" from 0 to (count _groups) - 1 do
	{
	_groupX = _groups select _i;
	if (_i == 0) then
		{
		_nul = [leader _groupX, _markerX, "SAFE","SPAWNED","RANDOMUP","NOVEH2","NOFOLLOW"] execVM "scripts\UPSMON.sqf";//TODO need delete UPSMON link
		}
	else
		{
		_nul = [leader _groupX, _markerX, "SAFE","SPAWNED","RANDOM","NOVEH2","NOFOLLOW"] execVM "scripts\UPSMON.sqf";//TODO need delete UPSMON link
		};
	};
waitUntil {sleep 1; (spawner getVariable _markerX == 2)};

{
_soldierX = _x;
if (alive _soldierX) then
	{
	deleteVehicle _x
	};
} forEach _soldiers;
{deleteVehicle _x} forEach _civs;
//if (!isNull _periodista) then {deleteVehicle _periodista};
{deleteGroup _x} forEach _groups;
deleteGroup _groupEst;
deleteGroup _groupMortar;
{if (!(_x in staticsToSave)) then {deleteVehicle _x}} forEach _vehiclesX;
