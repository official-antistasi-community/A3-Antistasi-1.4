////////////////////////////////////
//   IFA ITEMS MODIFICATIONS     ///
////////////////////////////////////
smokeGrenade = ["LIB_RDG","LIB_NB39"];	//Resets Smoke Greandes
chemLight = [];					//Clears all chems
lootNVG = [];						//Clears NVG's
armoredHeadgear = [];				//Clears all Helmets
{armoredHeadgear pushBackUnique (getUnitLoadout _x select 6)} forEach NATOSquad;

if (hasIFA) then
	{
	lootItem append ["ACE_LIB_LadungPM","ACE_SpareBarrel"];
	};
