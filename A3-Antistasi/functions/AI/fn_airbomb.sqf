if (not isServer and hasInterface) exitWith {};
private _filename = "fn_airbomb";
[3, format ["Executing on: %1", clientOwner], _filename] call A3A_fnc_log;
private ["_countX","_plane","_typeX","_ammo","_cluster","_sleep","_bomb"];

_plane = vehicle (_this select 0);
if (isNil "_plane") exitWith {[1, "No plane passed, terminating", _filename] call A3A_fnc_log;};
if (_plane getVariable ["airbomb", false]) exitWith {[1, "Airbomb already executing on this plane", _filename] call A3A_fnc_log;};
_plane setVariable ["airbomb", true, true];

_typeX = _this select 1;
_countX = 6;
_cluster = false;

switch (_typeX) do {
    case ("HE"): {
        _ammo = "Bo_Mk82";
		_sleep = 0.25
    };
	case ("CLUSTER"): {
		_ammo = "BombCluster_03_Ammo_F";
		_sleep = 0.5
	};
	case ("NAPALM"): {
		_ammo = "ammo_Bomb_SDB";
		_sleep = 0.5
	};
	default {
		[1, "Invalid bomb type", _filename] call A3A_fnc_log;
	};
};

if (typeOf _plane == vehSDKPlane) then {_countX = round (_countX / 2); [3, "Rebel Airstrike", _filename] call A3A_fnc_log;};
sleep random 5;

[3, format ["Dropping %1 bombs of type %2 at %3 (near %4)", _countX, _typeX, getPos _plane,text nearestLocation [getPos _plane, "NameCity"]], _filename] call A3A_fnc_log;
private _debugCounter = 0;
for "_i" from 1 to _countX do
	{
	_debugCounter = _debugCounter + 1;
	sleep _sleep;
	if (alive _plane) then
		{
		_bomb = _ammo createvehicle ([getPos _plane select 0,getPos _plane select 1,(getPos _plane select 2)- 5]);
		waituntil {!isnull _bomb};
		_bomb setDir (getDir _plane);
		_bomb setVelocity [0,0,-50];
		if (_typeX == "NAPALM") then
			{
				_nul = [_bomb] spawn
				{
					_bomba = _this select 0;
					_pos = [];
					while {!isNull _bomba} do
					{
						_pos = getPosASL _bomba;
						sleep 0.1;
					};
					[_pos] remoteExec  ["A3A_fnc_napalm"];
				};
			};
		};
	};
[3, format ["Bombs dropped: %1", _debugCounter], _filename] call A3A_fnc_log;	
_plane setVariable ["airbomb", nil, true];
//_bomba is used to track when napalm bombs hit the ground in order to call the napalm script on the correct position
