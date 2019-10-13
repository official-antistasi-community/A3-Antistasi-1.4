class Params
{
    class loadSave
    {
        title = "Load last Persistent Save"; // Param name visible in the list
        values[] = {1,0}; // Values; must be integers; has to have the same number of elements as 'texts'
        texts[] = {"Yes","No"}; // Description of each selectable item
        default = 1; // Default value; must be listed in 'values' array, otherwise 0 is used
        // Default values that are not whole numbers do not work. Param will default to 0 (or 1 if defined)
    };
    class gameMode
    {
        title = "Game Mode"; // Param name visible in the list
        values[] = {1,2,3,4}; // Values; must be integers; has to have the same number of elements as 'texts'
        texts[] = {"Reb vs Gov vs Inv","Reb vs Gov & Inv","Reb vs Gov","Reb vs Inv"}; // Description of each selectable item
        default = 1; // Default value; must be listed in 'values' array, otherwise 0 is used
        // Default values that are not whole numbers do not work. Param will default to 0 (or 1 if defined)
    };
    class autoSave
    {
        title = "Enable Autosave (every hour)"; // Param name visible in the list
        values[] = {1,0}; // Values; must be integers; has to have the same number of elements as 'texts'
        texts[] = {"Yes","No"}; // Description of each selectable item
        default = 1; // Default value; must be listed in 'values' array, otherwise 0 is used
        // Default values that are not whole numbers do not work. Param will default to 0 (or 1 if defined)
    };
    class membership
    {
        title = "Enable Server Membership";
        texts[] = {"Yes","No"};
        values[] = {1,0};
        default = 1;
        //function = "BIS_fnc_paramDaytime"; // (Optional) [[Functions_Library_(Arma_3)|Function]] [[call]]ed when player joins, selected value is passed as an argument
        //isGlobal = 1; // (Optional) 1 to execute script / function locally for every player who joins, 0 to do it only on server
    };
    class switchComm
    {
        title = "Enable Commander Switch (highest ranked player)";
        values[] = {1,0};
        texts[] = {"Yes","No"};
        default = 1;
        //file = "setViewDistance.sqf"; // (Optional) Script [[call]]ed when player joins, selected value is passed as an argument
    };
    class tkPunish
    {
        title = "Enable Teamkill Punish";
        values[] = {1,0};
        texts[] = {"Yes","No"};
        default = 1;
        //file = "setViewDistance.sqf"; // (Optional) Script [[call]]ed when player joins, selected value is passed as an argument
    };
    class mRadius
    {
        title = "Distance from HQ for Sidemissions";
        values[] = {2000,4000,6000,8000,10000,12000};
        // When 'texts' are missing, values will be displayed directly instead
        default = 4000;
        //file = "setViewDistance.sqf"; // (Optional) Script [[call]]ed when player joins, selected value is passed as an argument
    };
    class allowPvP
    {
        title = "Allow PvP Slots";
        values[] = {1,0};
        texts[] = {"Yes","No"};
        default = 1;
        //file = "setViewDistance.sqf"; // (Optional) Script [[call]]ed when player joins, selected value is passed as an argument
    };
    class pMarkers
    {
        title = "Allow Friendly Player Markers";
        values[] = {1,0};
        texts[] = {"Yes","No"};
        default = 1;
        //file = "setViewDistance.sqf"; // (Optional) Script [[call]]ed when player joins, selected value is passed as an argument
    };
    class AISkill
    {
        title = "Mission Difficulty";
        values[] = {1,2,3};
        texts[] = {"Easy","Normal","Hard"};
        default = 2;
        //file = "setViewDistance.sqf"; // (Optional) Script [[call]]ed when player joins, selected value is passed as an argument
    };
    class unlockItem
    {
        title = "Number of the same weapons required to unlock";
        values[] = {15,25,40};
        default = 25;
        //file = "setViewDistance.sqf"; // (Optional) Script [[call]]ed when player joins, selected value is passed as an argument
    };
	class memberOnlyMagLimit
    {
        title = "Number of magazines needed for guests to be able to use them";
        values[] = {10,20,30,40,50,60};
        default = 40;
    };
    class civTraffic
    {
        title = "Rate of Civ Traffic";
        values[] = {0,1,2,3};
        texts[] = {"None","Low","Medium","JAM"};
        default = 1;
        //file = "setViewDistance.sqf"; // (Optional) Script [[call]]ed when player joins, selected value is passed as an argument
    };
    class memberSlots
    {
        title = "Percentage of Reserved Slots for Members";
        values[] = {0,20,40,60,80,100};
        texts[] = {"None","20%","40%","60%","80%","All"};
        default = 20;
        //file = "setViewDistance.sqf"; // (Optional) Script [[call]]ed when player joins, selected value is passed as an argument
    };
    class memberDistance
    {
        title = "Max distance non members can be from the closest member or HQ (they will be teleported to HQ after some timeout)";
        values[] = {4000,5000,6000,7000,8000,16000};
        texts[] = {"4 Kmts","5 Kmts","6 Kmts","7 Kmts","8 Kmts","Unlimited"};
        default = 5000;
        //file = "setViewDistance.sqf"; // (Optional) Script [[call]]ed when player joins, selected value is passed as an argument
    };
    class allowFT
    {
        title = "Limited Fast Travel";
        values[] = {0,1};
        texts[] = {"No","Yes"};
        default = 1;
    };
    class napalmEnabled
    {
        title = "Enable Napalm Bombing for AI";
        values[] = {0,1};
        texts[] = {"No","Yes"};
        default = 0;
    };
	class teamSwitchDelay
    {
        title = "Delay After Leaving Before a Player Can Join Another Team";
        values[] = {0, 900, 1800, 3600};
        texts[] = {"No delay","15 minutes","30 minutes","60 minutes"};
        default = 3600;
    };
    class unlockedUnlimitedAmmo
    {
         title = "Do Unlocked Weapons Automatically Unlock Their Standard Magazine?";
         values[] = {1,0};
         texts[] =  {"Yes","No"};
         default = 1;
    };
    class Spacer10
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class Kart
    {
         title = "Allow Items and Vehicles from Karts DLC?";
         values[] = {1,0};
         texts[] =  {"Yes","No"};
         default = 0;
    };
    class Mark
    {
         title = "Allow Items and Vehicles from Marksman DLC?";
         values[] = {1,0};
         texts[] =  {"Yes","No"};
         default = 0;
    };
    class Heli
    {
         title = "Allow Items and Vehicles from Heli DLC?";
         values[] = {1,0};
         texts[] =  {"Yes","No"};
         default = 0;
    };
    class Expansion
    {
         title = "Allow Items and Vehicles from Apex DLC?";
         values[] = {1,0};
         texts[] =  {"Yes","No"};
         default = 0;
    };
    class Jets
    {
         title = "Allow Items and Vehicles from Jets DLC?";
         values[] = {1,0};
         texts[] =  {"Yes","No"};
         default = 0;
    };
    class Orange
    {
         title = "Allow Items and Vehicles from Laws of War DLC?";
         values[] = {1,0};
         texts[] =  {"Yes","No"};
         default = 0;
    };
    class Tanks
    {
         title = "Allow Items and Vehicles from Tanks DLC?";
         values[] = {1,0};
         texts[] =  {"Yes","No"};
         default = 0;
    };
    class GlobMob
    {
         title = "Allow Items and Vehicles from GlobMob DLC?";
         values[] = {1,0};
         texts[] =  {"Yes","No"};
         default = 0;
    };
    class Enoch
    {
         title = "Allow Items and Vehicles from Enoch DLC?";
         values[] = {1,0};
         texts[] =  {"Yes","No"};
         default = 0;
    };
    class Spacer0
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class AdvancedParams
    {
        title = "ADVANCED USERS ONLY";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class CrateOptions
    {
        title = "LOOT CRATE OPTIONS";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateWepTypeMin
    {
        title = "Minimum Weapon Types in Crates";
        values[] = {0,1,2,3,4,5};
        default = 1;
    };
    class crateWepTypeMax
    {
        title = "Maximum Weapon Types in Crates";
        values[] = {0,1,2,3,4,5,6,7,8,9,10};
        default = 5;
    };
    class crateWepNumMin
    {
        title = "Minimum Weapon Quantity in Crates";
        values[] = {0,1,2,3,4,5};
        default = 1;
    };
    class crateWepNumMax
    {
        title = "Maximum Weapon Quantity in Crates";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        default = 13;
    };
    class Spacer1
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateItemTypeMin
    {
        title = "Minimum Item Types in Crates";
        values[] = {0,1,2,3,4,5};
        default = 1;
    };
    class crateItemTypeMax
    {
        title = "Maximum Item Types in Crates";
        values[] = {0,1,2,3,4,5,6,7,8,9,10};
        default = 5;
    };
    class crateItemNumMin
    {
        title = "Minimum Item Quantity in Crates";
        values[] = {0,1,2,3,4,5};
        default = 0;
    };
    class crateItemNumMax
    {
        title = "Maximum Item Quantity in Crates";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        default = 5;
    };
    class Spacer2
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateAmmoTypeMin
    {
        title = "Minimum Ammo Types in Crates";
        values[] = {0,1,2,3,4,5};
        default = 1;
    };
    class crateAmmoTypeMax
    {
        title = "Maximum Ammo Types in Crates";
        values[] = {0,1,2,3,4,5,6,7,8,9,10};
        default = 6;
    };
    class crateAmmoNumMin
    {
        title = "Minimum Ammo Quantity in Crates";
        values[] = {0,1,2,3,4,5};
        default = 5;
    };
    class crateAmmoNumMax
    {
        title = "Maximum Ammo Quantity in Crates";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        default = 10;
    };
    class Spacer3
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateMineTypeMin
    {
        title = "Minimum Mine Types in Crates";
        values[] = {0,1,2,3,4,5};
        default = 0;
    };
    class crateMineTypeMax
    {
        title = "Maximum Mine Types in Crates";
        values[] = {0,1,2,3,4,5,6,7,8,9,10};
        default = 3;
    };
    class crateMineNumMin
    {
        title = "Minimum Mine Quantity in Crates";
        values[] = {0,1,2,3,4,5};
        default = 0;
    };
    class crateMineNumMax
    {
        title = "Maximum Mine Quantity in Crates";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        default = 5;
    };
    class Spacer4
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateOpticTypeMin
    {
        title = "Minimum Optic Types in Crates";
        values[] = {0,1,2,3,4,5};
        default = 0;
    };
    class crateOpticTypeMax
    {
        title = "Maximum Optic Types in Crates";
        values[] = {0,1,2,3,4,5,6,7,8,9,10};
        default = 2;
    };
    class crateOpticNumMin
    {
        title = "Minimum Optic Quantity in Crates";
        values[] = {0,1,2,3,4,5};
        default = 1;
    };
    class crateOpticNumMax
    {
        title = "Maximum Optic Quantity in Crates";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        default = 3;
    };
    class Spacer5
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateBackpackTypeMin
    {
        title = "Minimum Backpack Types in Crates";
        values[] = {0,1,2,3,4,5};
        default = 1;
    };
    class crateBackpackTypeMax
    {
        title = "Maximum Backpack Types in Crates";
        values[] = {0,1,2,3,4,5,6,7,8,9,10};
        default = 5;
    };
    class crateBackpackNumMin
    {
        title = "Minimum Backpack Quantity in Crates";
        values[] = {0,1,2,3,4,5};
        default = 0;
    };
    class crateBackpackNumMax
    {
        title = "Maximum Backpack Quantity in Crates";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        default = 2;
    };
};