private ["_veh","_puertas"];
_veh = _this select 0;

if (!alive _veh) exitWith {};
_puertas = [];

switch (typeOf _veh) do
	{
	case "I_MRAP_03_F": {_puertas = ["Door_LF","Door_RF"]};
	case "I_Heli_Transport_02_F": {_puertas = ["CargoRamp_Open","Door_Back_L","Door_Back_R"]};
	case "B_Heli_Light_01_F": {_puertas = ["DoorL_Front_Open","DoorR_Front_Open","DoorL_Back_Open","DoorR_Back_Open"]};
	case "B_Heli_Transport_01_camo_F": {_puertas = ["Door_L","Door_R"]};
	case "B_Heli_Transport_03_F": {_puertas = ["Door_rear_source"]};
	};
if (count _puertas == 0) exitWith {};

if (count _this > 1) then
	{
	sleep 30;
	waitUntil {sleep 1; (!alive _veh) or (speed _veh < 5)};
	};


{
waitUntil {(!alive _veh) or (_veh doorPhase _x == 0) or (_veh doorPhase _x == 1)}
} forEach _puertas;

if (!alive _veh) exitWith {};

_fase = _veh doorPhase (_puertas select 0);

if (_fase == 0) then {_fase = 1} else {_fase = 0};

{
_veh animateDoor [_x,_fase,false];
} forEach _puertas;

{
waitUntil {(!alive _veh) or (_veh doorPhase _x == 0) or (_veh doorPhase _x == 1)}
} forEach _puertas;

if (count _this > 1) then
	{
	waitUntil {sleep 1; (!alive _veh) or (speed _veh > 5)};
	if (alive _veh) then
		{
		{
		waitUntil {(!alive _veh) or (_veh doorPhase _x == 0) or (_veh doorPhase _x == 1)}
		} forEach _puertas;

		if (!alive _veh) exitWith {};

		_fase = _veh doorPhase (_puertas select 0);

		if (_fase == 0) then {_fase = 1} else {_fase = 0};

		{
		_veh animateDoor [_x,_fase,false];
		} forEach _puertas;
		};
	};