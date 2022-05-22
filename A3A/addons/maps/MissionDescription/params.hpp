// Real defaults are set in functions/init/fn_initParams.sqf and should match the descriptions below
// 9999 is a special value that causes that parameter to be loaded from the last save, if any
// 9998 is a reserved value and should not be used

class Params
{
    class howTo0
    {
        title = "HOW TO USE ANTISTASI PARAMETERS";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class howTo1
    {
        title = "Default values will attempt to load from the save. If not found, the value in brackets will be used instead";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class howTo2
    {
        title = "Setting any other value will override that parameter with the chosen value";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class howTo3
    {
        title = "Note that this page does NOT know the saved values";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class howToSpacer
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class loadSave
    {
        title = "Load last Persistent Save";
        values[] = {1,0};
        texts[] = {"Yes","No"};
        default = 1;
    };
    class gameMode
    {
        title = "Game Mode - Do NOT change this mid mission";
        values[] = {9999,1,2,3};
        texts[] = {"Load from save (Default: Reb vs Gov vs Inv)","Reb vs Gov vs Inv","Reb vs Gov & Inv","Reb vs Gov"};
        default = 9999;
    };
    class autoSave
    {
        title = "Enable Autosave (every X minutes)";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: Yes)","Yes","No"};
        default = 9999;
    };
    class autoSaveInterval
    {
        title = "Time between autosaves (in minutes)";
        values[] = {9999,600,1200,1800,3600,5400};
        texts[] = {"Load from save (Default: 60)","10","20","30","60","90"};
        default = 9999;
    };
    class membership
    {
        title = "Enable Server Membership";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: Yes)","Yes","No"};
        default = 9999;
    };
    class switchComm
    {
        title = "Enable Commander Switch (highest ranked player)";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: Yes)","Yes","No"};
        default = 9999;
    };
    class tkPunish
    {
        title = "Enable Teamkill Punish";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: Yes)","Yes","No"};
        default = 9999;
    };
    class mRadius
    {
        title = "Max distance from HQ for tasks";
        values[] = {9999,2000,4000,6000,8000,10000,12000};
        texts[] = {"Load from save (Default: 4000)","2000","4000","6000","8000","10000","12000"};
        default = 9999;
    };
    class pMarkers
    {
        title = "Allow Friendly Player Markers";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: Yes)","Yes","No"};
        default = 9999;
    };
    class AISkill
    {
        title = "Mission Difficulty";
        values[] = {9999,1,2,3};
        texts[] = {"Load from save (Default: Normal)","Easy","Normal","Hard"};
        default = 9999;
    };
    class unlockItem
    {
        title = "Number of the same item required to unlock";
        values[] = {9999,15,25,40,-1};
        texts[] = {"Load from save (Default: 25)","15","25","40","No unlocks"};
        default = 9999;
    };
    class guestItemLimit
    {
        title = "Default number of items needed for guests to be able to use them";
        values[] = {9999,0,10,15,25,40};
        texts[] = {"Load from save (Default: 25)","No limit","10","15","25","40"};
        default = 9999;
    };
    class civTraffic
    {
        title = "Rate of Civ Traffic";
        values[] = {9999,0,1,2,4,};
        texts[] = {"Load from save (Default: Medium)","None","Low","Medium","High"};
        default = 9999;
    };
    class memberSlots
    {
        title = "Percentage of Reserved Slots for Members";
        values[] = {9999,0,20,40,60,80,100};
        texts[] = {"Load from save (Default: 20%)","None","20%","40%","60%","80%","All"};
        default = 9999;
    };
    class memberDistance
    {
        title = "Max distance non members can be from the closest member or HQ (they will be teleported to HQ after some timeout)";
        values[] = {9999,4000,5000,6000,7000,8000,10000,16000,-1};  // 16000 is left as backwards compatibility
        texts[] = {"Load from save (Default: 5 km)","4 km","5 km","6 km","7 km","8 km","10 km","16 km","Unlimited"};
        default = 9999;
    };
    class allowFT
    {
        title = "Fast Travel Targets Allowed";
        values[] = {9999,0,1};
        texts[] = {"Load from save (Default: Airports & HQ)","Any friendly position","Only Airports & HQ"};
        default = 9999;
    };
    class napalmEnabled
    {
        title = "Enable Napalm Bombing for AI";
        values[] = {9999,0,1};
        texts[] = {"Load from save (Default: No)","No","Yes"};
        default = 9999;
    };
    class unlockedUnlimitedAmmo
    {
        title = "Do Unlocked Weapons Automatically Unlock Their Standard Magazine?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class allowGuidedLaunchers
    {
        title = "Should Guided Launchers become unlocked?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class allowUnlockedExplosives
    {
        title = "Should Explosives become unlocked?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class startWithLongRangeRadio
    {
        title = "[TFAR] Start with Long Range Radio?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: Yes)","Yes","No"};
        default = 9999;
    };
    class aceFood
    {
        title = "[ACE] Start with Food Items";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class helmetLossChance
    {
        title = "Chance of helmet loss on headshots";
        values[] = {9999,0,33,66,100};
        texts[] = {"Load from save (Default: Sometimes)","Never","Sometimes","Often","Always"};
        default = 9999;
    };
    class Spacer10
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class EnableLootToCrate
    {
        title = "Enable Loot to crate";
        values[] = {9999, 0, 1};
        texts[] = {"Load from save (Default: Enabled)","Disabled", "Enabled"};
        default = 9999;
    };
    class LTCLootUnlocked
    {
        title = "Loot to crate: transfers unlocked items";
        values[] = {9999, 0, 1};
        texts[] = {"Load from save (Default: Disabled)", "Disabled", "Enabled"};
        default = 9999;
    };
    class Spacer11
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class Kart
    {
        title = "Allow Items and Vehicles from Karts DLC?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class Mark
    {
        title = "Allow Items and Vehicles from Marksman DLC?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class Heli
    {
        title = "Allow Items and Vehicles from Heli DLC?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class Expansion
    {
        title = "Allow Items and Vehicles from Apex DLC?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class Jets
    {
        title = "Allow Items and Vehicles from Jets DLC?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class Orange
    {
        title = "Allow Items and Vehicles from Laws of War DLC?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class Tanks
    {
        title = "Allow Items and Vehicles from Tanks DLC?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class GlobMob
    {
        title = "Allow Items and Vehicles from Global Mobilization DLC?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class Enoch
    {
        title = "Allow Items and Vehicles from Contact DLC?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class AoW
    {
        title = "Allow Art of War DLC?";
        values[] = {9999,1,0};
        texts[] =  {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class VN
    {
        title = "Allow VN DLC (S.O.G. PRAIRIE FIRE)?";
        values[] = {9999,1,0};
        texts[] =  {"Load from save (Default: No)","Yes","No"};
        default = 9999;
    };
    class WS
    {
        title = "Allow Items and Vehicles from Western Sahara DLC?";
        values[] = {9999,1,0};
        texts[] = {"Load from save (Default: No)","Yes","No"};
        default = 9999;
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
    class LogLevel
    {
        title = "Logging Level (Amount of detail in .rpt file)";
        values[] = {9999,1,2,3};
        texts[] = {"Load from save (Default: Debug)", "Error", "Info", "Debug"};
        default = 9999;
    };
    class A3A_GUIDevPreview
    {
        title = "Use In-Development UI Preview.";
        values[] = {9999,0,1};
        texts[] = {"Load from save (Default: No)", "No", "Yes"};
        default = 9999;
    };
    class SupportOptions
    {
        title = "SUPPORT OPTIONS";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class allowUnfairSupports
    {
        title = "[Experimental - Use at own risk] Allow unfair supports to be used by the enemy";
        values[] = {9999, 0, 1};
        texts[] = {"Load from save (Default: Not Allowed)", "Not allowed", "Allowed"};
        default = 9999;
    };
    class allowFuturisticSupports
    {
        title = "[Experimental - Use at own risk](Requires unfair supports) Allow futuristic supports to be used by the enemy";
        values[] = {9999, 0, 1};
        texts[] = {"Load from save (Default: Not Allowed)", "Not allowed", "Allowed"};
        default = 9999;
    };
    class CrateOptions
    {
        title = "LOOT CRATE OPTIONS";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class truelyRandomCrates
    {
        title = "[Experimental] Truely Random Crates: Remove all balance checks from Crates";
        values[] = {9999, 0, 1};
        texts[] = {"Load from save (Default: False)", "False", "True"};
        default = 9999;
    };
    class cratePlayerScaling
    {
        title = "Decrease loot quantity as player count increases? (Yes is recommended for balance reasons)";
        values[] = {9999, 0, 1};
        texts[] = {"Load from save (Default: True)", "False", "True"};
        default = 9999;
    };
    class crateWepTypeMax
    {
        title = "Maximum Weapon Types in Crates";
        values[] = {9999,0,2,4,6,8,12,16};
        texts[] = {"Load from save (Default: 9)","1","3","5","7","9","13","17"};
        default = 9999;
    };
    class crateWepNumMax
    {
        title = "Maximum Weapon Quantity in Crates";
        values[] = {9999,0,1,3,5,8,10,15};
        texts[] = {"Load from save (Default: 8)","None","1","3","5","8","10","15"};
        default = 9999;
    };
    class Spacer1
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateItemTypeMax
    {
        title = "Maximum Item Types in Crates";
        values[] = {9999,0,2,4,9};
        texts[] = {"Load from save (Default: 5)","1","3","5","10"};
        default = 9999;
    };
    class crateItemNumMax
    {
        title = "Maximum Item Quantity in Crates";
        values[] = {9999,0,1,3,5,10,15};
        texts[] = {"Load from save (Default: 5)","None","1","3","5","10","15"};
        default = 9999;
    };
    class Spacer2
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateAmmoTypeMax
    {
        title = "Maximum Ammo Types in Crates";
        values[] = {9999,0,2,4,6,9,14,19};
        texts[] = {"Load from save (Default: 7)","1","3","5","7","10","15","20"};
        default = 9999;
    };
    class crateAmmoNumMax
    {
        title = "Maximum Ammo Quantity in Crates";
        values[] = {9999,0,1,3,5,10,15,20,25,30};
        texts[] = {"Load from save (Default: 20)","None","1","3","5","10","15","20","25","30"};
        default = 9999;
    };
    class Spacer3
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateExplosiveTypeMax
    {
        title = "Maximum Explosive Types in Crates";
        values[] = {9999,0,2,4,9};
        texts[] = {"Load from save (Default: 3)","1","3","5","10"};
        default = 9999;
    };
    class crateExplosiveNumMax
    {
        title = "Maximum Explosive Quantity in Crates";
        values[] = {9999,0,1,3,5,10,15};
        texts[] = {"Load from save (Default: 5)","None","1","3","5","10","15"};
        default = 9999;
    };
    class Spacer4
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateAttachmentTypeMax
    {
        title = "Maximum Attachment Types in Crates";
        values[] = {9999,0,2,4,6,9,14,19};
        texts[] = {"Load from save (Default: 7)","1","3","5","7","10","15","20"};
        default = 9999;
    };
    class crateAttachmentNumMax
    {
        title = "Maximum Attachment Quantity in Crates";
        values[] = {9999,0,1,3,5,10,15,20,25,30};
        texts[] = {"Load from save (Default: 15)","None","1","3","5","10","15","20","25","30"};
        default = 9999;
    };
    class Spacer5
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateBackpackTypeMax
    {
        title = "Maximum Backpack Types in Crates";
        values[] = {9999,0,2,4,9};
        texts[] = {"Load from save (Default: 0)","1","3","5","10"};
        default = 9999;
    };
    class crateBackpackNumMax
    {
        title = "Maximum Backpack Quantity in Crates";
        values[] = {9999,0,1,3,5,10,15};
        texts[] = {"Load from save (Default: 3)","None","1","3","5","10","15"};
        default = 9999;
    };
    class Spacer6
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateVestTypeMax
    {
        title = "Maximum Vest Types in Crates";
        values[] = {9999,0,2,4,9};
        texts[] = {"Load from save (Default: 0)","1","3","5","10"};
        default = 9999;
    };
    class crateVestNumMax
    {
        title = "Maximum Vest Quantity in Crates";
        values[] = {9999,0,1,3,5,10,15};
        texts[] = {"Load from save (Default: 3)","None","1","3","5","10","15"};
        default = 9999;
    };
    class Spacer7
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateHelmetTypeMax
    {
        title = "Maximum Helmet Types in Crates";
        values[] = {9999,0,2,4,9};
        texts[] = {"Load from save (Default: 0)","1","3","5","10"};
        default = 9999;
    };
    class crateHelmetNumMax
    {
        title = "Maximum Helmet Quantity in Crates";
        values[] = {9999,0,1,3,5,10,15};
        texts[] = {"Load from save (Default: 0)","None","1","3","5","10","15"};
        default = 9999;
    };
    class Spacer8
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateDeviceTypeMax
    {
        title = "Maximum Device Backpack Types in Crates";
        values[] = {9999,0,2,4,9};
        texts[] = {"Load from save (Default: 3)","1","3","5","10"};
        default = 9999;
    };
    class crateDeviceNumMax
    {
        title = "Maximum Device Backpack Quantity in Crates";
        values[] = {9999,0,1,3,5,10,15};
        texts[] = {"Load from save (Default: 3)","None","1","3","5","10","15"};
        default = 9999;
    };
};
