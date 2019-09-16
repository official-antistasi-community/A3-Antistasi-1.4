private ["_pos"];
_pos = _this select 0;

_argumentX = ["Car","Truck","CAManBase","Air"];

if (isServer) then {_argumentX = ["All", "", "House", "Wall"]};

_timeOut = time + 70;
_lightsX = [];
_fires = [];

while {time < _timeOut} do
	{
	_units = nearestobjects [_pos, _argumentX, 70];
	if (isServer) then {_units = _units - [mapX,flagX,vehicleBox,boxX]};
	{
	if (local _x) then
		{
		if (not(_x isKindOf "Tank")) then
			{
			if (alive _x) then
				{
				_distMult = (1-((_x distance _pos)/70))/2;
				if (_x isKindOf "CAManBase") then
					{
					_dam = damage _x + _distMult;
					if ((_dam >= 1) and (isPlayer _x)) then
						{
						_x setdamage 0;
						[_x] spawn A3A_fnc_respawn;
						}
					else
						{
						_x setDamage _dam;
						if (_dam >= 1) then
							{
							_l1 = "#lightpoint" createVehicleLocal getpos _x;
							_lightsX pushBack _l1;
							_l1 setLightDayLight true;
							_l1 setLightColor [5, 2.5, 0];
							_l1 setLightBrightness 0.1;
							_l1 setLightAmbient [5, 2.5, 0];
							_l1 lightAttachObject [_x, [0, 0, 0]];
							_l1 setLightAttenuation [3, 0, 0, 0.6];
							_source01 = "#particlesource" createVehicleLocal getpos _x;
							_fires pushBack _source01;
							_source01 setParticleClass "ObjectDestructionFire1Tiny";
							_l1 attachTo [_x, [0,0,0], "Spine3"];
							_source01 attachTo [_x, [0,0,0], "Spine3"];
							}
						else
							{
							_ang = _pos getDir _x;
							_posFlee = _pos getPos [100,_ang];
							_x doMove _posFlee;
							};
						};
					if (_x isKindOf "CAManBase") then
						{
						[_x] spawn
							{
							if (random 100 < 50) then
								{
								_typeX = _this select 0;
								sleep random 3;
								playSound3D [(selectRandom injuredSounds),_typeX];
								};
							};
						};
					}
				else
					{
					if ((_x isKindOf "Truck") or (_x isKindOf "Car") or (_x isKindOf "Air")) then
						{
						_x setDamage (damage _x + (_distMult/2));
						}
					else
						{
						if (_x isKindOf "Building") then
							{
							_x setDamage (damage _x + (_distMult/16));
							}
						else
							{
							 if (str _x find ": t_" > -1) then
							 	{
							 	_x setDamage 1;
							 	}
							 else
							 	{
							 	_x setDamage (damage _x + (_distMult/4));
							 	};
							};
						};
					};
				};
			};
		};
	} forEach _units;
	sleep 5;
	};
if (!isMultiplayer) then {{_x hideObject true } foreach (nearestTerrainObjects [_pos,["tree","bush"],20])} else {if (isServer) then {{ _x hideObjectGlobal true } foreach (nearestTerrainObjects [_pos,["tree","bush"],20])}};
for "_i" from 0 to (count _fires) do
	{
	sleep random 5;
	deleteVehicle (_fires select _i);
	sleep random 3;
	deleteVehicle (_lightsX select _i);
	};