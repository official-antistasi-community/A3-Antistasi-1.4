private ["_staticX","_nearX","_playerX"];

_staticX = _this select 0;
_playerX = _this select 1;

if (!alive _staticX) exitWith {hint "You cannot steal a destroyed static weapon"};

if (alive gunner _staticX) exitWith {hint "You cannot steal a static weapon when someone is using it"};

if ((alive assignedGunner _staticX) and (!isPlayer (assignedGunner _staticX))) exitWith {hint "The gunner of this static weapon is still alive"};

if (activeGREF and ((typeOf _staticX == staticATteamPlayer) or (typeOf _staticX == staticAAteamPlayer))) exitWith {hint "This weapon cannot be dissassembled"};

_nearX = [markersX,_staticX] call BIS_fnc_nearestPosition;

if (not(sidesX getVariable [_nearX,sideUnknown] == teamPlayer)) exitWith {hint "You have to conquer this zone in order to be able to steal this Static Weapon"};

_staticX setOwner (owner _playerX);

private _staticClass =	typeOf _staticX;
private _staticComponents = getArray (configFile >> "CfgVehicles" >> _staticClass >> "assembleInfo" >> "dissasembleTo");

deleteVehicle _staticX;
 
//We need to create the ground weapon holder first, otherwise it won't spawn exactly where we tell it to.
private _groundWeaponHolder = createVehicle ["GroundWeaponHolder", (getPosATL _playerX), [], 0, "CAN_COLLIDE"];
 
for "_i" from 0 to ((count _staticComponents) - 1) do 
	{
		_groundWeaponHolder addBackpackCargoGlobal [(_staticComponents select _i), 1];
	};

[_groundWeaponHolder] call A3A_fnc_AIVEHinit;

/* [_bag1] call A3A_fnc_AIVEHinit;
[_bag2] call A3A_fnc_AIVEHinit; */

hint "Weapon Stolen. It won't despawn when you assemble it again";