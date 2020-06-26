private ["_veh", "_costs","_typeX"];
_veh = cursortarget;

if (isNull _veh) exitWith {["Sell Vehicle", "You are not looking to any vehicle"] call A3A_fnc_customHint;};

if (_veh distance getMarkerPos respawnTeamPlayer > 50) exitWith {["Sell Vehicle", "Vehicle must be closer than 50 meters to the flag"] call A3A_fnc_customHint;};

if ({isPlayer _x} count crew _veh > 0) exitWith {["Sell Vehicle", "In order to sell, vehicle must be empty."] call A3A_fnc_customHint;};

_owner = _veh getVariable "ownerX";
_exit = false;
if (!isNil "_owner") then
	{
	if (_owner isEqualType "") then
		{
		if (getPlayerUID player != _owner) then {_exit = true};
		};
	};

if (_exit) exitWith {["Sell Vehicle", "You are not owner of this vehicle and you cannot sell it"] call A3A_fnc_customHint;};

_typeX = typeOf _veh;
_costs = 0;

if (_typeX in vehFIA) then
{
	_costs = round (([_typeX] call A3A_fnc_vehiclePrice)/2)
}
else
{
	if (_typeX in arrayCivVeh) then
	{
		//This is for selling supply trucks, but currently is unused.
		_destinationX = _veh getVariable "destinationX";
		if (isNil "_destinationX") then
		{
			if (_typeX == "C_Van_01_fuel_F") then {_costs = 50} else {_costs = 25};
		}
		else
		{
			_costs = 200;
		};
	}
	else
	{
		if ((_typeX in vehNormal) or (_typeX in vehBoats) or (_typeX in vehAmmoTrucks)) then
		{
			_costs = 100;
		}
		else
		{
			if (_typeX in vehAPCs) then
			{
				_costs = 1000;
			}
			else
			{
				if (_typeX isKindOf "Plane") then
				{
					_costs = 4000;
				}
				else
				{
					if ((_typeX in vehAttackHelis) or (_typeX in vehTanks) or (_typeX in vehAA) or (_typeX in vehMRLS)) then
					{
						_costs = 3000;
					}
					else
					{
						if (_typeX in vehTransportAir) then
						{
							_costs = 500;
						};
					};
				};
			};
		};
	};
};

if (_costs == 0) exitWith {["Sell Vehicle", "The vehicle you are looking is not suitable in our marketplace"] call A3A_fnc_customHint;};

_costs = round (_costs * (1-damage _veh));

[0,_costs] remoteExec ["A3A_fnc_resourcesFIA",2];

if (_veh in staticsToSave) then {staticsToSave = staticsToSave - [_veh]; publicVariable "staticsToSave"};
if (_veh in reportedVehs) then {reportedVehs = reportedVehs - [_veh]; publicVariable "reportedVehs"};

[_veh,true] call A3A_fnc_empty;

if (_veh isKindOf "StaticWeapon") then {deleteVehicle _veh};

["Sell Vehicle", "Vehicle Sold"] call A3A_fnc_customHint;