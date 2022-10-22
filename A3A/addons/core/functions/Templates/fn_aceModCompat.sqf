#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
////////////////////////////////////
//      ACE ITEMS LIST           ///
////////////////////////////////////
Info("Creating ACE Items List");
aceItems = [
	"ACE_EarPlugs",
	"ACE_RangeCard",
	"ACE_Clacker",
	"ACE_DefusalKit",
	"ACE_MapTools",
	"ACE_Flashlight_MX991",
	"ACE_wirecutter",
	"ACE_RangeTable_82mm",
	"ACE_EntrenchingTool",
	"ACE_Cellphone",
	"ACE_CableTie",
	"ACE_SpottingScope",
	"ACE_Tripod",
	"ACE_Spraypaintred",
	"ACE_UAVBattery",
	"ACE_SpareBarrel",
	"ACE_Flashlight_XL50",
	"ACE_HandFlare_White"
];

aceMedItems = [
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_packingBandage",
	"ACE_quikclot",
	"ACE_bloodIV",
	"ACE_bloodIV_250",
	"ACE_bloodIV_500",
	"ACE_plasmaIV",
	"ACE_plasmaIV_500",
	"ACE_plasmaIV_250",
	"ACE_salineIV",
	"ACE_salineIV_500",
	"ACE_salineIV_250",
	"ACE_surgicalKit",
	"ACE_tourniquet",
	"ACE_epinephrine",
	"ACE_morphine",
	"ACE_adenosine",
	"ACE_splint",
	"ACE_bodyBag",
	"ACE_personalAidKit"
];

advItems = [
	"adv_aceCPR_AED"
];

katMedItems = [
	"kat_aatKit",
	"kat_accuvac",
	"kat_X_AED",
	"kat_AED",
	"kat_crossPanel",
	"kat_chestSeal",
	"kat_guedel",
	"kat_larynx",
	"kat_Pulseoximeter",
	"kat_Painkiller"
];

aceCoolingItems = [
	"ACE_Canteen",
	"ACE_Canteen_Half",
	"ACE_Canteen_Empty",
	"ACE_WaterBottle",
	"ACE_WaterBottle_Half",
	"ACE_WaterBottle_Empty",
	"ACE_Can_Franta",
	"ACE_Can_RedGull",
	"ACE_Can_Spirit"
];

aceFoodItems = [
	"ACE_MRE_BeefStew",
	"ACE_MRE_ChickenTikkaMasala",
	"ACE_MRE_ChickenHerbDumplings",
	"ACE_MRE_CreamChickenSoup",
	"ACE_MRE_CreamTomatoSoup",
	"ACE_MRE_LambCurry",
	"ACE_MRE_MeatballsPasta",
	"ACE_MRE_SteakVegetables"
];

publicVariable "aceItems";
publicVariable "aceMedItems";
publicVariable "advItems";
publicVariable "katMedItems";
publicVariable "aceCoolingItems";
publicVariable "aceFoodItems";

////////////////////////////////////
//   ACE ITEMS MODIFICATIONS     ///
////////////////////////////////////
FactionGet(reb,"initialRebelEquipment") append aceItems;


//ACE medical starting items
if (A3A_hasACEMedical) then {
	FactionGet(reb,"initialRebelEquipment") append aceMedItems;
};

if (A3A_hasADV) then {
	FactionGet(reb,"initialRebelEquipment") append advItems;
};

if (A3A_hasKAT) then {
	FactionGet(reb,"initialRebelEquipment") append katMedItems;
};

FactionGet(reb,"initialRebelEquipment") append aceCoolingItems;

if (aceFood) then {
	FactionGet(reb,"initialRebelEquipment") append aceFoodItems;
};

if !("lowTech" in A3A_factionEquipFlags) then {
	lootItem append ["ACE_acc_pointer_green_IR","ACE_Chemlight_Shield","ACE_VMH3","ACE_VMM3"];
};
lootMagazine deleteAt (lootMagazine find "ACE_PreloadedMissileDummy");
allLightAttachments deleteAt (allLightAttachments find "ACE_acc_pointer_green");
lootItem deleteAt (lootItem find "MineDetector");
