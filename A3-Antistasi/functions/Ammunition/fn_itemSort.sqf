//Begin Loot Lists
//Not sure why we get these, but here it is....
diveGear = ["V_RebreatherIA","G_Diving"];
if (side (group petros) == west) then {diveGear pushBack "U_B_Wetsuit"} else {diveGear pushBack "U_I_Wetsuit"};

/////////////////
//   Optics   ///
/////////////////
lootOptic = allAttachmentOptic;

///////////////////
//   Pointers   ///
///////////////////
{
if (isClass(configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "FlashLight" >> "size")) then
     {
     attachmentLaser pushBack _x;
     }
     else
     {
     attachmentLight pushBack _x;
     };
} forEach allAttachmentPointer;

/////////////////////////
//   Smoke and Chem   ///
/////////////////////////
smokeGrenades = ["SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellBlue","SmokeShellYellow","SmokeShellPurple","SmokeShellOrange"];
{
if (getText(configfile >> "CfgMagazines" >> _x >> "nameSound") isEqualTo "Chemlight") then
     {
     chemX pushback _x;
     };
if (getText(configfile >> "CfgMagazines" >> _x >> "nameSound") isEqualTo "smokeshell") then
     {
     smokeGrenades pushback _x;
     };
if (getText(configfile >> "CfgMagazines" >> _x >> "nameSound") isEqualTo "") then
     {
     uglSmokeGrenade pushback _x;
     };
} forEach allMagSmokeShell;
