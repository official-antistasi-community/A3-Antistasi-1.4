diveGear = ["V_RebreatherIA","G_Diving"];
if (side (group petros) == west) then {diveGear pushBack "U_B_Wetsuit"} else {diveGear pushBack "U_I_Wetsuit"};

/////////////////
//    NVG'S   ///
/////////////////
lootNVG = allNVG;

/////////////////
//   Optics   ///
/////////////////
lootOptic append allAttachmentOptic;

/////////////////
//   Bipods   ///
/////////////////
lootBipod append allAttachmentBipod;

/////////////////
//  Silencers ///
/////////////////
lootSilencer append allAttachmentMuzzle;

///////////////////
//   Pointers   ///
///////////////////
{
if (isClass(configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "FlashLight" >> "size")) then
     {
     attachmentLight pushBack _x;
     }
     else
     {
     attachmentLaser pushBack _x;
     };
} forEach allAttachmentPointer;

/////////////////////////
//   Smoke and Chem   ///
/////////////////////////
{
if (getText(configfile >> "CfgMagazines" >> _x >> "nameSound") isEqualTo "Chemlight") then
     {
     lootChemstick pushback _x;
     };
if (getText(configfile >> "CfgMagazines" >> _x >> "nameSound") isEqualTo "smokeshell") then
     {
     smokeGrenade pushback _x;
     };
if (getText(configfile >> "CfgMagazines" >> _x >> "nameSound") isEqualTo "") then
     {
     uglSmokeGrenade pushback _x;
     };
} forEach allMagSmokeShell;

///////////////////
//  Explosives  ///
///////////////////
lootExplosives append allMineBounding;
lootExplosives append allMineDirectional;
lootExplosives append allMine;
lootExplosives deleteAt (lootExplosives find "DemoCharge_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "APERSMineDispenser_Mag");
lootExplosives deleteAt (lootExplosives find "TrainingMine_Mag");
lootExplosives deleteAt (lootExplosives find "IEDLandSmall_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "IEDUrbanSmall_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "IEDLandBig_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "IEDUrbanBig_Remote_Mag");
