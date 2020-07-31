////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
nameTeamPlayer = if (worldName == "Tanoa") then {"SDK"} else {"FIA"};
SDKFlag = "Flag_FIA_F";
SDKFlagTexture = "\A3\Data_F\Flags\Flag_Altis_CO.paa";
typePetros = "I_G_officer_F";

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//First Entry is Guerilla, Second Entry is Para/Military
staticCrewTeamPlayer = "I_G_Soldier_unarmed_F";
SDKUnarmed = "I_G_Survivor_F";
SDKSniper = ["I_G_Sharpshooter_F","I_ghillie_ard_F"];
SDKATman = ["I_G_Soldier_LAT2_F","I_Soldier_LAT2_F"];
SDKMedic = ["I_G_medic_F","I_medic_F"];
SDKMG = ["I_G_Soldier_AR_F","I_Soldier_AR_F"];
SDKExp = ["I_G_Soldier_exp_F","I_Soldier_exp_F"];
SDKGL = ["I_G_Soldier_GL_F","I_Soldier_GL_F"];
SDKMil = ["I_G_Soldier_lite_F","I_Soldier_lite_F"];
SDKSL = ["I_G_Soldier_SL_F","I_Soldier_SL_F"];
SDKEng = ["I_G_engineer_F","I_engineer_F"];

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
groupsSDKmid = [SDKSL,SDKGL,SDKMG,SDKMil];
groupsSDKAT = [SDKSL,SDKMG,SDKATman,SDKATman,SDKATman];
groupsSDKSquad = [SDKSL,SDKGL,SDKMil,SDKMG,SDKMil,SDKATman,SDKMil,SDKMedic];
groupsSDKSquadEng = [SDKSL,SDKGL,SDKMil,SDKMG,SDKExp,SDKATman,SDKEng,SDKMedic];
groupsSDKSquadSupp = [SDKSL,SDKGL,SDKMil,SDKMG,SDKATman,SDKMedic,[staticCrewTeamPlayer,staticCrewTeamPlayer],[staticCrewTeamPlayer,staticCrewTeamPlayer]];
groupsSDKSniper = [SDKSniper,SDKSniper];
groupsSDKSentry = [SDKGL,SDKMil];

//Rebel Unit Tiers (for costs)
sdkTier1 = SDKMil + [staticCrewTeamPlayer] + SDKMG + SDKGL + SDKATman;
sdkTier2 = SDKMedic + SDKExp + SDKEng;
sdkTier3 = SDKSL + SDKSniper;
soldiersSDK = sdkTier1 + sdkTier2 + sdkTier3;

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
vehSDKBike = "I_G_Quadbike_01_F";
vehSDKLightArmed = "I_G_Offroad_01_armed_F";
vehSDKAT = "I_G_Offroad_01_AT_F";
vehSDKLightUnarmed = "I_G_Offroad_01_F";
vehSDKTruck = "I_G_Van_01_transport_F";
//vehSDKHeli = "I_C_Heli_Light_01_civil_F";
vehSDKPlane = "I_C_Plane_Civil_01_F";
vehSDKBoat = "I_G_Boat_Transport_01_F";
vehSDKRepair = "I_G_Offroad_01_repair_F";

//Civilian Vehicles
civCar = "C_Offroad_01_F";
civTruck = "C_Van_01_transport_F";
civHeli = "C_Heli_Light_01_civil_F";
civBoat = "C_Boat_Transport_02_F";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Static Weapons
SDKMGStatic = "I_G_HMG_02_high_F";
staticATteamPlayer = "I_static_AT_F";
staticAAteamPlayer = "I_static_AA_F";
SDKMortar = "I_G_Mortar_01_F";
SDKMortarHEMag = "8Rnd_82mm_Mo_shells";
SDKMortarSmokeMag = "8Rnd_82mm_Mo_Smoke_white";

//Static Weapon Bags
MGStaticSDKB = "I_G_HMG_02_high_weapon_F";
ATStaticSDKB = "I_AT_01_weapon_F";
AAStaticSDKB = "I_AA_01_weapon_F";
MortStaticSDKB = "I_Mortar_01_weapon_F";
//Short Support
supportStaticSDKB = "I_G_HMG_02_support_F";
//Tall Support
supportStaticsSDKB2 = "I_G_HMG_02_support_high_F";
//Mortar Support
supportStaticsSDKB3 = "I_Mortar_01_support_F";

////////////////////////////////////
//             ITEMS             ///
////////////////////////////////////
//Mines
ATMineMag = "ATMine_Range_Mag";
APERSMineMag = "APERSMine_Range_Mag";

//Breaching explosives
//Breaching APCs needs one demo charge
breachingExplosivesAPC = [["DemoCharge_Remote_Mag", 1]];
//Breaching tanks needs one satchel charge or two demo charges
breachingExplosivesTank = [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]];

//Starting Unlocks
initialRebelEquipment append ["hgun_Pistol_heavy_02_F","hgun_P07_F","SMG_01_F","SMG_02_F"];
initialRebelEquipment append ["SMG_01_F","SMG_02_F"];
initialRebelEquipment append ["6Rnd_45ACP_Cylinder","16Rnd_9x21_Mag","30Rnd_45ACP_Mag_SMG_01","30Rnd_9x21_Mag_SMG_02","MiniGrenade","SmokeShell"];
initialRebelEquipment append ["B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_khk"];
initialRebelEquipment append ["V_Chestrig_blk","V_Chestrig_rgr","V_Chestrig_khk","V_Chestrig_oli","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli","V_Rangemaster_belt"];
initialRebelEquipment append ["Binocular","acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol"];
//Greenfor uniforms
allRebelUniforms append ["U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_leader","U_IG_Guerrilla_6_1"];
//TFAR Unlocks
if (hasTFAR) then {initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (hasTFAR && startWithLongRangeRadio) then {initialRebelEquipment pushBack "tf_anprc155"};
