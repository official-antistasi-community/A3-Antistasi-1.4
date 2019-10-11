////////////////////////////////////
//      ACE ITEMS LIST           ///
////////////////////////////////////
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating ACE Items List",servertime];
aceItems = [
	"ACE_EarPlugs",
	"ACE_RangeCard",
	"ACE_Clacker",
	"ACE_M26_Clacker",
	"ACE_DeadManSwitch",
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
	"ACE_Spraypaintred"
];

aceBasicMedItems = [
	"ACE_fieldDressing",
	"ACE_bloodIV_500",
	"ACE_bloodIV",
	"ACE_epinephrine",
	"ACE_morphine",
	"ACE_bodyBag"
];

aceAdvMedItems = [
	"ACE_elasticBandage",
	"ACE_quikclot",
	"ACE_bloodIV_250",
	"ACE_packingBandage",
	"ACE_plasmaIV",
	"ACE_plasmaIV_500",
	"ACE_plasmaIV_250",
	"ACE_salineIV",
	"ACE_salineIV_500",
	"ACE_salineIV_250",
	"ACE_surgicalKit",
	"ACE_tourniquet",
	"ACE_adenosine",
	"ACE_atropine"
]
+ ([["ACE_personalAidKit"], ["adv_aceCPR_AED"]] select hasADVCPR)
+ ([[], ["adv_aceSplint_splint"]] select hasADVSplint);

publicVariable "aceItems";
publicVariable "aceBasicMedItems";
publicVariable "aceAdvMedItems";

////////////////////////////////////
//   ACE ITEMS MODIFICATIONS     ///
////////////////////////////////////
unlockedItems append aceItems;


//ACE medical starting items
if (hasACEMedical) then {
	switch (ace_medical_level) do {
		case 1: {
			unlockedItems append aceBasicMedItems;
		};
		case 2: {
			unlockedItems append aceBasicMedItems + aceAdvMedItems;
		};
	};
};

lootItem append ["ACE_acc_pointer_green_IR","ACE_Chemlight_Shield","ACE_VMH3","ACE_VMM3","ACE_HuntIR_monitor"];

lootMagazine deleteAt (lootMagazine find "ACE_PreloadedMissileDummy");
attachmentLight deleteAt (attachmentLight find "ACE_acc_pointer_green");
lootItem deleteAt (lootItem find "MineDetector");