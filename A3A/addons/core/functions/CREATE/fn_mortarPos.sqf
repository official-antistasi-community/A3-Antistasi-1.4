private ["_pos","_countX","_probe","_intersec","_zi","_zf"];
_pos = _this select 0;
_pos = _pos findEmptyPosition [1,30,"I_G_Mortar_01_F"];
if (count _pos == 0) then {_pos = _this select 0};
/*
_probe = "I_G_Mortar_01_F" createVehicleLocal _pos;
_probe setposATL [_pos select 0,_pos select 1,(_pos select 2) + 60];*/
_countX = 300;
while {_countX > 0} do
	{
	/*
	_intersec = false;
	_zi = _pos select 2;
	_probe setVelocity [0, 0 , -60];
	waitUntil {_vel = (velocity _probe) select 2; (_vel < 1) and (_vel > -1)};
    _zf = getposATL _probe select 2;
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
	//_probe setpos [_pos select 0,_pos select 1,(_pos select 2) + 60];
	_countX = _countX - 1;
	};
if (_countX == 0) then {_pos = (_this select 0) findEmptyPosition [1,30,"I_G_Mortar_01_F"]};
//deleteVehicle _probe;
if (count _pos == 0) then {_pos = _this select 0};

_pos