////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
nameTeamPlayer = "";//The name for the player side. Used on the top UI bar in game, and on player held locations.
SDKFlag = "";//classname for the flagpole that should be used for the rebel locations
SDKFlagTexture = "";//Path to the flag texture for the rebel side.
typePetros = "";//classname for the unit that should be used for petros

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//First Entry is Guerilla, Second Entry is Para/Military || These are only to define the uniforms they should wear at low and high training respectively.
staticCrewTeamPlayer = "";//classname
SDKUnarmed = "";//Used for PoW rescues
SDKSniper = ["",""];//classnames for the sniper
SDKATman = ["",""];//classnames for the Anti Tank soldier
SDKMedic = ["",""];//classnames for the Medic
SDKMG = ["",""];//classnames for the Machine Gunner
SDKExp = ["",""];//classnames for the Explosives Experts
SDKGL = ["",""];//classnames for the Grenadier
SDKMil = ["",""];//classnames for the Rifleman
SDKSL = ["",""];//classnames for the Squad Leader
SDKEng = ["",""];//classnames for the Engineer

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
vehSDKBike = "";//classname for quadbike or equivalent.
vehSDKLightArmed = "";//classname for buyable technical or equivalent (should be up to .50 cal)
vehSDKAT = "";//classname for anti tank technical if available. *only buyable for AI AT Squads*
vehSDKLightUnarmed = "";//classname for unarmed car/pickup truck.
vehSDKTruck = "";//classname for troop transport truck
vehSDKPlane = "";//classname for plane to be used for rebel airstrikes. *not buyable*
vehSDKBoat = "";//classname for transport boat
vehSDKRepair = "";//classname for repair vehicle *not buyable*
vehSDKAA = "";//classname for the rebel AA truck.

//Civilian Vehicles
civCar = "";//classname for *civilian* car/pickup truck
civTruck = "";//classname for *civilian* troop transport truck
civHeli = "";//classname for *civilian* helicopter
civBoat = "";//classname for *civilian* transport boat

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Static Weapons
SDKMGStatic = "";//classname for *buyable* static machine gun
staticATteamPlayer = "";//classname for *buyable* Anti Tank static
staticAAteamPlayer = "";//classname for *buyable* Anti Air static
SDKMortar = "";//classname for *buyable* Mortar
SDKMortarHEMag = "";//classname for mortar's HE shell
SDKMortarSmokeMag = "";//classname for Mortar's smoke shell

//Static Weapon Bags
MGStaticSDKB = "";//classname for Machine gun static gun bag
ATStaticSDKB = "";//classname for Anti tank static gun bag
AAStaticSDKB = "";//classname for Anti air static gun bag
MortStaticSDKB = "";//classname for mortar tube bag
//Short Support
supportStaticSDKB = "";//classname for Machine gun static short tripod bag
//Tall Support
supportStaticsSDKB2 = "";//classname for Machine gun static tall tripod bag
//Mortar Support
supportStaticsSDKB3 = "";//classname for Mortar tripod bag

////////////////////////////////////
//             ITEMS             ///
////////////////////////////////////
//Mines
ATMineMag = "";//magazine classname for the Anti Tank mine used for rebel minefields
APERSMineMag = "";//magazine classname for the Anti personell mine used for rebel minefields

//Breaching explosives
//Breaching APCs needs one demo charge
breachingExplosivesAPC = [["", 1]];//classname for the small explosive charge to be used for breaching APCs
//Breaching tanks needs one satchel charge or two demo charges
breachingExplosivesTank = [["", 1], ["", 2]];//Classname for the large explosive charge for breaching tanks. Second entry is for the small charge, which takes 2 to breach a Tank.

//Starting Unlocks
initialRebelEquipment append ["","","",""];//Classnames of the initial weapons to be included in the arsenal. Should be 1 bolt action rifle and 1 shotgun for primary. 2 pistols for secondary. 1 light, non-locking, AT weapon.
initialRebelEquipment append ["",""];//Classnames of the primary weapons that the AI should use. Avoid giving them shotguns etc.
initialRebelEquipment append ["","","","","",""];//Classnames for magazines for the initial weapons, can be as many or few variants as you wish. Also add grenades and smoke grenades here.
initialRebelEquipment append ["","","","","",""];//Classnames of the inital backpacks to be in the arsenal.
initialRebelEquipment append ["","","","","",""];//Classnames of the inital vests to be in the arsenal, Avoid any with armour.
initialRebelEquipment append ["","","",""];//Classnames of any additional items that should be unlocked from the start, such as binoculars and attachments.
//TFAR Unlocks
if (hasTFAR) then {initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};//Classname(s) of the TFAR short range radio equipment to be in the arsenal.
if (hasTFAR && startWithLongRangeRadio) then {initialRebelEquipment pushBack "tf_anprc155"};//Classname of the TFAR long range radio equipment to be in the arsenal if start with LR is enabled.
