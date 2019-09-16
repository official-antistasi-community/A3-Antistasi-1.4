_pos = _this select 0;
if (isNil "_pos") exitWith {};
if (count _pos == 0) exitWith {};
if (isServer) then
	{
	if (!napalmCurrent) then {napalmCurrent = true; publicVariable "napalmCurrent"};
	};
if (hasInterface) then
	{
	_slight6 = "#lightpoint" createVehicleLocal [ _pos select 0, _pos select 1, 10];
	_slight6 setlightBrightness 21.4;
	_slight6 setlightAmbient[.3, .1, 0];
	_slight6 setlightColor[.3, .1, 0];

	_slight1 = "#lightpoint" createVehicleLocal [_pos select 0, _pos select 1, 10];
	_slight1 setlightBrightness 55.4;
	_slight1 setlightAmbient[1, 1, 1];
	_slight1 setlightColor[1, 1, .9];

	_color = [1, 1, 1];

	_pos = [_pos select 0, _pos select 1, 5];
	//--- Dust
	setwind [0.401112*2,0.204166*2,false];
	_velocity = wind;
	/*
	_color = [.1, .1, .06];
	_alpha = 0.47 + random 0.12;
	_ps2 = "#particlesource" createVehicleLocal _pos;  // this is black smoke
	_ps2 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, 75 + random 10, [0, 0, 1], _velocity, 25, 1.36, 1.15, 0, [45 + (random 145)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
	_ps2 setParticleRandom [3, [4 + (random 10), 4 + (random 10), 1 + random 1], [random 2, random 2, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
	_ps2 setParticleCircle [0.1, [0, 0, 0]];
	_ps2 setDropInterval 0.05;
	_alpha = 0.17 + random 0.04;
	_color = [.13, .2, .06];
	_ps3 = "#particlesource" createVehicleLocal _pos;  // this is gray white smoke
	_ps3 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 9, 8, 0], "", "Billboard", 1, 1 + random 5, [0, 0, 0], _velocity, 1, 1.39, 1.15, 0, [3 + (random 3)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
	_ps3 setParticleRandom [3, [25 + (random 1), 25 + (random 1), 2], [random 2, random 2, 0], 1, 1, [0, 0, 0, 4], 0, 0];
	_ps3 setParticleCircle [0.1, [0, 0, 0]];
	_ps3 setDropInterval 0.01;
	*/
	_color = [1, 1, 1];
	_alpha = 0.31 ;
	_ps4 = "#particlesource" createVehicleLocal _pos;  // this is fire i think yellow
	_ps4 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 1, 12, 0], "", "Billboard", 1, 2 + random 3, [0, 0, 5], _velocity, 1, 1.1, 1, 0, [.3 + (random 1)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
	_ps4 setParticleRandom [3, [5 + (random 1), 4 + (random 1), 7], [random 4, random 4, 2], 14, 3, [0, 0, 0, .1], 1, 0];
	_ps4 setParticleCircle [0.1, [0, 0, 0]];
	_ps4 setDropInterval 0.022;
	_nul = [_ps4] spawn
		{
		_fireX = _this select 0;
		while {alive _fireX} do
			{
			_fireX say3D "fire";
			sleep 13;
			};
		};
	_alpha = 0.35 ;
	_ps7 = "#particlesource" createVehicleLocal _pos;  //this is fire i think red
	_ps7 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 3, 12, 0], "", "Billboard", 1, 1 + random 1, [5, 5, 4], _velocity, 1, 1.1, 1, 0, [.5 + (random .5)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
	_ps7 setParticleRandom [3, [1 + (random 1), 4 + (random 1), 9], [random 5, random 2, 1], 14, 3, [0, 0, 0, .1], 1, 0];
	_ps7 setParticleCircle [0.1, [0, 0, 0]];
	_ps7 setDropInterval 0.006;

	_alpha = 0.25 ;
	_ps10 = "#particlesource" createVehicleLocal _pos;
	_ps10 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 1, 3, [1, 1, 1], _velocity, 1, 1.3, 1, 1, [2 + (random 7)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 1, "", "", 1];
	_ps10 setParticleRandom [0, [5, 5, 5], [1, 1, 1], 14, 3, [0, 0, 0, 0], 1, 0];
	_ps10 setParticleCircle [0.1, [5, 5, 5]];
	_ps10 setDropInterval .1;

	_alpha = 0.1 ;
	_color = [1, 1, .9];
	_ps9 = "#particlesource" createVehicleLocal _pos;
	_ps9 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 5, 0], "", "Billboard", 1, 16, [0, 0, 1], _velocity, 1, 1.52,1, 0, [.007 + (random .02)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
	_ps9 setParticleRandom [0, [1 + (random 1), 4 + (random 1), 5 + random 5], [.2, .2, 4], 14, 3, [0, 0, 0, 22], 1, 0];
	_ps9 setParticleCircle [0.1, [5, 5, 5]];
	_ps9 setDropInterval 0.0005;
	sleep .8;

	deletevehicle _ps9;
	_color = [1, 1, 0];
	_velocity = [10, 10, 35];
	sleep .05;
	_x = 0;
	_brightness = 55.4;
	while {_x < 50} do
		{
		_brightness = _brightness - 1;
		_slight1 setlightBrightness _brightness;
		sleep .01;
		_x = _x + 1;
		};
	_nul = [_pos] spawn A3A_fnc_napalmDamage;
	deletevehicle _ps9;
	sleep 3;
	deletevehicle _slight1;
	sleep 50;
	deletevehicle _ps10;
	sleep 16;
	// end part
	deletevehicle _ps7;
	sleep 10;
	deletevehicle _ps4;
	sleep 15;
	deletevehicle _slight6;
	}
else
	{
	sleep 1;
	_nul = [_pos] spawn A3A_fnc_napalmDamage;
	};
if (isServer) then
	{
	sleep 85;
	if (napalmCurrent) then {napalmCurrent = false; publicVariable "napalmCurrent"};
	};