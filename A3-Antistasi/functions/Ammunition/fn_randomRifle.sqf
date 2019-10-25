private _unit = _this select 0;
private _pool = _this select 1;
if (_pool isEqualTo []) then {
	if !(unlockedRifles isEqualTo []) then {
		_pool = unlockedRifles;
	} else {
		if !(unlockedSMGs isEqualTo []) then {
			_pool = unlockedSMGs;
		};
	};
};
private _rifleFinal = selectRandom _pool;
if (_rifleFinal == primaryWeapon _unit) exitWith {};

private _magazines = getArray (configFile / "CfgWeapons" / (primaryWeapon _unit) / "magazines");
{_unit removeMagazines _x} forEach _magazines;
_unit removeWeaponGlobal (primaryWeapon _unit);

if (_rifleFinal in unlockedGrenadeLaunchers) then {
	_unit addMagazine ["1Rnd_HE_Grenade_shell", 3];
};

[_unit, _rifleFinal, 5, 0] call BIS_fnc_addWeapon;

if (count unlockedOptics > 0) then {
	private _compatibleX = [primaryWeapon _unit] call BIS_fnc_compatibleItems;
	private _potentials = unlockedOptics select {_x in _compatibleX};
	if (count _potentials > 0) then {_unit addPrimaryWeaponItem (selectRandom _potentials)};
};