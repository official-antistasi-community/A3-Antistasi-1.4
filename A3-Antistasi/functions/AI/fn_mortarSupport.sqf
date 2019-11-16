private _morty = _this select 0;
private _mortarX = vehicle _morty;
if (_mortarX == _morty) exitWith {};
if (!alive _mortarX) exitWith
	{
	(group _morty) setVariable ["mortarsX",objNull];
	};
if !(unitReady _morty) exitWith {};
private _positionX = _this select 1;
private _rounds = _this select 2;
private _typeAmmunition = (getArray (configfile >> "CfgVehicles" >> (typeOf _mortarX) >> "Turrets" >> "MainTurret" >> "magazines")) select 0;
if ({(_x select 0) == _typeAmmunition} count (magazinesAmmo _mortarX) == 0) exitWith
	{
	moveOut _morty;
	(group _morty) setVariable ["mortarsX",objNull];
	};
if !(_positionX inRangeOfArtillery [[_mortarX], ((getArtilleryAmmo [_mortarX]) select 0)]) exitWith {};

_mortarX commandArtilleryFire [_positionX,_typeAmmunition,_rounds];
