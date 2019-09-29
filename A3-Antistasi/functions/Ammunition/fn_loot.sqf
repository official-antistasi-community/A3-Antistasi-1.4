////////////////////////////////////
//       REBEL LOOT ITEMS        ///
////////////////////////////////////
//These items occupy the general items slot of loot crates
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Loot Items Lists",servertime];
itemsAAF =
	[
	"Laserbatteries",
	"MineDetector",
	"Rangefinder",
	"Laserdesignator",
	"ItemRadio"
	];
itemsAAF append allAttachmentBipod + allAttachmentMuzzle + allAttachmentPointer;
if (hasRHS and !hasIFA) then
	{
	//RHS Loot Items
	itemsAAF =
		[
		"MineDetector",
		"acc_pointer_IR",
		"ItemRadio"
		];
	}
	else
		{
		if (hasIFA) then
			{
			//IFA Loot Items
			itemsAAF =
				[
				"LIB_ToolKit"
				];
			};
		};

////////////////////////////////////
//     PLACED EXPLOSIVES LOOT    ///
////////////////////////////////////
//This is the ONLY SOURCE of mines loot for crates
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Loot Mines Lists",servertime];
minesAAF =
	[
	"SLAMDirectionalMine_Wire_Mag",
	"SatchelCharge_Remote_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"ATMine_Range_Mag","APERSTripMine_Wire_Mag",
	"APERSMine_Range_Mag",
	"APERSBoundingMine_Range_Mag"
	];

if (hasRHS and !hasIFA) then
	{
	//RHS MINE LOOT
	minesAAF =
		["rhsusf_m112_mag",
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
			//IFA MINE LOOT
			minesAAF =
				["LIB_PMD6_MINE_mag",
				"LIB_TM44_MINE_mag",
				"LIB_US_TNT_4pound_mag"
				];
			};
		};

////////////////////////////////////
//   REBEL FACTION LAUNCHERS     ///
////////////////////////////////////
//These launchers will be IN ADDITION TO whatever launchers enemies carry
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Loot Launchers Lists",servertime];
antitankAAF =
	[
	"launch_I_Titan_F",
	"launch_I_Titan_short_F"
	];
if (hasIFA) then
	{
	antitankAAF =
		["LIB_Shg24"];
	};
if (hasRHS) then
	{
	antitankAAF =
		[];
	};

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
