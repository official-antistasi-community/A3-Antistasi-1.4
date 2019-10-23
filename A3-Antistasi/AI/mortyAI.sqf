private ["_morty0","_mortero","_pos","_tipo","_b0","_b1","_morty1"];

_grupo = _this select 0;
_morty0 = units _grupo select 0;
_morty1 = units _grupo select 1;
_tipo = _this select 1;
_b0 = MortStaticSDKB;
_b1 = soporteStaticSDKB3;
if (_tipo == SDKMGStatic) then
	{
	_b0 = MGStaticSDKB;
	_b1 = soporteStaticSDKB2;
	_morty0 setVariable ["typeOfSoldier","StaticGunner"];
	}
else
	{
	_morty0 setVariable ["typeOfSoldier","StaticMortar"];
	};
while {(alive _morty0) and (alive _morty1)} do
	{
	waitUntil {sleep 1; {((unitReady _x) and (alive _x))} count units _grupo == count units _grupo};
	_pos = position _morty0 findEmptyPosition [1,30,_tipo];
	_mortero = _tipo createVehicle _pos;
	removeBackpackGlobal _morty0;
	removeBackpackGlobal _morty1;
	_grupo addVehicle _mortero;
	_morty1 assignAsGunner _mortero;
	[_morty1] orderGetIn true;
	[_morty1] allowGetIn true;
	_nul = [_mortero] call A3A_fnc_AIVEHinit;

	waitUntil {sleep 1; ({!(alive _x)} count units _grupo != 0) or !(unitReady _morty0)};

	if (({(alive _x)} count units _grupo == count units _grupo) and !(unitReady _morty0)) then
		{
		_morty0 addBackpackGlobal _b0;
		_morty1 addBackpackGlobal _b1;
		unassignVehicle _morty1;
		moveOut _morty1;
		deleteVehicle _mortero;
		};
	};