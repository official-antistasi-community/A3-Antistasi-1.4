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

aceMedItemsBlood = [
	"ACE_bloodIV",
	"ACE_bloodIV_250",
	"ACE_bloodIV_500"
];

advItems = [
	"adv_aceCPR_AED"
];

katMedItems = [
	"kat_accuvac",     //KAT Airway
	"kat_guedel",     //KAT Airway
	"kat_larynx",     //KAT Airway

	"kat_aatKit",     //KAT Breathing
	"kat_chestSeal",     //KAT Breathing
	"kat_Pulseoximeter",     //KAT Breathing
	"kat_stethoscope",     //KAT Breathing
	"kat_ncdKit",     //standalone alternative to AAT Kit - added in V2.10.2

	"kat_bloodIV_A",     //KAT Circulation
	"kat_bloodIV_A_250",     //KAT Circulation
	"kat_bloodIV_A_250_N",     //KAT Circulation
	"kat_bloodIV_A_500",     //KAT Circulation
	"kat_bloodIV_A_500_N",     //KAT Circulation
	"kat_bloodIV_A_N",     //KAT Circulation
	"kat_bloodIV_AB",     //KAT Circulation
	"kat_bloodIV_AB_250",     //KAT Circulation
	"kat_bloodIV_AB_250_N",     //KAT Circulation
	"kat_bloodIV_AB_500",     //KAT Circulation
	"kat_bloodIV_AB_500_N",     //KAT Circulation
	"kat_bloodIV_AB_N",     //KAT Circulation
	"kat_bloodIV_B",     //KAT Circulation
	"kat_bloodIV_B_250",     //KAT Circulation
	"kat_bloodIV_B_250_N",     //KAT Circulation
	"kat_bloodIV_B_500",     //KAT Circulation
	"kat_bloodIV_B_500_N",     //KAT Circulation
	"kat_bloodIV_B_N",     //KAT Circulation
	"kat_bloodIV_O",     //KAT Circulation
	"kat_bloodIV_O_250",     //KAT Circulation
	"kat_bloodIV_O_250_N",     //KAT Circulation
	"kat_bloodIV_O_500",     //KAT Circulation
	"kat_bloodIV_O_500_N",     //KAT Circulation
	"kat_bloodIV_O_N",     //KAT Circulation

	"kat_crossPanel",     //KAT Circulation
	"KAT_Empty_bloodIV_250",     //KAT Circulation
	"KAT_Empty_bloodIV_500",     //KAT Circulation

	"kat_AED",     //KAT Circulation
	"kat_X_AED",     //KAT Circulation

	"kat_IO_FAST",     //KAT Pharmacy
	"kat_IV_16",     //KAT Pharmacy

	"kat_amiodarone",     //KAT Pharmacy
	"kat_atropine",     //KAT Pharmacy
	//"kat_Carbonate",     //KAT Pharmacy - dublicate in Magazines
	"kat_CarbonateItem",     //KAT Pharmacy
	"kat_EACA",     //KAT Pharmacy
	"kat_fentanyl",     //KAT Pharmacy
	"kat_ketamine",     //KAT Pharmacy
	"kat_lidocaine",     //KAT Pharmacy
	"kat_nalbuphine",     //KAT Pharmacy
	"kat_naloxone",     //KAT Pharmacy
	"kat_nitroglycerin",     //KAT Pharmacy
	"kat_norepinephrine",     //KAT Pharmacy
	//"kat_Painkiller",     //KAT Pharmacy - dublicate in Magazines
	"kat_PainkillerItem",     //KAT Pharmacy
	"kat_phenylephrine",     //KAT Pharmacy
	"kat_TXA",     //KAT Pharmacy

	"kat_etomidate",     //KAT Surgery (Pharmacy)
	"kat_flumazenil",     //KAT Surgery (Pharmacy)
	"kat_lorazepam",     //KAT Surgery (Pharmacy)
	"kat_clamp",     //KAT Surgery
	"kat_plate",     //KAT Surgery
	"kat_retractor",     //KAT Surgery
	"kat_scalpel",     //KAT Surgery
	"kat_vacuum",     //KAT Surgery

	"Attachable_Helistretcher",     //KAT Misc
	"kat_stretcherBag"     //KAT Misc
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
publicVariable "aceMedItemsBlood";
publicVariable "advItems";
publicVariable "katMedItems";
publicVariable "aceCoolingItems";
publicVariable "aceFoodItems";

////////////////////////////////////
//   ACE ITEMS MODIFICATIONS     ///
////////////////////////////////////
FactionGet(reb,"initialRebelEquipment") append aceItems;


//ACE medical starting items
if (A3A_hasACEMedical && !A3A_hasKAT) then {
	FactionGet(reb,"initialRebelEquipment") append aceMedItems;
	FactionGet(reb,"initialRebelEquipment") append aceMedItemsBlood;
};

if (A3A_hasADV) then {
	FactionGet(reb,"initialRebelEquipment") append advItems;
};

if (A3A_hasKAT && A3A_hasACEMedical) then {
	FactionGet(reb,"initialRebelEquipment") append aceMedItems;
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
