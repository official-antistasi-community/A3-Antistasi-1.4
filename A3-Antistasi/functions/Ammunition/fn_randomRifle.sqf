private ["_unit","_compatibleX","_potentials","_rifle","_helmet","_uniform","_vest"];

_unit = _this select 0;
_pool = _this select 1;
if (_pool isEqualTo []) exitWith {};
_rifleFinal = selectRandom _pool;
if (_rifleFinal == primaryWeapon _unit) exitWith {};

_magazines = getArray (configFile / "CfgWeapons" / (primaryWeapon _unit) / "magazines");
{_unit removeMagazines _x} forEach _magazines;
_unit removeWeaponGlobal (primaryWeapon _unit);

if (_rifleFinal in unlockedGL) then
	{
	_unit addMagazine ["1Rnd_HE_Grenade_shell", 3];
	};
[_unit, _rifleFinal, 5, 0] call BIS_fnc_addWeapon;
if (count unlockedOptics > 0) then
	{
	_compatibleX = [primaryWeapon _unit] call BIS_fnc_compatibleItems;
	_potentials = unlockedOptics select {_x in _compatibleX};
	if (count _potentials > 0) then {_unit addPrimaryWeaponItem (selectRandom _potentials)};
	};