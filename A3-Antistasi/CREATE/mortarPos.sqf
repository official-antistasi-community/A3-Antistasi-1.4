private ["_pos","_cuenta","_sonda","_intersec","_zi","_zf"];
_pos = _this select 0;
_pos = _pos findEmptyPosition [1,30,"I_G_Mortar_01_F"];
if (count _pos == 0) then {_pos = _this select 0};
/*
_sonda = "I_G_Mortar_01_F" createVehicleLocal _pos;
_sonda setposATL [_pos select 0,_pos select 1,(_pos select 2) + 60];*/
_cuenta = 300;
while {_cuenta > 0} do
	{
	/*
	_intersec = false;
	_zi = _pos select 2;
	_sonda setVelocity [0, 0 , -60];
	waitUntil {_vel = (velocity _sonda) select 2; (_vel < 1) and (_vel > -1)};
    _zf = getposATL _sonda select 2;
    if (_zf - _zi > 1) then {_intersec = true};
	/*
	_pos1 = [_pos select 0,_pos select 1,(_pos select 2) + 60];
	player setpos _pos1; sleep 1;
	if (lineIntersects [_pos,_pos1]) then {_intersec = true};
	for "_i" from 0 to 4 do
		{
		_pos1 = _pos1 getPos [100,_i*90];
		_pos1 = [_pos1 select 0,_pos1 select 1,(_pos1 select 2) + 60];
		player setpos _pos1; sleep 1;
		hint format ["%1",lineIntersectsWith [_pos,_pos1]];
		if (lineIntersects [_pos,_pos1]) then {_intersec = true};
		};
	*/
	//if (not _intersec) exitWith {};
	if !([_pos] call A3A_fnc_isBuildingPosition) then {_exit = true};
	_pos = _pos getPos [31,random 360];
	//_sonda setpos [_pos select 0,_pos select 1,(_pos select 2) + 60];
	_cuenta = _cuenta - 1;
	};
if (_cuenta == 0) then {_pos = (_this select 0) findEmptyPosition [1,30,"I_G_Mortar_01_F"]};
//deleteVehicle _sonda;
if (count _pos == 0) then {_pos = _this select 0};

_pos