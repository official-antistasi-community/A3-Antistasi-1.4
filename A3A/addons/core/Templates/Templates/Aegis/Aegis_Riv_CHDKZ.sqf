private _hasWs = "ws" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;

////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "CHDKZ"] call _fnc_saveToTemplate;
["nameLeader", "Mikola Bardak"] call _fnc_saveToTemplate;

//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////
["faces", [
	"RussianHead_1", 
	"RussianHead_2", 
	"RussianHead_3", 
	"RussianHead_4", 
	"RussianHead_5", 
	"WhiteHead_29", 
	"WhiteHead_30", 
	"LivonianHead_1", 
	"LivonianHead_2",
	"LivonianHead_3",
	"LivonianHead_4",
	"LivonianHead_5",
	"LivonianHead_6",
	"LivonianHead_7",
	"LivonianHead_8",
	"LivonianHead_9",
	"LivonianHead_10",
	"PersianHead_A3_01",
	"PersianHead_A3_02",
	"GreekHead_A3_02",
	"GreekHead_A3_06",
	"GreekHead_A3_03",
	"GreekHead_A3_04",
	"AsianHead_A3_03",
	"AsianHead_A3_06"
]] call _fnc_saveToTemplate; 
["voices", ["Male01RUS", "Male02RUS", "Male03RUS", "Male01POL", "Male02POL", "Male03POL"]] call _fnc_saveToTemplate;


//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate; 	
["surrenderCrate", "Box_RUS_Wps_F"] call _fnc_saveToTemplate;

private _unarmedCars = ["Opf_O_S_Offroad_01_F"];
private _armedCars = ["Opf_O_S_Offroad_01_AT_F", "Opf_O_S_Offroad_01_armed_F"];

if (_hasWs) then {
	_unarmedCars pushBack "I_Tura_Offroad_armor_lxWS";
	_armedCars append ["I_Tura_Offroad_armor_AT_lxWS", "Opf_O_S_Offroad_01_armed_F"];
};

