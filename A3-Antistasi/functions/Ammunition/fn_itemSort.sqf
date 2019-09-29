//Begin Loot Lists
//Not sure why we get these, but here it is....
diveGear = ["V_RebreatherIA","G_Diving"];
if (side (group petros) == west) then {diveGear pushBack "U_B_Wetsuit"} else {diveGear pushBack "U_I_Wetsuit"};

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

////////////////////////////////////
//   SMOKE GRENADES LIST         ///
////////////////////////////////////
smokeGrenades = ["SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellBlue","SmokeShellYellow","SmokeShellPurple","SmokeShellOrange"];

////////////////////////////////////
//   CHEMLIGHTS LIST             ///
////////////////////////////////////
//Chemlight loot for crates
//this is an ugly list of vanilla chems I made myself - PBP
diag_log format ["%1: [Antistasi] | INFO | initVar | Creating Chemstick Lists",servertime];
chemX = ["Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue"];
