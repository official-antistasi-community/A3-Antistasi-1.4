//////////////////////////
//   Side Information   //
//////////////////////////

["name", "US Army"] call _fnc_saveToTemplate;
["spawnMarkerName", "US Reinforcements"] call _fnc_saveToTemplate;

["flag", "uns_FlagCarrierUS"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_us_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "Faction_UNS_USA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["uns_willys_2_usmc"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["uns_m37b1", "uns_m274"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["uns_willysmg50", "uns_willysmg", "uns_willysm40", "uns_m37b1_m1919", "uns_m274_m40", "uns_m274_m60"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["uns_M35A2_Open", "uns_M35A2"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["uns_M35A2_Open"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["uns_M35A2_ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["uns_M35A2_repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["uns_M35A2_fueltanker", "uns_M35A2_fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["uns_M577_amb"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["uns_xm706e2", "uns_xm706e1", "uns_M113_XM182", "uns_M113_M134", "uns_M113_30cal", "uns_M113_M2"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["uns_M113A1_XM182", "uns_M113A1_M60", "uns_M113A1_M134", "uns_M113A1_M2", "uns_M113A1_M40", "uns_M132"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["uns_m48a3", "uns_m551", "uns_M67A"]] call _fnc_saveToTemplate;
["vehiclesAA", ["uns_m163"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["UNS_Zodiac_W"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["uns_pbr_mk18", "uns_pbr", "uns_PBR_M10"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["uns_M113_XM182", "uns_M113_M60", "uns_M113_M134", "uns_M113A1_M2", "uns_M113_30cal", "uns_M113_transport", "uns_M577_amb", "uns_m163"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["uns_A1J_CAS", "uns_A7_CAS"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["uns_F4E_CAP", "uns_f100b_CAP"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["uns_c1a5cargo", "uns_C130_H"]] call _fnc_saveToTemplate;

// First these three are all three-seaters. Not worth the heli?
["vehiclesHelisLight", ["uns_H13_transport_Army", "uns_oh6_transport", "uns_oh6_m27", "uns_UH1D_m60_light", "uns_UH1H_m60_light"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["uns_UH1D_m60_light", "uns_UH1H_m60_light", "uns_UH1D_m60", "uns_UH1H_m60", "uns_h21c_mg", "uns_ch47_m60_army", "uns_hh53b_m134_usaf"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["uns_UH1C_M21_M200", "uns_UH1C_M21_M158", "UNS_UH1C_M3_ARA", "uns_UH1C_M6_M200_1AC"]] call _fnc_saveToTemplate;           // "UNS_UH1B_TOW" no other weapons
["vehiclesHelisAttack", ["UNS_AH1G_SUU11", "UNS_AH1G_M195", "UNS_AH1G_M200", "UNS_AH1G"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["uns_m110sp", "uns_m107sp", "uns_M113_M30"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
    ["uns_m110sp",["uns_30Rnd_203mmHE"]],
    ["uns_m107sp",["uns_30Rnd_175mmHE"]],
    ["uns_M113_M30",["uns_8Rnd_107mmHE"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["uns_m274_m60"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["uns_m37b1"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["uns_m274"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["uns_willys_2_usmp"]] call _fnc_saveToTemplate;

["staticMGs", ["uns_m2_high"]] call _fnc_saveToTemplate;
["staticAT", ["uns_M40_106mm_US"]] call _fnc_saveToTemplate;
["staticAA", ["Uns_M55_Quad"]] call _fnc_saveToTemplate;
["staticMortars", ["uns_M2_60mm_mortar"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "uns_8Rnd_60mmHE_M2"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "uns_8Rnd_60mmSMOKE_M2"] call _fnc_saveToTemplate;

//Minefield definition
//Not Magazine type would be: ["APERSBoundingMine", "APERSMine", "ATMine"]
["minefieldAT", ["uns_mine_tm57"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["uns_mine_m16"]] call _fnc_saveToTemplate;

#include "UNS_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG"]] call _fnc_saveToTemplate;
["faces", ["AfricanHead_01", "AfricanHead_01_cfaces_lrrpcamo08", "Barklem", "GreekHead_A3_05", "GreekHead_A3_06",
"GreekHead_A3_08", "GreekHead_A3_09", "Sturrock", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03",
"WhiteHead_03_cfaces_lrrpcamo12", "WhiteHead_04", "WhiteHead_05", "WhiteHead_05_cfaces_lrrpcamo13",
"WhiteHead_06", "WhiteHead_06_cfaces_lrrpcamo16", "WhiteHead_07", "WhiteHead_08", "WhiteHead_10",
"WhiteHead_11", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17",
"WhiteHead_19_cfaces_lrrpcamo13", "WhiteHead_21", "WhiteHead_21_cfaces_lrrpcamo10"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = ["loadoutData"] call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [["uns_m72", "", "", "", ["uns_m72rocket"], [], ""]]];
_loadoutData set ["ATLaunchers", [["uns_m20_bazooka", "", "", "", ["uns_M28A2_mag"], [], ""]]];
_loadoutData set ["AALaunchers", [["uns_sa7", "", "", "", ["uns_sa7mag"], [], ""]]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["uns_mine_AV_mag"]];
_loadoutData set ["APMines", ["uns_traps_mine_mag"]];
_loadoutData set ["lightExplosives", ["uns_M118_mag_remote"]];
_loadoutData set ["heavyExplosives", ["DemoCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", ["uns_m14gren", "uns_m34gren"]];
_loadoutData set ["antiInfantryGrenades", ["uns_m67gren", "uns_m61gren", "uns_mk2gren"]];
_loadoutData set ["smokeGrenades", ["uns_m18white"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["UNS_ItemRadio_PRC_90_TFAR"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["uns_binocular_navy"]];
_loadoutData set ["rangefinder", ["uns_binocular_army"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["medBackpacks", ["UNS_USMC_MED", "UNS_ARMY_MED"]];
_loadoutData set ["slBackpacks", ["UNS_ARMY_RTO"]];
_loadoutData set ["helmets", []];
_loadoutData set ["sniHats", ["UNS_Boonie_ODF", "UNS_Boonie_6"]];
_loadoutData set ["slHat", ["H_Beret_blk"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.

private _eeItems = ["ToolKit", "UNS_TrapKit"];
private _mmItems = [];

if (A3A_hasACE) then {
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard"];
};

_loadoutData set ["items_squadLeader_extras", []];
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

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = ["sfLoadoutData"] call _fnc_createLoadoutData;
_sfLoadoutData merge _loadoutData;
_sfLoadoutData set ["uniforms", ["UNS_SAS_BDU_E"]];
_sfLoadoutData set ["vests", ["uns_sas_web_3", "uns_sas_web_1", "uns_sas_web_2"]];
_sfLoadoutData set ["glVests", ["uns_sas_web_1_gl", "uns_sas_web_2_gl", "uns_sas_web_3_ugl"]];
_sfLoadoutData set ["backpacks", ["uns_sas_alicepack_1", "uns_sas_alicepack_2", "uns_sas_alicepack_3"]];
_sfLoadoutData set ["slBackpacks", ["uns_sas_alicepack_RTO"]];
_sfLoadoutData set ["helmets", ["uns_sas_bandana_erdl", "uns_sas_headband_erdl", "uns_sas_headband_green"]];
_sfLoadoutData set ["sniHats", ["uns_sas_booniehat_erdl", "uns_sas_booniehat_erdl2"]];
_sfLoadoutData set ["slHat", ["UNS_BERET_22nd"]];
_sfLoadoutData set ["binoculars", ["uns_binocular_army"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["rifles", [
    ["uns_l1a1", "", "", "", ["uns_l1a1mag"], [], ""],
    ["uns_l2a1_shorty", "", "", "", ["uns_l1a1mag"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["uns_m3carbine", "", "", "", ["uns_m2carbinemag"], [], ""],
    ["uns_xm177e2_stock", "", "", "uns_o_colt4x", ["uns_30Rnd_556x45_Stanag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["uns_l1a1gl", "", "", "", ["uns_l1a1mag"], ["Uns_1Rnd_HE_M381", "uns_1Rnd_Smoke_40mm"], ""],
    ["uns_m16_xm148_camo", "", "", "", ["uns_30Rnd_556x45_Stanag"], ["uns_m406vest", "uns_1Rnd_Smoke_40mm"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["uns_SterlingSD", "", "", "", ["uns_mk4mag"], [], ""],
    ["uns_Sterling", "", "", "", ["uns_mk4mag"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [["uns_m60", "", "", "", ["uns_m60mag"], [], ""],
    ["uns_ukvz59", "", "", "", ["uns_100Rnd_762x54_ukvz59"], [], ""]]];
_sfLoadoutData set ["marksmanRifles", [
    ["uns_m16_camo", "", "", "uns_o_LeatherwoodART_m16", ["uns_20Rnd_556x45_Stanag"], [], ""],
    ["uns_m14", "", "", "uns_o_LeatherwoodART_m14", ["uns_m14mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [["uns_smle_sniper", "", "", "", ["uns_smlemag"], [], ""]]];
_sfLoadoutData set ["sidearms", [
    ["uns_MX991_m1911SD_base", "uns_s_M1911", "uns_BA30", "", ["uns_m1911mag"], [], ""],
    ["uns_bhp", "", "", "", ["uns_13Rnd_hp"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = ["militaryLoadoutData"] call _fnc_createLoadoutData;
_militaryLoadoutData merge _loadoutData;
_militaryLoadoutData set ["uniforms", ["UNS_USMC_BDU_65"]];
_militaryLoadoutData set ["vests", ["uns_simc_flak_55_M61_79_belt", "uns_simc_flak_55_bandoleer", "uns_Simc_flak_55_M61_med", "uns_simc_flak_55_M61", "uns_simc_flak_55_mk2_belt_open", "uns_simc_flak_55_mk2_bandoleer_belt"]];
_militaryLoadoutData set ["backpacks", ["UNS_Alice_F1", "UNS_Alice_FR",  "UNS_USMC_MED", "UNS_USMC_R1", "uns_simc_MC_packboard_flak_3"]];
_militaryLoadoutData set ["helmets", ["UNS_M1_2", "uns_simc_m1_bitch_op"]];
_militaryLoadoutData set ["binoculars", ["uns_binocular_army"]];

_militaryLoadoutData set ["rifles", [["uns_M16A1", "", "", "", ["uns_30Rnd_556x45_Stanag"], [], ""]]];
_militaryLoadoutData set ["carbines", [["uns_m2carbine", "", "", "", ["uns_m1carbinemag"], [], ""],
    ["uns_xm177e2_stock", "", "", "", ["uns_30Rnd_556x45_Stanag"], [], ""]]];
_militaryLoadoutData set ["grenadeLaunchers", [["uns_m16a1_m203", "", "", "", ["uns_20Rnd_556x45_Stanag"], ["Uns_1Rnd_HE_M381", "uns_1Rnd_Smoke_40mm"], ""]]];
_militaryLoadoutData set ["SMGs", [["uns_thompson", "", "", "", ["uns_thompsonmag_30"], [], ""],
    ["uns_m3a1", "", "", "", ["uns_m3a1mag"], [], ""]]];
_militaryLoadoutData set ["machineGuns", [["uns_m60", "", "", "", ["uns_m60mag"], [], ""],
    ["uns_M63a_LMG", "", "", "", ["uns_m63abox"], [], ""]]];
_militaryLoadoutData set ["marksmanRifles", [["uns_m16_camo", "", "", "uns_o_LeatherwoodART_m16", ["uns_20Rnd_556x45_Stanag"], [], ""],
    ["uns_m14", "", "", "uns_o_LeatherwoodART_m14", ["uns_m14mag"], [], ""]]];
_militaryLoadoutData set ["sniperRifles", [["uns_model70_iron", "", "", "uns_o_RedfieldART_m70", ["uns_model70mag_T"], [], ""],
    ["uns_M40_base", "", "", "uns_o_RedfieldART", ["uns_m40mag_T"], [], ""]]];
_militaryLoadoutData set ["sidearms", [["uns_m1911", "", "", "", ["uns_m1911mag"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = ["policeLoadoutData"] call _fnc_createLoadoutData;
_policeLoadoutData merge _loadoutData;

_policeLoadoutData set ["uniforms", ["UNS_ARMY_BDU_716thMPBnpv1"]];
_policeLoadoutData set ["vests", ["uns_simc_56_ligt"]];
_policeLoadoutData set ["helmets", ["UNS_M1_MP"]];

_policeLoadoutData set ["SMGs", [["uns_m870_mk1", "", "", "", ["uns_m870mag"], [], ""],
    ["uns_m3a1", "", "", "", ["uns_m3a1mag"], [], ""]]];
_policeLoadoutData set ["sidearms", [
    ["uns_m1911", "", "", "", ["uns_m1911mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = ["militiaLoadoutData"] call _fnc_createLoadoutData;
_militiaLoadoutData merge _loadoutData;
_militiaLoadoutData set ["uniforms", ["UNS_ARMY_BDU_65"]];
_militiaLoadoutData set ["vests", ["uns_simc_56", "uns_simc_56_bandoleer", "uns_simc_56_frag", "uns_simc_56_M43", "uns_v_simc_67_ass", "uns_v_simc_67_frag_ass", "uns_v_simc_67_45", "uns_Simc_56_med"]];
_militiaLoadoutData set ["backpacks", ["uns_simc_pack_trop_1_alt", "uns_simc_pack_trop_4_alt", "uns_simc_pack_med_m5_flak", "uns_simc_packboard_MG_2", "uns_simc_packboard_mortar_1"]];
_militiaLoadoutData set ["helmets", ["UNS_M1_1", "uns_simc_m1_bitch_op"]];

_militiaLoadoutData set ["rifles", [["uns_m16", "", "", "", ["uns_20Rnd_556x45_Stanag"], [], ""],
    ["uns_m14", "", "", "", ["uns_m14mag"], [], ""]]];
_militiaLoadoutData set ["carbines", [["uns_m1carbine_pouch", "", "", "", ["uns_m1carbinemag"], [], ""],
    ["uns_m1carbine", "", "", "", ["uns_m1carbinemag"], [], ""]]];
_militiaLoadoutData set ["grenadeLaunchers", [["uns_m79", "", "", "", ["Uns_1Rnd_HE_M381"], ["uns_1Rnd_Smoke_40mm"], ""],
    ["uns_m1garand_gl", "", "", "", ["uns_m1garandmag"], ["Uns_1Rnd_22mm_M1a2_FRAG", "Uns_1Rnd_22mm_HEAT"], ""]]];
_militiaLoadoutData set ["SMGs", [["uns_thompson", "", "", "", ["uns_thompsonmag_30"], [], ""],
    ["uns_m3a1", "", "", "", ["uns_m3a1mag"], [], ""]]];
_militiaLoadoutData set ["machineGuns", [["uns_bar", "", "", "", ["uns_barmag"], [], ""], 
    ["uns_m1919a6", "", "", "", ["uns_100Rnd_m1919"], [], ""]]];
_militiaLoadoutData set ["marksmanRifles", [["uns_m1garand", "", "", "uns_o_M84", ["uns_m1garandmag"], [], ""],
    ["uns_m1garand", "", "", "", ["uns_m1garandmag"], [], ""]]];
_militiaLoadoutData set ["sniperRifles", [["uns_m1903", "", "", "", ["uns_springfieldmag_T"], [], ""],
    ["uns_m1903", "", "", "uns_o_Unertl8x", ["uns_springfieldmag_T"], [], ""]]];
_militiaLoadoutData set ["sidearms", [["uns_m1911", "", "", "", ["uns_m1911mag"], [], ""]]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = ["crewLoadoutData"] call _fnc_createLoadoutData; // touch and shit breaks
_crewLoadoutData merge _militaryLoadoutData;
_crewLoadoutData set ["uniforms", ["UNS_ARMY_BDU_S", "UNS_ARMY_BDU_F"]];
_crewLoadoutData set ["vests", ["uns_simc_56_45_ligt_zusp"]];
_crewLoadoutData set ["helmets", ["UNS_TC_1", "UNS_TC_2"]];

private _pilotLoadoutData = ["pilotLoadoutData"] call _fnc_createLoadoutData;
_pilotLoadoutData merge _militaryLoadoutData;
_pilotLoadoutData set ["uniforms", ["UNS_JPilot_BDU", "UNS_Pilot_BDU"]];
_pilotLoadoutData set ["vests", ["UNS_JP_Vest"]];
_pilotLoadoutData set ["helmets", ["UNS_JP_Helmet_352TFS", "UNS_JP_Helmet_366TFW", "UNS_JP_Helmet_389TFS", "UNS_HP_Helmet_R33", "UNS_HP_Helmet_R8", "UNS_HP_Helmet_USA"]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;


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

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 1] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [["ATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;

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
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

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

private _marksmanTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    call _unarmedTemplate;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
    ["SquadLeader", _policeTemplate],
    ["Standard", _policeTemplate]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _SquadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
