/////////////////
//   Optics   ///
/////////////////
lootOptic append allAttachmentOptic;

/////////////////
//   Bipods   ///
/////////////////
lootBipod append allAttachmentBipod;

/////////////////
//  Silencers ///
/////////////////
lootSilencer append allAttachmentMuzzle;

///////////////////
//   Pointers   ///
///////////////////
lootPointer append allAttachmentPointer;

///////////////////
//  Explosives  ///
///////////////////
lootExplosives append allMineBounding + allMineDirectional + allMineBounding;

lootExplosives deleteAt (lootExplosives find "DemoCharge_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "APERSMineDispenser_Mag");
lootExplosives deleteAt (lootExplosives find "TrainingMine_Mag");
lootExplosives deleteAt (lootExplosives find "IEDLandSmall_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "IEDUrbanSmall_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "IEDLandBig_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "IEDUrbanBig_Remote_Mag");

/////////////////////
// Assigned Items ///
/////////////////////
lootItems append allMineDetector + allGPS + allRadio;

/////////////////
// Binoculars ///
/////////////////
lootBinocular append allLaserDesignator + allBinocular;

/////////////////
//    NVG'S   ///
/////////////////
lootNVG append allNVG;

/////////////////////////////
//   Smoke, Chem, Flare   ///
/////////////////////////////
lootSignalMag append allMagSmokeShell + allMagFlare;

////////////////////////////////////
//   DEFENDER WEAPONS AND AMMO   ///
////////////////////////////////////
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
//       REBEL LOOT ITEMS        ///
////////////////////////////////////
itemsAAF pushBack "Laserbatteries";

itemsAAF append lootBipod + lootOptic + lootSilencer + lootPointer + lootNVG + lootBinocular;

////////////////////////////////////
//     PLACED EXPLOSIVES LOOT    ///
////////////////////////////////////
minesAAF append lootExplosives;

if (hasRHS and !hasIFA) then
	{
	minesAAF =
		[
		"rhsusf_m112_mag",
		"rhsusf_mine_m14_mag",
		"rhs_mine_M19_mag",
		"rhs_mine_tm62m_mag",
		"rhs_mine_pmn2_mag"
		];
	}
	else
		{
		if (hasIFA) then
			{
			minesAAF =
				[
				"LIB_PMD6_MINE_mag",
				"LIB_TM44_MINE_mag",
				"LIB_US_TNT_4pound_mag"
				];
			};
		};
