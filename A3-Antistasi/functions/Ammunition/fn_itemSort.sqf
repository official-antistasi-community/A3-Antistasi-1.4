diveGear = ["V_RebreatherIA","G_Diving"];
if (side (group petros) == west) then {diveGear pushBack "U_B_Wetsuit"} else {diveGear pushBack "U_I_Wetsuit"};

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
lootPointer append allAttachmentPointer;

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

/////////////////////
// Assigned Items ///
/////////////////////
lootItems append allMineDetector + allGPS + allRadio;

/////////////////
// Binoculars ///
/////////////////
lootBinocular append allLaserDesignator + allBinocular;

/////////////////
//    NVG'S   ///
/////////////////
lootNVG append allNVG;

/////////////////////////////
//   Smoke, Chem, Flare   ///
/////////////////////////////
lootSignalMag append allMagSmokeShell + allMagFlare;

{
if (getText(configfile >> "CfgMagazines" >> _x >> "nameSound") isEqualTo "Chemlight") then
     {
     chemLight pushback _x;
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

private _uglMag = getArray (configfile >> "CfgMagazineWells" >> "UGL_40x36");
_uglMag append (getArray(configfile >> "CfgMagazineWells" >> "3UGL_40x36"));
{
if (_x in _uglMag) then
     {
     uglFlareMag pushBack _x;
     }
     else
     {
     handFlare pushBack _x;
     };
} forEach allMagFlare;

///////////////////
//  Explosives  ///
///////////////////
lootExplosives append allMineBounding + allMineDirectional + allMineBounding;

lootExplosives deleteAt (lootExplosives find "DemoCharge_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "APERSMineDispenser_Mag");
lootExplosives deleteAt (lootExplosives find "TrainingMine_Mag");
lootExplosives deleteAt (lootExplosives find "IEDLandSmall_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "IEDUrbanSmall_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "IEDLandBig_Remote_Mag");
lootExplosives deleteAt (lootExplosives find "IEDUrbanBig_Remote_Mag");
