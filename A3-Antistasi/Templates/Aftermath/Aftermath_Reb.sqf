////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
nameTeamPlayer = "Great Khans";//The name for the player side. Used on the top UI bar in game, and on player held locations.
SDKFlag = "Flag_Syndikat_F";
SDKFlagTexture = "Templates\Aftermath\khans_flag_antistasi.paa";

typePetros = "khan_great_01_body";//classname for the unit that should be used for petros

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//First Entry is Guerilla, Second Entry is Para/Military || These are only to define the uniforms they should wear at low and high training respectively.
staticCrewTeamPlayer = "khan_great_01_body";//classname
SDKUnarmed = "khan_great_01_body";//Used for PoW rescues
SDKSniper = ["khan_great_01_body","khan_great_01_body"];//classnames for the sniper
SDKATman = ["khan_great_01_body","khan_great_01_body"];//classnames for the Anti Tank soldier
SDKMedic = ["khan_great_01_body","khan_great_01_body"];//classnames for the Medic
SDKMG = ["khan_great_01_body","khan_great_01_body"];//classnames for the Machine Gunner
SDKExp = ["khan_great_01_body","khan_great_01_body"];//classnames for the Explosives Experts
SDKGL = ["khan_great_01_body","khan_great_01_body"];//classnames for the Grenadier
SDKMil = ["khan_great_01_body","khan_great_01_body"];//classnames for the Rifleman
SDKSL = ["khan_great_01_body","khan_great_01_body"];//classnames for the Squad Leader
SDKEng = ["khan_great_01_body","khan_great_01_body"];//classnames for the Engineer

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//This section doesn't need to be changed.
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
//           VEHICLES            ///  If there isn't an option in your mod for the asset, then you can put not_supported in place of a classname.
////////////////////////////////////
//Military Vehicles
vehSDKBike = "C_Quadbike_01_F";//classname for quadbike or equivalent.
vehSDKLightArmed = "uns_willysmg50";//classname for buyable technical or equivalent (should be up to .50 cal)
vehSDKAT = "uns_willysmg50";//classname for anti tank technical if available. *only buyable for AI AT Squads*
vehSDKLightUnarmed = "uns_willys";//classname for unarmed car/pickup truck.
vehSDKTruck = "uns_M35A2";//classname for troop transport truck
vehSDKPlane = "uns_A7_CAP";//classname for plane to be used for rebel airstrikes. *not buyable*
vehSDKBoat = "uns_pbr";//classname for transport boat
vehSDKRepair = "uns_M35A2_repair";//classname for repair vehicle *not buyable*
vehSDKAA = "uns_m163";//classname for the rebel AA truck.

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
initialRebelEquipment append ["AM_CaravanShotgun", "AM_HuntingRifle", "AM_CowboyRepeater", "AM_browning9mm", "AM_357Rev", "launch_RPG7_F"];//Classnames of the initial weapons to be included in the arsenal. Should be 1 bolt action rifle and 1 shotgun for primary. 2 pistols for secondary. 1 light, non-locking, AT weapon.
initialRebelEquipment append ["AM_HuntingRifle","AM_CowboyRepeater"];//Classnames of the primary weapons that the AI should use. Avoid giving them shotguns etc.
initialRebelEquipment append ["2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug", "6Rnd_357_Cyl","6Rnd_357_HP_Cyl","6Rnd_357_JFP_Cyl","6Rnd_38_Cyl","8Rnd_357","8Rnd_357_HP","8Rnd_357_JFP","8Rnd_38","10Rnd_308_AP_Mag","10Rnd_308_Mag","10Rnd_308_HP_Mag","10Rnd_308_JSP_Mag","10Rnd_9x21_Mag","10Rnd_9x21_HP_Mag","10Rnd_9x21_JHP_Mag","10Rnd_9x21_OP_Mag","RPG7_F"];//Classnames for magazines for the initial weapons, can be as many or few variants as you wish. Also add grenades and smoke grenades here.
initialRebelEquipment append ["republican_bag_01","republican_bag_02","BackpackNUKA","BackpackNUKA_02","Backpack_02","Backpack_01"];//Classnames of the inital backpacks to be in the arsenal.
initialRebelEquipment append ["V_Chestrig_blk","V_Chestrig_rgr","V_Chestrig_khk","V_Chestrig_oli","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli","V_Rangemaster_belt"];//Classnames of the inital vests to be in the arsenal, Avoid any with armour.
initialRebelEquipment append ["optic_am_crlr","optic_am_cr","optic_am_hrs"];//Classnames of any additional items that should be unlocked from the start, such as binoculars and attachments.
initialRebelEquipment append ["boomerhat01", "boomerhat02", "boomerhat03", "hatwastelandmerchant", "bandanared", "jessupbandana", "cowboy_hat_02", "cowboy_hat_01", "PlagueMask_Head", "cowboy_hat_05", "1950_style_hat", "1950_style_hat02", "cowboy_hat_04", "cowboy_hat_03", "lucassimms_hat", "hat_wasteland_clothing_02", "khan_helmet_01", "khan_helmet_02", "Batting_Helmet_blue", "Batting_Helmet_GREEN", "Batting_Helmet_RED", "constructionhat", "partyhat_02", "partyhat", "mask", "1950stylesuit_outfit_benny_uniform", "republican_01_uniform", "republican_02_uniform", "republican_03_uniform", "republican_04_uniform", "1950stylesuit_outfit03_uniform", "petrochico_01_07_uniform", "petrochico_01_06_uniform", "petrochico_01_05_uniform", "petrochico_01_04_uniform", "petrochico_01_03_uniform", "petrochico_01_02_uniform", "wasteland_doctor_01_uniform", "wasteland_doctor_02_uniform", "wastelandsettler02_uniform", "wastelandsettler03_uniform", "khan_great_01_uniform", "wastelandclothing03_uniform", "wastelandclothing01_uniform", "wasteland_clothing_05_uniform", "tunnelsnake_uniform", "GasMask", "goggles_wastelandclothing03"];

//TFAR Unlocks
if (hasTFAR) then {initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};//Classname(s) of the TFAR short range radio equipment to be in the arsenal.
if (hasTFAR && startWithLongRangeRadio) then {initialRebelEquipment pushBack "tf_anprc155"};//Classname of the TFAR long range radio equipment to be in the arsenal if start with LR is enabled.