["vehiclesRivalsLightArmed", ["Opf_O_S_Offroad_01_AT_F", "Opf_O_S_Offroad_01_armed_F"]] call _fnc_saveToTemplate;
["vehiclesRivalsCars", ["Opf_O_S_Offroad_01_F"]] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", ["Opf_O_S_Truck_02_transport_F", "Opf_O_S_Truck_02_F"]] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", ["Opf_O_S_APC_Tracked_02_30mm_lxWS"]] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", ["Opf_O_S_MBT_02_cannon_F"]] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", ["O_Raven_Heli_Light_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;			
["vehiclesRivalsUavs", ["O_UAV_01_F"]] call _fnc_saveToTemplate;			

["staticLowWeapons", ["O_G_HMG_02_F", "O_GMG_01_F", "O_HMG_01_F"]] call _fnc_saveToTemplate;
["staticMortars", ["O_Mortar_01_F"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;

["handGrenadeAmmo", ["GrenadeHandEast", "GrenadeHandGuer"]] call _fnc_saveToTemplate;
["mortarAmmo", ["Sh_82mm_AMOS"]] call _fnc_saveToTemplate;

["variants", [
	["I_Tura_Offroad_armor_armed_lxWS", ["Black", 1]],
    ["I_Tura_Offroad_armor_AT_lxWS", ["Black", 1]],
    ["I_Tura_Offroad_armor_lxWS", ["Black", 1]]
]] call _fnc_saveToTemplate;

["animations", [
	["Opf_O_S_APC_Tracked_02_30mm_lxWS", ["showTracks",0.3,"showCamonetHull",0.3,"showBags",0.3,"showSLATHull",0.3]],
	["Opf_O_S_MBT_02_cannon_F", ["showCamonetTurret",0.3,"showCamonetHull",0.3,"showLog",0.3]],
    ["Opf_O_S_Offroad_01_armed_F", ["Hide_Shield",0.3,"Hide_Rail",0.3,"HideDoor1",1,"HideDoor2",1,"HideDoor3",1,"HideBackpacks",0.3,"HideConstruction",0.3]],
    ["Opf_O_S_Offroad_01_AT_F", ["HideDoor1",1,"HideDoor2",1,"HideDoor3",1,"HideBackpacks",0.3,"HideConstruction",0.3]],
    ["Opf_O_S_Offroad_01_F", ["HideDoor1",1,"HideDoor2",1,"HideDoor3",1,"HideBackpacks",0.3,"HideConstruction",0.3,"hidePolice",1,"HideServices",1,"BeaconsStart",0,"BeaconsServicesStart",0]]
]] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;

private _enforcerRifles = [
	["Opf_arifle_SKS_F", "", "", "", ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Tracer_F"], [], ""],
	["sgun_Mp153_black_F", "", "acc_flashlight_pistol", "", ["4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Slug"], [], ""],
	["arifle_AKM_F", "", "", "", ["75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_Tracer_F"], [], ""]
];
private _mgs = [
	["arifle_AKM_F", "", "", "",  ["75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_Tracer_F"], [], ""],
	["arifle_RPK_F", "", "", "",  ["75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_F", "75Rnd_762x39_Mag_Tracer_F"], [], ""]
];

if (_hasWs) then {
	_mgs pushBack ["LMG_S77_lxWS", "", "acc_pointer_IR", "optic_NVS", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""];
	_enforcerRifles pushBack ["sgun_aa40_lxWS", "", "", "", ["20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Slug_lxWS", "20Rnd_12Gauge_AA40_HE_lxWS"], [], ""];
};
_loadoutData set ["enforcerRifles", _enforcerRifles];
_loadoutData set ["machineGuns", _mgs];

_loadoutData set ["rifles", [
	["Aegis_arifle_AK74_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
	["Aegis_arifle_AK74_oak_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
	["arifle_AKM_F", "", "", "",  ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Tracer_F"], [], ""],
	["arifle_AKM_F", "", "", "",  ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Tracer_F"], [], ""],
	["arifle_RPK_F", "", "", "",  ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Tracer_F"], [], ""],
	["arifle_RPK_F", "", "", "",  ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Tracer_F"], [], ""]
]];
_loadoutData set ["tunedRifles", [
	["Aegis_arifle_AK103_F", "", "", "optic_Arco_AK_blk_F", ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Tracer_F"], [], ""],
	["Aegis_arifle_AK103_F", "", "", "optic_MRCO", ["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Tracer_F"], [], ""],
	["arifle_AK12_545_F", "muzzle_mzls_545", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
	["arifle_AK12_545_F", "muzzle_mzls_545", "acc_flashlight", "optic_MRCO", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
	["arifle_AK12U_545_F", "muzzle_mzls_545", "acc_flashlight", "optic_Arco_AK_blk_F", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],
	["arifle_AK12U_545_F", "muzzle_mzls_545", "acc_flashlight", "optic_MRCO", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""]
]];
_loadoutData set ["carbines", [
	["Aegis_arifle_AKS74_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
	["Aegis_arifle_AKS74_oak_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],
	["arifle_AKS_F", "", "", "", ["30Rnd_545x39_Mag_F", "30Rnd_545x39_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], [], ""]
]];
_loadoutData set ["grenadeLaunchers", [
["Aegis_arifle_AK74_GL_oak_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Green_F", "30Rnd_545x39_Mag_Tracer_Green_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["Aegis_arifle_AK74_GL_F", "", "acc_flashlight_pistol", "", ["30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_F", "30Rnd_545x39_Black_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_loadoutData set ["marksmanRifles", [
["srifle_DMR_04_F", "", "acc_flashlight", "optic_DMS_weathered_Kir_F",  ["10Rnd_127x54_Mag"], [], ""],
["srifle_DMR_01_black_F", "muzzle_mzls_B", "acc_flashlight", "optic_MRCO",  ["10Rnd_762x54_Mag"], [], "bipod_02_F_blk"],
["srifle_DMR_01_black_F", "", "acc_flashlight", "optic_MRCO",  ["10Rnd_762x54_Mag"], [], ""]
]];
_loadoutData set ["lightATLaunchers", [
["launch_RPG7_F", "", "", "", ["RPG7_F", "RPG7_F", "RPG7_F"], [], ""],
["launch_RPG7_F", "", "", "", ["RPG7_F", "RPG7_F", "RPG7_F"], [], ""],
["launch_RPG7_F", "", "", "", ["RPG7_F", "RPG7_F", "RPG7_F"], [], ""],
["launch_RPG7_F", "", "", "", ["RPG7_F", "RPG7_F", "RPG7_F"], [], ""],
["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F"], [], ""],
["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F"], [], ""],
["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F"], [], ""],
["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""],
["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT", "Vorona_HE"], [], ""]
]];
_loadoutData set ["lightHELaunchers", [
["launch_RPG32_black_F", "", "", "", ["RPG32_HE_F", "RPG32_HE_F"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_B_Titan_olive_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""],
["launch_Titan_blk_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", ["hgun_Rook40_F","hgun_Pistol_01_F"]];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["IEDLandSmall_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["IEDLandBig_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade_Guer", "HandGrenade_East"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

_loadoutData set ["facewear", [
	"G_Cigarette",
	"G_Aviator",
	"G_Shades_Black",
	"G_Shades_Blue",
	"G_Shades_Green",
	"G_Shades_Red",
	"G_Sport_Red",
	"G_Sport_Blackyellow",
	"G_Sport_BlackWhite",
	"G_Sport_Checkered",
	"G_Sport_Blackred",
	"G_Sport_Greenblack",
	"G_Bandanna_tan", 
	"G_Bandanna_sport", 
	"G_Bandanna_shades", 
	"G_Bandanna_oli", 
	"G_Bandanna_khk", 
	"G_Bandanna_blk", 
	"G_Bandanna_beast",
	"G_Bandanna_aviator",
	"G_Shemag_khk",
	"G_Shemag_oli",
	"G_Shemag_shades",
	"G_Shemag_tactical",
	"G_Shemag_tan"
]];
_loadoutData set ["fullmask", [	"G_Balaclava_blk", "G_Balaclava_lowprofile", "G_Balaclava_oli"]];

_loadoutData set ["headgear", [
    "H_MilCap_grn",
    "H_MilCap_gry",
    "H_Shemag_olive", 
	"H_Shemag_khk",
    "H_Cap_headphones",
	"H_Watchcap_camo",
	"H_Booniehat_mgrn"
]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["Rangefinder", ["Rangefinder"]];


_loadoutData set ["uniforms", [
	"U_I_L_Uniform_01_camo_F",
	"U_I_L_Uniform_01_deserter_F",
	"U_B_ION_Uniform_01_poloshirt_blue_F",
	"U_B_ION_Uniform_01_tshirt_black_F",
	"Opf_U_O_S_Uniform_01_arid_F",
	"Opf_U_I_I_Uniform_01_ghex_F",
	"Opf_U_I_I_Uniform_01_hex_F",
	"Opf_U_O_S_Uniform_01_sweater_F",
	"Opf_U_O_S_Uniform_01_taiga_F",
	"Opf_U_I_I_Uniform_01_urb_F",
	"Opf_U_I_I_Uniform_01_tshirt_black_F"
]];
_loadoutData set ["heavyUniforms", [
	"U_O_R_Gorka_01_black_F"
]];

private _helmets = [
	"H_HelmetSpecter_cover_khaki_F", 
	"H_HelmetSpecter_paint_F", 
	"H_HelmetSpecter_F", 
	"H_HelmetSpecter_paint_headset_F",
	"H_HelmetSpecter_black_headset_F",
	"H_HelmetSpecter_headset_F",
	"H_HelmetSpecter_black_F"
];

if (_hasWs) then {
	_helmets pushBack "lxWS_H_ssh40_green";
};

_loadoutData set ["offuniforms", ["Opf_U_O_S_Uniform_01_sweater_F", "Opf_U_O_S_Uniform_01_arid_F"]];
_loadoutData set ["vests", ["V_SmershVest_01_olive_F", "V_SmershVest_01_radio_olive_F", "V_TacVest_grn", "V_HarnessOSpec_blk"]];
_loadoutData set ["heavyVests", ["Aegis_V_OCarrierLuchnik_CQB_blk_F", "Aegis_V_OCarrierLuchnik_Lite_blk_F", "Aegis_V_OCarrierLuchnik_blk_F"]];
_loadoutData set ["backpacks", ["B_FieldPack_oli"]];
_loadoutData set ["helmets", _helmets];
_loadoutData set ["crewHelmets", ["H_Tank_black_F"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadleader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["vests", ["V_BandollierB_taiga_F"]];
_crewLoadoutData set ["helmets", ["H_Tank_black_F"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["vests", ["V_BandollierB_taiga_F"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_I_E", "H_PilotHelmetHeli_I_E_visor_up"]];


// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _cellLeaderTemplate = {
	if (random 100 > 60) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	[selectRandom ["vests", "heavyVests"]] call _fnc_setVest;
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _mercenaryTemplate = {
	["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "facewear", 1, "fullmask", 1]] call _fnc_setFacewear;
	["heavyVests"] call _fnc_setVest;
	["heavyUniforms"] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles", "tunedRifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _enforcerTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["enforcerRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _partisanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["backpacks"] call _fnc_setBackpack;
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 3] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_rifleman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _minutemanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_rifleman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

  	["carbines"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_medic"] call _fnc_addItemSet;
	["items_medic_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _saboteurTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	[selectRandom ["vests", "heavyVests"]] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 2] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	["items_medical_standard"] call _fnc_addItemSet;
	["items_grenadier_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 4] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["heavyVests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_explosivesExpert_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["lightExplosives", 2] call _fnc_addItem;
	if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["lightATLaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_at_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["AALaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_aa_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _oppressorTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_machineGunner_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _sharpshooterTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;


	["marksmanRifles"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_marksman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["Rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _crewTemplate = {
	["crewHelmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "fullmask", 1.25, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["carbines"] call _fnc_setPrimary;
	["primary", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_crew_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
	["vests"] call _fnc_setVest;
	[selectRandomWeighted [[], 1.5, "facewear", 1, "fullmask", 1]] call _fnc_setFacewear;
	["uniforms"] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _commanderTemplate = {
	[selectRandomWeighted ["helmets", 0.3, "headgear", 0.7]] call _fnc_setHelmet;
	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["vests"] call _fnc_setVest;
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

///////////////////////
//  Rivals Units     //
///////////////////////
private _prefix = "militia";
private _unitTypes = [
	["CellLeader", _cellLeaderTemplate, [], [_prefix, true]],
	["Mercenary", _mercenaryTemplate, [], [_prefix, true]],
	["Minuteman", _minutemanTemplate, [], [_prefix, true]],
	["Enforcer", _enforcerTemplate, [], [_prefix, true]],
	["Partisan", _partisanTemplate, [], [_prefix, true]],
	["Saboteur", _saboteurTemplate, [], [_prefix, true]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix, true]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix, true]],
	["SpecialistAT", _atTemplate, [], [_prefix, true]],
	["SpecialistAA", _aaTemplate, [], [_prefix, true]],
	["Oppressor", _oppressorTemplate, [], [_prefix, true]],
	["Sharpshooter", _sharpshooterTemplate, [], [_prefix, true]]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////
[_prefix, [["Crew", _crewTemplate, [], [_prefix, true]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Pilot", _crewTemplate, [], [_prefix, true]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Commander", _commanderTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Unarmed", _unarmedTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;