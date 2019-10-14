////////////////////////////////////
//   IFA ITEMS MODIFICATIONS     ///
////////////////////////////////////
/*
smokeGrenade = ["LIB_RDG","LIB_NB39"];
chemLight = [];
lootNVG = [];
lootAttachment = [];
lootBackpack = [];
lootHelmet = [];
lootVest = [];
armoredHeadgear = [];
{armoredHeadgear pushBackUnique (getUnitLoadout _x select 6)} forEach NATOSquad;
*/
if (hasACE) then {
	lootItem append ["ACE_LIB_LadungPM","ACE_SpareBarrel"];
};

private _libStaticParts = [];
{
	if ((getText (configFile >> "CfgWeapons" >> _x >> "LIB_WeaponType")) isEqualTo "ROCKET") then {
		_libStaticParts pushBack _x;
	};
} forEach rlaunchers;

{
lootWeapon deleteAt (lootWeapon find _x);
} forEach _libStaticParts;
