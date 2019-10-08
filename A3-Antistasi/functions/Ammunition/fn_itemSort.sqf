diveGear = ["V_RebreatherIA","G_Diving"];
if (side (group petros) == west) then {diveGear pushBack "U_B_Wetsuit"} else {diveGear pushBack "U_I_Wetsuit"};

//Lights Vs Laser ID
{
if (isClass(configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "FlashLight" >> "Attenuation")) then
     {
     attachmentLight pushBack _x;
     }
     else
     {
     attachmentLaser pushBack _x;
     };
} forEach allAttachmentPointer;

//Signal Mags ID
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

//Flares ID
//PBP - NOT WORKING
private _uglMag = getArray (configfile >> "CfgMagazineWells" >> "UGL_40x36" >> "BI_Magazines");
_uglMag append (getArray(configfile >> "CfgMagazineWells" >> "3UGL_40x36" >> "BI_Magazines"));
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

//IR Grenades
{
if (getText (configfile >> "CfgMagazines" >> _x >> "displayNameShort") isEqualTo "IR Grenade") then
     {
     irGrenade pushBack _x;
     };
} forEach allUnknown;
//Clean allUnknown of IR Grenades
{
allUnknown deleteAt (allUnknown find _x);
} forEach irGrenade;

//LaserDesignator Batteries
{
if (getText (configfile >> "CfgMagazines" >> _x >> "displayName") isEqualTo "Designator Batteries") then
     {
     laserBatteries pushBack _x;
     };
} forEach allUnknown;
//Clean allUnknown of batteries
{
allUnknown deleteAt (allUnknown find _x);
} forEach laserBatteries;
