private _unit = _this select 0;
private _pool = _this select 1;
if (_pool isEqualTo []) then {
	if !(unlockedRifles isEqualTo []) then {
		_pool = unlockedRifles;
	} else {
		if !(unlockedSMGs isEqualTo []) then {
			_pool = unlockedSMGs;
		} else {
			_pool = unlockedShotguns + unlockedSniperRifles;
		};
	};
};
private _rifleFinal = selectRandom _pool;

if !(primaryWeapon _unit isEqualTo "") then {
	if (_rifleFinal == primaryWeapon _unit) exitWith {};
	private _magazines = getArray (configFile / "CfgWeapons" / (primaryWeapon _unit) / "magazines");
	{_unit removeMagazines _x} forEach _magazines;			// Broken, doesn't remove mags globally. Pain to fix.
	_unit removeWeapon (primaryWeapon _unit);
};

if (_rifleFinal in unlockedGrenadeLaunchers && {_rifleFinal in unlockedRifles} ) then {
	// lookup real underbarrel GL magazine, because not everything is 40mm
	private _config = configFile >> "CfgWeapons" >> _rifleFinal;
	private _glmuzzle = getArray (_config >> "muzzles") select 1;		// guaranteed by category
	private _glmag = getArray (_config >> _glmuzzle >> "magazines") select 0;
	_unit addMagazines [_glmag, 5];
};

[_unit, _rifleFinal, 5, 0] call BIS_fnc_addWeapon;

if (count unlockedOptics > 0) then {
	private _compatibleX = [primaryWeapon _unit] call BIS_fnc_compatibleItems;
	private _potentials = unlockedOptics select {_x in _compatibleX};
	if (count _potentials > 0) then {_unit addPrimaryWeaponItem (selectRandom _potentials)};
};