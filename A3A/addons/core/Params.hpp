class Params
{
    class gameMode
    {
        title = "Game Mode - Do NOT change this mid mission";
        values[] = {1,2,3};
        texts[] = {"Reb vs Gov vs Inv","Reb vs Gov & Inv","Reb vs Gov"};
        default = 1;
    };
    class autoSave
    {
        title = "Enable Autosave (every X minutes)";
        values[] = {0,1};
        texts[] = {"No","Yes"};
        default = 1;
    };
    class autoSaveInterval
    {
        title = "Time between autosaves (in minutes)";
        values[] = {600,1200,1800,3600,5400};
        texts[] = {"10","20","30","60","90"};
        default = 3600;
    };
    class playerMarkersEnabled
    {
        title = "Enable Friendly Player Markers";
        values[] = {0,1};
        texts[] = {"No","Yes"};
        default = 0;
    };
    class limitedFT
    {
        title = "Fast Travel Targets Allowed";
        values[] = {0,1};
        texts[] = {"Any friendly position","Only Airports & HQ"};
        default = 1;
    };
    class civTraffic
    {
        title = "Quantity of civilan traffic and parked vehicles";
        values[] = {0,1,2,4};
        texts[] = {"None","Low","Medium","High"};
        default = 2;
    };
    class distanceMission
    {
        title = "Max distance from HQ for tasks";
        values[] = {2000,4000,6000,8000,10000,12000};
        texts[] = {"2000","4000","6000","8000","10000","12000"};
        default = 4000;
    };
    class distanceSPWN
    {
        title = "Spawn distance";
        values[] = {700,800,900,1000,1100,1200};
        texts[] = {"700","800","900","1000","1100","1200"};
        default = 1000;
    };
    class enemyNearDistance
    {
        title = "Distance used to check for nearby enemies";
        values[] = {200,300,400,500};
        texts[] = {"200","300","400","500"};
        default = 300;
    };
    class globalCivilianMax
    {
        title = "Maximum global civilians";
        values[] = {0,2,5,10,15,20};
        texts[] = {"0","2","5","10","15","20"};
        default = 5;
    };
    class maxCiviliansPerTown
    {
        title = "Maximum civilians spawn per town";
        values[] = {0,2,5,10,15};
        texts[] = {"0","2","5","10","15"};
        default = 2;
    };
    class initialPlayerMoney
    {
        title = "Initial Player Money";
        values[] = {0, 100, 250, 500, 1000, 2500};
        texts[] = {"0","100","250","500","1000","2500"};
        default = 100;
    };
    class initialFactionMoney
    {
        title = "Initial Rebel Faction Money";
        values[] = {0,1000,2500,5000,10000};
        texts[] = {"0","1000","2500","5000","10000"};
        default = 1000;
    };
    class initialHr
    {
        title = "Initial Rebel Faction Manpower";
        values[] = {0, 8, 16, 24, 32, 50};
        texts[] = {"0","8","16","24","32","50"};
        default = 8;
    };
    class A3A_idleTimeout
    {
        title = "Time before a player is considered AFK";
        values[] = {120,300,900,1800,9999999};
        texts[] = {"2min","5min","15min","30min","disabled"};
        default = 900;
    };
    class A3A_GCThreshold
    {
        title = "Garbage Cleaner Threshold for Automatic gc";
        values[] = {3600, 7200, 10800, 14400, 0};
        texts[] = {"1hr", "2hrs", "3hrs", "4hrs", "disabled"};
        Default = 0;
    };
    class A3A_reviveTime
    {
        title = "Minimum revive time for players";
        values[] = {5,10,15};
        texts[] = {"5 seconds","10 seconds","15 seconds"};
        default = 10;
    };
    class A3A_selfReviveMethods
    {
        title = "Self-revive methods enabled";
        values[] = {0,1};
        texts[] = {"Disabled", "Withstand"};
        default = 0;
    };

    class SpacerMembership
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class TitleMembership
    {
        title = "MEMBERSHIP OPTIONS";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class membershipEnabled
    {
        title = "Enable Server Membership";
        values[] = {0,1};
        texts[] = {"No","Yes"};
        default = 1;
    };
    class A3A_guestCommander
    {
        title = "Allow guests to become commander when no members are eligible";
        values[] = {0,1};
        texts[] = {"No","Yes"};
        default = 1;
    };
    class tkPunish
    {
        title = "Enable Teamkill Punish";
        values[] = {0,1};
        texts[] = {"No","Yes"};
        default = 1;
    };
    class memberSlots
    {
        title = "Percentage of Reserved Slots for Members";
        values[] = {0,20,40,60,80,100};
        texts[] = {"None","20%","40%","60%","80%","All"};
        default = 20;
    };
    class memberDistance
    {
        title = "Max distance of guests from the closest member or HQ";
        values[] = {4000,5000,6000,7000,8000,10000,16000,-1};  // 16000 is left as backwards compatibility
        texts[] = {"4 km","5 km","6 km","7 km","8 km","10 km","16 km","Unlimited"};
        default = 5000;
    };

    class SpacerBalance
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class TitleBalance
    {
        title = "BALANCE OPTIONS";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class A3A_enemyBalanceMul
    {
        title = "Overall enemy resource balance";
        values[] = {4,6,8,10,12,14,17,20,24,28};
        texts[] =  {"0.4x","0.6x","0.8x","1.0x","1.2x","1.4x","1.7x","2.0x","2.4x","2.8x"};
        default = 10;
    };
    class A3A_enemyAttackMul
    {
        attr[] = {"server"};
        title = "Enemy attack resource balance (relative to overall balance)";
        values[] = {4,6,8,10,12,14,17,20,24,28};
        texts[] =  {"0.4x","0.6x","0.8x","1.0x","1.2x","1.4x","1.7x","2.0x","2.4x","2.8x"};
        default = 10;
    };
    class A3A_invaderBalanceMul
    {
        attr[] = {"server"};
        title = "Resource multiplier for invaders relative to occupants";
        values[] = {10,11,12,13,14,15};
        texts[] =  {"1.0x","1.1x","1.2x","1.3x","1.4x","1.5x"};
        default = 12;
    };
    class A3A_attackHQProximityMul
    {
        attr[] = {"server"};
        title = "Enemy preference for attacking rebel targets closer to HQ";
        values[] = {1,2,3,5,8};
        texts[] =  {"No change","2x","3x","5x","8x"};
        default = 3;
    };
    class A3A_enemySkillMul
    {
        title = "Enemy AI skill (also affected by server skill)";
        values[] = {0,1,2,3,4};
        texts[] = {"Very low","Low","Normal","High","Very high"};
        default = 2;
    };
    class A3A_rebelSkillMul
    {
        title = "Friendly AI skill (also affected by server skill)";
        values[] = {0,1,2,3,4};
        texts[] = {"Very low","Low","Normal","High","Very high"};
        default = 2;
    };
    class napalmEnabled
    {
        title = "Enable Napalm Bombing for AI";
        values[] = {0,1};
        texts[] = {"No","Yes"};
        default = 1;
    };
    class allowUnfairSupports
    {
        attr[] = {"server"};
        title = "Allow unfair supports to be used by the enemy";
        values[] = {0, 1};
        texts[] = {"Not allowed", "Allowed"};
        default = 0;
    };
    class allowFuturisticSupports
    {
        attr[] = {"server"};
        title = "[Experimental] Allow futuristic supports to be used by the enemy";
        values[] = {0, 1};
        texts[] = {"Not allowed", "Allowed"};
        default = 0;
    };
    class A3A_rebelGarrisonLimit
    {
        title = "How many rebels can be garrisoned (1.5x for airports, 0.5x for resources and factories)?";
        tooltip = "How many troops can be in garrison. Note that No limit option may affect performance as there might be too many troops for CPU to handle.";
        values[] = {-1, 16, 24, 32};
        texts[] = {"No limit", "16", "24", "32"};
        default = 24;
    };
    class SpacerEquipment
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class TitleEquipment
    {
        title = "EQUIPMENT OPTIONS";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class minWeaps
    {
        title = "Number of the same item required to unlock";
        values[] = {15,25,40,-1};
        texts[] = {"15","25","40","No unlocks"};
        default = 25;
    };
    class A3A_guestItemLimit
    {
        title = "Default number of items needed for guests to be able to use them";
        values[] = {0,10,15,25,40};
        texts[] = {"No limit","10","15","25","40"};
        default = 25;
    };
    class unlockedUnlimitedAmmo
    {
        attr[] = {"server"};
        title = "Do Unlocked Weapons Automatically Unlock Their Standard Magazine?";
        values[] = {1,0};
        texts[] = {"Yes","No"};
        default = 0;
    };
    class allowGuidedLaunchers
    {
        attr[] = {"server"};
        title = "Should Guided Launchers become unlocked?";
        values[] = {1,0};
        texts[] = {"Yes","No"};
        default = 0;
    };
    class allowUnlockedExplosives
    {
        attr[] = {"server"};
        title = "Should Explosives become unlocked?";
        values[] = {1,0};
        texts[] = {"Yes","No"};
        default = 0;
    };
    class startWithLongRangeRadio
    {
        attr[] = {"server"};
        title = "[TFAR] Start with Long Range Radio?";
        values[] = {0,1};
        texts[] = {"No","Yes"};
        default = 1;
    };
    class aceFood
    {
        attr[] = {"server"};
        title = "[ACE] Start with Food Items";
        values[] = {0,1};
        texts[] = {"No","Yes"};
        default = 0;
    };
    class helmetLossChance
    {
        title = "Chance of helmet loss on headshots";
        values[] = {0,33,66,100};
        texts[] = {"Never","Sometimes","Often","Always"};
        default = 33;
    };
    class LootToCrateRadius
    {
        title = "Loot to crate radius";
        values[] = {0,10,15,20};
        texts[] = {"Disabled","10m","15m","20m"};
        default = 10;
    };
    class LTCLootUnlocked
    {
        title = "Loot to crate transfers unlocked items";
        values[] = {0, 1};
        texts[] = {"Disabled", "Enabled"};
        default = 0;
    };

    class SpacerLoot
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class TitleLoot
    {
        title = "LOOT CRATE OPTIONS";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class bobChaosCrates
    {
        title = "[Experimental] Truely Random Crates: Remove all balance checks from Crates";
        values[] = {0, 1};
        texts[] = {"No", "Yes"};
        default = 0;
    };
    class cratePlayerScaling
    {
        title = "Decrease loot quantity as player count increases? (Yes is recommended for balance reasons)";
        values[] = {0, 1};
        texts[] = {"No", "Yes"};
        default = 1;
    };
    class crateWepTypeMax
    {
        title = "Maximum Weapon Types in Crates";
        values[] = {0,2,4,6,8,12,16};
        texts[] = {"1","3","5","7","9","13","17"};
        default = 8;
    };
    class crateWepNumMax
    {
        title = "Maximum Weapon Quantity in Crates";
        values[] = {0,1,3,5,8,10,15};
        texts[] = {"None","1","3","5","8","10","15"};
        default = 8;
    };
    class crateItemTypeMax
    {
        title = "Maximum Item Types in Crates";
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 4;
    };
    class crateItemNumMax
    {
        title = "Maximum Item Quantity in Crates";
        values[] = {0,1,3,5,10,15};
        texts[] = {"None","1","3","5","10","15"};
        default = 5;
    };
    class crateAmmoTypeMax
    {
        title = "Maximum Ammo Types in Crates";
        values[] = {0,2,4,6,9,14,19};
        texts[] = {"1","3","5","7","10","15","20"};
        default = 6;
    };
    class crateAmmoNumMax
    {
        title = "Maximum Ammo Quantity in Crates";
        values[] = {0,1,3,5,10,15,20,25,30};
        texts[] = {"None","1","3","5","10","15","20","25","30"};
        default = 20;
    };
    class crateExplosiveTypeMax
    {
        title = "Maximum Explosive Types in Crates";
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 4;
    };
    class crateExplosiveNumMax
    {
        title = "Maximum Explosive Quantity in Crates";
        values[] = {0,1,3,5,10,15};
        texts[] = {"None","1","3","5","10","15"};
        default = 5;
    };
    class crateAttachmentTypeMax
    {
        title = "Maximum Attachment Types in Crates";
        values[] = {0,2,4,6,9,14,19};
        texts[] = {"1","3","5","7","10","15","20"};
        default = 6;
    };
    class crateAttachmentNumMax
    {
        title = "Maximum Attachment Quantity in Crates";
        values[] = {0,1,3,5,10,15,20,25,30};
        texts[] = {"None","1","3","5","10","15","20","25","30"};
        default = 15;
    };
    class crateBackpackTypeMax
    {
        title = "Maximum Backpack Types in Crates";
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 0;
    };
    class crateBackpackNumMax
    {
        title = "Maximum Backpack Quantity in Crates";
        values[] = {0,1,3,5,10,15};
        texts[] = {"None","1","3","5","10","15"};
        default = 3;
    };
    class crateVestTypeMax
    {
        title = "Maximum Vest Types in Crates";
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 0;
    };
    class crateVestNumMax
    {
        title = "Maximum Vest Quantity in Crates";
        values[] = {0,1,3,5,10,15};
        texts[] = {"None","1","3","5","10","15"};
        default = 3;
    };
    class crateHelmetTypeMax
    {
        title = "Maximum Helmet Types in Crates";
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 0;
    };
    class crateHelmetNumMax
    {
        title = "Maximum Helmet Quantity in Crates";
        values[] = {0,1,3,5,10,15};
        texts[] = {"None","1","3","5","10","15"};
        default = 3;
    };
    class crateDeviceTypeMax
    {
        title = "Maximum Device Backpack Types in Crates";
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 2;
    };
    class crateDeviceNumMax
    {
        title = "Maximum Device Backpack Quantity in Crates";
        values[] = {0,1,3,5,10,15};
        texts[] = {"None","1","3","5","10","15"};
        default = 3;
    };

    class SpacerDevelopment
    {
        title = "";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class TitleDevelopment
    {
        title = "DEVELOPMENT OPTIONS";
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class LogLevel
    {
        title = "Logging Level (Amount of detail in .rpt file)";
        values[] = {1,2,3,4};
        texts[] = {"Error", "Info", "Debug", "Verbose"};
        default = 2;
    };
    class A3A_logDebugConsole
    {
        title = "Log debug console use";
        values[] = {-1,1,2};
        texts[] = {"None", "All non-dev", "All"};
        default = 1;
    };
    class A3A_GUIDevPreview
    {
        title = "Use In-Development UI Preview.";
        values[] = {0,1};
        texts[] = {"No", "Yes"};
        default = 0;
    };
};
