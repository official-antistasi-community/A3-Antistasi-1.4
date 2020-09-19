////////////////////////////////////
//      ACE ITEMS LIST           ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating ACE Items List",servertime];
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

publicVariable "aceItems";
publicVariable "aceMedItems";

////////////////////////////////////
//   ACE ITEMS MODIFICATIONS     ///
////////////////////////////////////
initialRebelEquipment append aceItems;


//ACE medical starting items
if (hasACEMedical) then {
	initialRebelEquipment append aceMedItems;
};

lootItem append ["ACE_acc_pointer_green_IR","ACE_Chemlight_Shield","ACE_VMH3","ACE_VMM3"];

lootMagazine deleteAt (lootMagazine find "ACE_PreloadedMissileDummy");
allLightAttachments deleteAt (allLightAttachments find "ACE_acc_pointer_green");
lootItem deleteAt (lootItem find "MineDetector");
