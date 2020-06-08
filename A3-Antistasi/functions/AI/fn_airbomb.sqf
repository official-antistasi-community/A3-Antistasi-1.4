if (not isServer and hasInterface) exitWith {};
private _filename = "fn_airbomb";
private ["_countX","_pilot","_typeX","_ammo","_cluster","_sleep","_bomb"];
_pilot = _this select 0;
_typeX = _this select 1;
_countX = 4;
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

if (typeOf (vehicle _pilot) == vehSDKPlane) then {_countX = round (_countX / 2)};
sleep random 5;

for "_i" from 1 to _countX do
	{
	sleep _sleep;
	if (alive _pilot) then
		{
		_bomb = _ammo createvehicle ([getPos _pilot select 0,getPos _pilot select 1,(getPos _pilot select 2)- 5]);
		waituntil {!isnull _bomb};
		_bomb setDir (getDir _pilot);
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
//_bomba is used to track when napalm bombs hit the ground in order to call the napalm script on the correct position
