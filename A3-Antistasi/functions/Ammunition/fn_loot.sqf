////////////////////////////////////
//   DEFENDER WEAPONS AND AMMO   ///
////////////////////////////////////
//Creates the list of weapons and ammo for DEFENDER loot crates
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Occupant Crate Lists",servertime];
_checked = [];
{
{
_typeX = _x;
if !(_typeX in _checked) then
	{
	_checked pushBack _typeX;
	_loadout = getUnitLoadout _typeX;
	for "_i" from 0 to 2 do
		{
		if !(_loadout select _i isEqualTo []) then
			{
				_weapon = [((_loadout select _i) select 0)] call BIS_fnc_baseWeapon;
				if !(_weapon in weaponsNato) then {weaponsNato pushBack _weapon};
			};
		};
	};
} forEach _x;
} forEach groupsNATOmid + [NATOSpecOp] + groupsNATOSquad;

{
_nameX = [_x] call BIS_fnc_baseWeapon;
_magazines = getArray (configFile / "CfgWeapons" / _nameX / "magazines");
ammunitionNATO pushBack (_magazines select 0);
} forEach weaponsNato;

////////////////////////////////////
//   INVADER WEAPONS AND AMMO    ///
////////////////////////////////////
//Creates the list of weapons and ammo for INVADER loot crates
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Invader Crate Lists",servertime];
{
{
_typeX = _x;
if !(_typeX in _checked) then
	{
	_checked pushBack _typeX;
	_loadout = getUnitLoadout _typeX;
	for "_i" from 0 to 2 do
		{
		if !(_loadout select _i isEqualTo []) then
			{
				_weapon = [((_loadout select _i) select 0)] call BIS_fnc_baseWeapon;
				if !(_weapon in weaponsCSAT) then {weaponsCSAT pushBack _weapon};
			};
		};
	};
} forEach _x;
} forEach groupsCSATmid + [CSATSpecOp] + groupsCSATSquad;

{
_nameX = [_x] call BIS_fnc_baseWeapon;
_magazines = getArray (configFile / "CfgWeapons" / _nameX / "magazines");
ammunitionCSAT pushBack (_magazines select 0);
} forEach weaponsCSAT;
