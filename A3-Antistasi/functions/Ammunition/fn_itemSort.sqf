//Begin Loot Lists
//Not sure why we get these, but here it is....
diveGear = ["V_RebreatherIA","G_Diving"];
if (side (group petros) == west) then {diveGear pushBack "U_B_Wetsuit"} else {diveGear pushBack "U_I_Wetsuit"};

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

////////////////////////////////////
//   WEAPON ATTACHMENTS LIST     ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Weapon Attachment Lists",servertime];
{
{
_item = _x;
if !(_item in (opticsAAF + flashLights + pointers)) then
	{
	if (isCLass(configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "OpticsModes")) then
		{
		opticsAAF pushBack _item
		}
	else
		{
		if (isClass (configfile >> "CfgWeapons" >> _item >> "ItemInfo" >> "FlashLight" >> "Attenuation")) then
			{
			flashLights pushBack _item;
			}
		else
			{
			if (isClass (configfile >> "CfgWeapons" >> _item >> "ItemInfo" >> "Pointer")) then
				{
				pointers pushBack _item;
				};
			};
		};
	};
} forEach (_x call BIS_fnc_compatibleItems);
} forEach (weaponsNato + weaponsCSAT);

////////////////////////////////////
//   SMOKE GRENADES LIST         ///
////////////////////////////////////
//THIS LIST IS USED BY LOOT CRATES AND AI CURRENTLY
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Smoke Grenade Lists",servertime];
smokeX = ["SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellBlue","SmokeShellYellow","SmokeShellPurple","SmokeShellOrange"];

////////////////////////////////////
//   CHEMLIGHTS LIST             ///
////////////////////////////////////
//Chemlight loot for crates
//this is an ugly list of vanilla chems I made myself - PBP
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Chemstick Lists",servertime];
chemX = ["Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue"];
