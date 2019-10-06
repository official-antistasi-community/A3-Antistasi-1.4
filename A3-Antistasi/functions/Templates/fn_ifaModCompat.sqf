////////////////////////////////////
//   IFA ITEMS MODIFICATIONS     ///
////////////////////////////////////
smokeGrenade = ["LIB_RDG","LIB_NB39"];
chemLight = [];
lootNVG = [];
lootAttachment = [];
lootBackpack = [];
lootHelmet = [];
lootVest = [];
armoredHeadgear = [];
{armoredHeadgear pushBackUnique (getUnitLoadout _x select 6)} forEach NATOSquad;

if (hasIFA) then
	{
	lootItem append ["ACE_LIB_LadungPM","ACE_SpareBarrel"];
	};
