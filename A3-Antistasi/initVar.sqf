//Antistasi var settings
//If some setting can be modified it will be commented with a // after it.
//Make changes at your own risk!!
//You do not have enough balls to make any modification and after making a Bug report because something is wrong. You don't wanna be there. Believe me.
//Not commented lines cannot be changed.
//Don't touch them.
diag_log format ["%1: [Antistasi] | INFO | initVar Started.",servertime];
antistasiVersion = "v 1.4c1.05";

debug = false;//debug variable, not useful for everything..

cleantime = 3600;//time to delete dead bodies, vehicles etc..
distanceSPWN = 1000;//initial spawn distance. Less than 1Km makes parked vehicles spawn in your nose while you approach.
distanceSPWN1 = 1300;
distanceSPWN2 = 500;
musicON = if (isMultiplayer) then {false} else {true};
civPerc = 35;
autoHeal = false;
recruitCooldown = 0;
savingClient = false;
incomeRep = false;
//distanceMission = 2500;
/*
minMags = 20;

minPacks = 20;
minItems = 20;
minOptics = 12;*/
maxUnits = 140;

diag_log format ["%1: [Antistasi] | INFO | initVar | Generating Players.",servertime];
teamPlayer = side group petros;
Occupants = if (teamPlayer == independent) then {west} else {independent};
Invaders = east;

colourTeamPlayer = if (teamPlayer == independent) then {"colorGUER"} else {"colorBLUFOR"};
colorOccupants = if (teamPlayer == independent) then {"colorBLUFOR"} else {"colorGUER"};
colorInvaders = "colorOPFOR";

respawnTeamPlayer = if (teamPlayer == independent) then {"respawn_guerrila"} else {"respawn_west"};
respawnOccupants = if (teamPlayer == independent) then {"respawn_west"} else {"respawn_guerrila"};
posHQ = getMarkerPos respawnTeamPlayer;

diag_log format ["%1: [Antistasi] | INFO | initVar | Building Magazine Pool.",servertime];
allMagazines = [];
_cfgmagazines = configFile >> "cfgmagazines";
for "_i" from 0 to (count _cfgMagazines) -1 do
	{
	_magazine = _cfgMagazines select _i;
	if (isClass _magazine) then
		{
		_nameX = configName (_magazine);
		allMagazines pushBack _nameX;
		};
	};

arifles = [];
srifles = [];
mguns = [];
hguns = [];
mlaunchers = [];
rlaunchers = [];
helmets = [];
//vests = [];

hasRHS = false;

//lockedWeapons = ["Rangefinder","Laserdesignator"];
diag_log format ["%1: [Antistasi] | INFO | initVar | Building Weapon list",servertime];
_allPrimaryWeapons = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""
    &&
    { getNumber ( _x >> ""type"" ) isEqualTo 1 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allHandGuns = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""
    &&
    { getNumber ( _x >> ""type"" ) isEqualTo 2 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allLaunchers = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""
    &&
    { getNumber ( _x >> ""type"" ) isEqualTo 4 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allItems = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""
    &&
    { getNumber ( _x >> ""type"" ) isEqualTo 131072 } } )
" configClasses ( configFile >> "cfgWeapons" );
diag_log format ["%1: [Antistasi] | INFO | initVar | Placing weapons.",servertime];
_alreadyPlaced = [];
{
_nameX = configName _x;
_nameX = [_nameX] call BIS_fnc_baseWeapon;
if (not(_nameX in _alreadyPlaced)) then
	{
	_magazines = getArray (configFile / "CfgWeapons" / _nameX / "magazines");
	_alreadyPlaced pushBack _nameX;
	_weapon = [_nameX] call BIS_fnc_itemType;
	_weaponType = _weapon select 1;
	switch (_weaponType) do
		{
		case "AssaultRifle": {arifles pushBack _nameX};
		case "MachineGun": {mguns pushBack _nameX};
		case "SniperRifle": {srifles pushBack _nameX};
		case "Handgun": {hguns pushBack _nameX};
		case "MissileLauncher": {mlaunchers pushBack _nameX};
		case "RocketLauncher": {rlaunchers pushBack _nameX};
		case "Headgear": {helmets pushBack _nameX};
		//case "Vest": {vests pushBack _nameX};
		};

	};
} forEach _allPrimaryWeapons + _allHandGuns + _allLaunchers + _allItems;
//vests = vests select {getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") > 5};
//Mod detection
activeAFRF = false;
activeUSAF = false;
activeGREF = false;
hasFFAA = false;
hasIFA = false;
myCustomMod = false;
has3CB = false;
diag_log format ["%1: [Antistasi] | INFO | initVar | Patching mod weapon support",servertime];
if (isClass(configFile/"CfgPatches"/"LIB_Core")) then
	{
	hasIFA = true;
	helmets = [];
	smokeX = ["LIB_RDG","LIB_NB39"];
	}
else
	{
 	if ("UK3CB_BAF_L1A1" in arifles) then {has3CB = true; diag_log format ["%1: [Antistasi] | INFO | initVar | 3CB Detected.",servertime];};
	if ("rhs_weap_akms" in arifles) then {activeAFRF = true; hasRHS = true; diag_log format ["%1: [Antistasi] | INFO | initVar | RHS Detected.",servertime];};
	if ("ffaa_armas_hkg36k_normal" in arifles) then {hasFFAA = true; diag_log format ["%1: [Antistasi] | INFO | initVar | FFAA Detected.",servertime];};
	if ("rhs_weap_m4a1_d" in arifles) then {activeUSAF = true; hasRHS = true; diag_log format ["%1: [Antistasi] | INFO | initVar | USAF Patch for RHS Detected.",servertime];};
	if ("rhs_weap_m92" in arifles) then {activeGREF = true; hasRHS = true} else {mguns pushBack "LMG_Mk200_BI_F"};
	helmets = helmets select {getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 2};
	smokeX = ["SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellBlue","SmokeShellYellow","SmokeShellPurple","SmokeShellOrange"];
	};

	//TFAR detection and config.
	hasTFAR = false;//default setting to avoid errors when mod is not present
	startLR = false;//default setting to avoid errors when mod is not present
	unlockedItems = [];
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then
	    {
	    hasTFAR = true;
	    haveRadio = true;
			startLR = false;//set to true to start with LR radios unlocked.
	    //unlockedItems = unlockedItems;
	    ["TF_no_auto_long_range_radio", true, true,"mission"] call CBA_settings_fnc_set;//set to false and players will spawn with LR radio.
	    if (hasIFA) then {
	      ["TF_give_personal_radio_to_regular_soldier", false, true,"mission"] call CBA_settings_fnc_set;
	      ["TF_give_microdagr_to_soldier", false, true,"mission"] call CBA_settings_fnc_set;
	    };
	    //tf_teamPlayer_radio_code = "";publicVariable "tf_teamPlayer_radio_code";//to make enemy vehicles usable as LR radio
	    //tf_east_radio_code = tf_teamPlayer_radio_code; publicVariable "tf_east_radio_code"; //to make enemy vehicles usable as LR radio
	    //tf_guer_radio_code = tf_teamPlayer_radio_code; publicVariable "tf_guer_radio_code";//to make enemy vehicles usable as LR radio
	    ["TF_same_sw_frequencies_for_side", true, true,"mission"] call CBA_settings_fnc_set;//synchronize SR default frequencies
	    ["TF_same_lr_frequencies_for_side", true, true,"mission"] call CBA_settings_fnc_set;//synchronize LR default frequencies

	    };

//Launcher selection
diag_log format ["%1: [Antistasi]: initVar | Building Launcher list.",servertime];
titanLaunchers = if ((!hasRHS) and !hasIFA and !myCustomMod) then
	{
	["launch_B_Titan_F","launch_I_Titan_F","launch_O_Titan_ghex_F","launch_O_Titan_F","launch_B_Titan_tna_F"]
	}
else
	{
	[]
	};
antitankAAF = if ((!hasRHS) and !hasIFA and !myCustomMod) then
	{
	["launch_I_Titan_F","launch_I_Titan_short_F"]
	}
else
	{
	[];
	};//possible Titan weapons that spawn in  ammoboxes
MAntitankAAF = if ((!hasRHS) and !hasIFA and !myCustomMod) then
	{
	["Titan_AT", "Titan_AP", "Titan_AA"]
	}
else
	{
	if (hasIFA) then {["LIB_Shg24"]} else {[]};
	};//possible Titan rockets that spawn in  ammoboxes
minesAAF = if ((!hasRHS) and !hasIFA and !myCustomMod) then
	{
	["SLAMDirectionalMine_Wire_Mag","SatchelCharge_Remote_Mag","ClaymoreDirectionalMine_Remote_Mag", "ATMine_Range_Mag","APERSTripMine_Wire_Mag","APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]
	}
else
	{
	if (hasRHS) then
		{
		["rhsusf_m112_mag","rhsusf_mine_m14_mag","rhs_mine_M19_mag","rhs_mine_tm62m_mag","rhs_mine_pmn2_mag"]
		}
	else
		{
		if (hasIFA and !myCustomMod) then {["LIB_PMD6_MINE_mag","LIB_TM44_MINE_mag","LIB_US_TNT_4pound_mag"]} else {[]};
		}
	};//possible mines that spawn in AAF ammoboxescomment "Exported from Arsenal by Alberto";
itemsAAF = if ((!hasRHS) and !hasIFA and !myCustomMod) then
	{
	["FirstAidKit","Medikit","MineDetector","NVGoggles","ToolKit","muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","muzzle_snds_H_MG","muzzle_snds_acp","bipod_03_F_oli","muzzle_snds_338_green","muzzle_snds_93mmg_tan","Rangefinder","Laserdesignator","ItemGPS","acc_pointer_IR","ItemRadio"]
	}
else
	{
	if (hasRHS) then
		{
		["FirstAidKit","Medikit","MineDetector","ToolKit","ItemGPS","acc_pointer_IR","ItemRadio"]
		}
	else
		{
		if (hasIFA and !myCustomMod) then {["FirstAidKit","Medikit","ToolKit","LIB_ToolKit"]} else {["FirstAidKit","Medikit","ToolKit"]};
		}
	};
diag_log format ["%1: [Antistasi]: initVar | Building NightVision list.",servertime];
NVGoggles = if (!hasIFA) then {["NVGoggles_OPFOR","NVGoggles_INDEP","O_NVGoggles_hex_F","O_NVGoggles_urb_F","O_NVGoggles_ghex_F","NVGoggles_tna_F","NVGoggles"]} else {[]};
diag_log format ["%1: [Antistasi]: initVar | Building Vehicle list.",servertime];
arrayCivVeh = if !(hasIFA) then
	{
	["C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_fuel_F","C_Van_01_transport_F","C_Truck_02_transport_F","C_Truck_02_covered_F","C_Offroad_02_unarmed_F"];
	}
else
	{
	["LIB_DAK_OpelBlitz_Open","LIB_GazM1","LIB_GazM1_dirty","LIB_DAK_Kfz1","LIB_DAK_Kfz1_hood"];
	};

ammunitionNATO = [];
weaponsNato = [];
ammunitionCSAT = [];
weaponsCSAT = [];
diag_log format ["%1: [Antistasi] | INFO | initVar | Reading Player Templates",servertime];
if (!hasIFA) then
	{
	if(has3CB) then {
		call compile preProcessFileLineNumbers "Templates\teamplayer3CBCCM.sqf";
		call compile preProcessFileLineNumbers "Templates\Occupants3CBBAF.sqf";
		call compile preProcessFileLineNumbers "Templates\Invaders3CBTKM.sqf";
		}
	else
		{
		if (!activeUSAF) then
			{
			call compile preProcessFileLineNumbers "Templates\OccupantsVanilla.sqf";
			}
		else
			{
			if (teamPlayer == independent) then {call compile preProcessFileLineNumbers "Templates\OccupantsRHSUSAF.sqf"} else {call compile preProcessFileLineNumbers "Templates\teamPlayerRHSUSAF.sqf"};
			};
		if (!activeAFRF) then {call compile preProcessFileLineNumbers "Templates\InvadersVanilla.sqf"} else {call compile preProcessFileLineNumbers "Templates\InvadersRHSAFRF.sqf"};

		if (!activeGREF) then
			{
			call compile preProcessFileLineNumbers "Templates\teamPlayerVanilla.sqf"
			}
		else
			{
			if (teamPlayer == independent) then {call compile preProcessFileLineNumbers "Templates\teamPlayerRHSGREF.sqf"} else {call compile preProcessFileLineNumbers "Templates\OccupantsRHSGREF.sqf"};
			};
		}
	}
else
	{
	call compile preProcessFileLineNumbers "Templates\teamPlayerIFA.sqf";
	call compile preProcessFileLineNumbers "Templates\InvadersIFA.sqf";
	call compile preProcessFileLineNumbers "Templates\OccupantsIFA.sqf";
	};

diag_log format ["%1: [Antistasi] | INFO | initVar | Assigning Squad Types.",servertime];
squadLeaders = SDKSL + [(NATOSquad select 0),(NATOSpecOp select 0),(CSATSquad select 0),(CSATSpecOp select 0),(FIASquad select 0)];
medics = SDKMedic + [(FIAsquad select ((count FIAsquad)-1)),(NATOSquad select ((count NATOSquad)-1)),(NATOSpecOp select ((count NATOSpecOp)-1)),(CSATSquad select ((count CSATSquad)-1)),(CSATSpecOp select ((count CSATSpecOp)-1))];
sdkTier1 = SDKMil + [staticCrewTeamPlayer] + SDKMG + SDKGL + SDKATman;
sdkTier2 = SDKMedic + SDKExp + SDKEng;
sdkTier3 = SDKSL + SDKSniper;
soldiersSDK = sdkTier1 + sdkTier2 + sdkTier3;
vehFIA = [vehSDKBike,vehSDKLightArmed,SDKMGStatic,vehSDKLightUnarmed,vehSDKTruck,vehSDKBoat,SDKMortar,staticATteamPlayer,staticAAteamPlayer,vehSDKRepair];
groupsSDKmid = [SDKSL,SDKGL,SDKMG,SDKMil];
groupsSDKAT = [SDKSL,SDKMG,SDKATman,SDKATman,SDKATman];
//["BanditShockTeam","ParaShockTeam"];
groupsSDKSquad = [SDKSL,SDKGL,SDKMil,SDKMG,SDKMil,SDKATman,SDKMil,SDKMedic];
groupsSDKSquadEng = [SDKSL,SDKGL,SDKMil,SDKMG,SDKExp,SDKATman,SDKEng,SDKMedic];
groupsSDKSquadSupp = [SDKSL,SDKGL,SDKMil,SDKMG,SDKATman,SDKMedic,[staticCrewTeamPlayer,staticCrewTeamPlayer],[staticCrewTeamPlayer,staticCrewTeamPlayer]];
groupsSDKSniper = [SDKSniper,SDKSniper];
groupsSDKSentry = [SDKGL,SDKMil];
banditUniforms = [];
uniformsSDK = [];
{
_unit = _x select 0;
_uniform = (getUnitLoadout _unit select 3) select 0;
banditUniforms pushBackUnique _uniform;
uniformsSDK pushBackUnique _uniform;
if (count _x > 1) then
	{
	_unit = _x select 1;
	_uniform = (getUnitLoadout _unit select 3) select 0;
	uniformsSDK pushBackUnique _uniform;
	};
} forEach [SDKSniper,SDKATman,SDKMedic,SDKMG,SDKExp,SDKGL,SDKMil,SDKSL,SDKEng,[SDKUnarmed],[staticCrewTeamPlayer]];
_checked = [];
{
{
_typeX = _x;
if !(_typeX in _checked) then
	{
	_checked pushBack _typeX;
	_loadout = getUnitLoadout _typeX;
	for "_i" from 0 to 2 do
		{
		_weapon = [((_loadout select _i) select 0)] call BIS_fnc_baseWeapon;
		if !(_weapon in weaponsCSAT) then {weaponsCSAT pushBack _weapon};
		};
	};
} forEach _x;
} forEach groupsCSATmid + [CSATSpecOp] + groupsCSATSquad;
_checked = [];
{
{
_typeX = _x;
if !(_typeX in _checked) then
	{
	_checked pushBack _typeX;
	_loadout = getUnitLoadout _typeX;
	for "_i" from 0 to 2 do
		{
		_weapon = [((_loadout select _i) select 0)] call BIS_fnc_baseWeapon;
		if !(_weapon in weaponsNato) then {weaponsNato pushBack _weapon};
		};
	};
} forEach _x;
} forEach groupsNATOmid + [NATOSpecOp] + groupsNATOSquad;

{
_nameX = [_x] call BIS_fnc_baseWeapon;
_magazines = getArray (configFile / "CfgWeapons" / _nameX / "magazines");
ammunitionNATO pushBack (_magazines select 0);
} forEach weaponsNato;
{
_nameX = [_x] call BIS_fnc_baseWeapon;
_magazines = getArray (configFile / "CfgWeapons" / _nameX / "magazines");
ammunitionCSAT pushBack (_magazines select 0);
} forEach weaponsCSAT;
//optic, pointer and flashlight automated detection
opticsAAF = [];
flashLights = [];
pointers = [];
{
{
_item = _x;
if !(_item in (opticsAAF + flashLights + pointers)) then
	{
	if (((_item call BIS_fnc_itemType) select 1) == "AccessorySights") then
		{
		opticsAAF pushBack _item
		}
	else
		{
		if (isClass (configfile >> "CfgWeapons" >> _item >> "ItemInfo" >> "FlashLight" >> "Attenuation")) then
			{
			flashLights pushBack _item;
			}
		else
			{
			if (isClass (configfile >> "CfgWeapons" >> "acc_pointer_IR" >> "ItemInfo" >> "Pointer")) then
				{
				pointers pushBack _item;
				};
			};
		};
	};
} forEach (_x call BIS_fnc_compatibleItems);

} forEach (weaponsNato + weaponsCSAT);
if (hasRHS) then
	{
	opticsAAF = opticsAAF select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
	flashlights = flashlights select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
	pointers = pointers select {getText (configfile >> "CfgWeapons" >> _x >> "author") == "Red Hammer Studios"};
	};
diag_log format ["%1: [Antistasi] | INFO | initVar | Assigning vehicle Types",servertime];
vehNormal = vehNATONormal + vehCSATNormal + [vehFIATruck,vehSDKTruck,vehSDKLightArmed,vehSDKBike,vehSDKRepair];
vehBoats = [vehNATOBoat,vehCSATBoat,vehSDKBoat];
vehAttack = vehNATOAttack + vehCSATAttack;
vehPlanes = vehNATOAir + vehCSATAir + [vehSDKPlane];
vehAttackHelis = vehCSATAttackHelis + vehNATOAttackHelis;
vehFixedWing = [vehNATOPlane,vehNATOPlaneAA,vehCSATPlane,vehCSATPlaneAA,vehSDKPlane];
vehUAVs = [vehNATOUAV,vehCSATUAV];
vehAmmoTrucks = [vehNATOAmmoTruck,vehCSATAmmoTruck];
vehAPCs = vehNATOAPC + vehCSATAPC;
vehTanks = [vehNATOTank,vehCSATTank];
vehTrucks = vehNATOTrucks + vehCSATTrucks + [vehSDKTruck,vehFIATruck];
vehAA = [vehNATOAA,vehCSATAA];
vehMRLS = [vehCSATMRLS, vehNATOMRLS];
vehTransportAir = vehNATOTransportHelis + vehCSATTransportHelis;
vehFastRope = ["O_Heli_Light_02_unarmed_F","B_Heli_Transport_01_camo_F","RHS_UH60M_d","RHS_Mi8mt_vdv","RHS_Mi8mt_vv","RHS_Mi8mt_Cargo_vv"];
vehUnlimited = vehNATONormal + vehCSATNormal + [vehNATORBoat,vehNATOPatrolHeli,vehCSATRBoat,vehCSATPatrolHeli,vehNATOUAV,vehNATOUAVSmall,NATOMG,NATOMortar,vehCSATUAV,vehCSATUAVSmall,CSATMG,CSATMortar];
sniperGroups = [groupsNATOSniper,groupsCSATSniper];
sniperUnits = ["O_T_Soldier_M_F","O_T_Sniper_F","O_T_ghillie_tna_F","O_V_Soldier_M_ghex_F","B_CTRG_Soldier_M_tna_F","B_T_soldier_M_F","B_T_Sniper_F","B_T_ghillie_tna_F"] + SDKSniper + [FIAMarksman,NATOMarksman,CSATMarksman];
if (hasRHS) then {sniperUnits = sniperUnits + ["rhsusf_socom_marsoc_sniper","rhs_vdv_marksman_asval"]};

arrayCivs = if (worldName == "Tanoa") then
	{
	["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_scientist_F","C_Orestes","C_Nikos","C_Nikos_aged","C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_man_sport_1_F_tanoan","C_man_sport_2_F_tanoan","C_man_sport_3_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan","C_Man_casual_6_F_tanoan"]
	}
else
	{
	if !(hasIFA) then
		{
		["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_scientist_F","C_Orestes","C_Nikos","C_Nikos_aged"];
		}
	else
		{
		["LIB_CIV_Assistant","LIB_CIV_Assistant_2","LIB_CIV_Citizen_1","LIB_CIV_Citizen_2","LIB_CIV_Citizen_3","LIB_CIV_Citizen_4","LIB_CIV_Citizen_5","LIB_CIV_Citizen_6","LIB_CIV_Citizen_7","LIB_CIV_Citizen_8","LIB_CIV_Doctor","LIB_CIV_Functionary_3","LIB_CIV_Functionary_2","LIB_CIV_Functionary_4","LIB_CIV_Villager_4","LIB_CIV_Villager_1","LIB_CIV_Villager_2","LIB_CIV_Villager_3","LIB_CIV_Woodlander_1","LIB_CIV_Woodlander_3","LIB_CIV_Woodlander_2","LIB_CIV_Woodlander_4","LIB_CIV_SchoolTeacher","LIB_CIV_SchoolTeacher_2","LIB_CIV_Rocker","LIB_CIV_Worker_3","LIB_CIV_Worker_1","LIB_CIV_Worker_4","LIB_CIV_Worker_2"]
		};
	};//array of possible civs. Only euro types picked (this is Greece). Add any civ classnames you wish here
//3CB Civ addition
if (has3CB) then {arrayCivs append ["UK3CB_CHC_C_BODYG","UK3CB_CHC_C_CAN","UK3CB_CHC_C_COACH","UK3CB_CHC_C_DOC","UK3CB_CHC_C_FUNC","UK3CB_CHC_C_HIKER","UK3CB_CHC_C_LABOUR","UK3CB_CHC_C_PILOT","UK3CB_CHC_C_POLITIC","UK3CB_CHC_C_PROF","UK3CB_CHC_C_VILL","UK3CB_CHC_C_WORKER"]};

civBoats = if !(hasIFA) then {["C_Boat_Civil_01_F","C_Scooter_Transport_01_F","C_Boat_Transport_02_F","C_Rubberboat"]} else {[]};
lamptypes = ["Lamps_Base_F", "PowerLines_base_F","Land_LampDecor_F","Land_LampHalogen_F","Land_LampHarbour_F","Land_LampShabby_F","Land_NavigLight","Land_runway_edgelight","Land_PowerPoleWooden_L_F"];
if !(hasIFA) then
	{
	arrayids = ["Anthis","Costa","Dimitirou","Elias","Gekas","Kouris","Leventis","Markos","Nikas","Nicolo","Panas","Rosi","Samaras","Thanos","Vega"];
	if (isMultiplayer) then {arrayids = arrayids + ["protagonista"]};
	};

//civUniforms = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1","U_C_Commoner1_2","U_C_Commoner1_3","U_Rangemaster","U_NikosBody","U_C_Poor_1","U_C_Poor_2","U_C_WorkerCoveralls","U_C_Poor_shorts_1","U_C_Commoner_shorts","U_C_ShirtSurfer_shorts","U_C_TeeSurfer_shorts_1","U_C_TeeSurfer_shorts_2","U_C_Man_casual_5_F","U_C_Man_casual_4_F","U_C_Man_casual_6_F","U_C_man_sport_3_F","U_C_man_sport_2_F","U_C_man_sport_1_F","U_C_Man_casual_2_F","U_C_Man_casual_1_F","U_C_Man_casual_3_F","U_Marshal"];
civUniforms = [];
{
_uniform = (getUnitLoadout _x select 3) select 0;
civUniforms pushBackUnique _uniform;
} forEach arrayCivs;


//All weapons, MOD ones included, will be added to this arrays, but it's useless without integration, as if those weapons don't spawn, players won't be able to collect them, and after, unlock them in the arsenal.

injuredSounds =
[
	"a3\sounds_f\characters\human-sfx\Person0\P0_moan_13_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_14_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_15_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_16_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_17_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_18_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_20_words.wss",
	"a3\sounds_f\characters\human-sfx\Person1\P1_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_20_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_21_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_22_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_23_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_24_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_25_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_26_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_27_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_28_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_29_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_30_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_31_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_32_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_33_words.wss",
	"a3\sounds_f\characters\human-sfx\Person2\P2_moan_19_words.wss"
];
medicAnims = ["AinvPknlMstpSnonWnonDnon_medic_1","AinvPknlMstpSnonWnonDnon_medic0","AinvPknlMstpSnonWnonDnon_medic1","AinvPknlMstpSnonWnonDnon_medic2"];

_getMissionPath = [] execVM "initGetMissionPath.sqf";
waitUntil
{
	if (scriptDone _getMissionPath) then {true} else
	{
		hint "Stuck on compiling missionPath, re-launch the mission.";
		false;
	}
};
hint "Done compiling missionPath";

ladridos = ["Music\dog_bark01.wss", "Music\dog_bark02.wss", "Music\dog_bark03.wss", "Music\dog_bark04.wss", "Music\dog_bark05.wss","Music\dog_maul01.wss","Music\dog_yelp01.wss","Music\dog_yelp02.wss","Music\dog_yelp03.wss"];

UPSMON_Bld_remove = ["Bridge_PathLod_base_F","Land_Slum_House03_F","Land_Bridge_01_PathLod_F","Land_Bridge_Asphalt_PathLod_F","Land_Bridge_Concrete_PathLod_F","Land_Bridge_HighWay_PathLod_F","Land_Bridge_01_F","Land_Bridge_Asphalt_F","Land_Bridge_Concrete_F","Land_Bridge_HighWay_F","Land_Canal_Wall_Stairs_F","warehouse_02_f","cliff_wall_tall_f","cliff_wall_round_f","containerline_02_f","containerline_01_f","warehouse_01_f","quayconcrete_01_20m_f","airstripplatform_01_f","airport_02_terminal_f","cliff_wall_long_f","shop_town_05_f","Land_ContainerLine_01_F"];
listMilBld = ["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_HelipadSquare_F"];
listbld = ["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F"];

if (!isServer and hasInterface) exitWith {};

AAFpatrols = 0;//0
reinfPatrols = 0;
smallCAmrk = [];
smallCApos = [];
bigAttackInProgress = false;
chopForest = false;
distanceForAirAttack = 10000;
distanceForLandAttack = if (hasIFA) then {5000} else {3000};
diag_log format ["%1: [Antistasi] | INFO | initVar | Setting Vehicle Spawn Points.",servertime];
if (worldName == "Tanoa") then
	{
	roadsMrk = ["road","road_1","road_2","road_3","road_4","road_5","road_6","road_7","road_8","road_9","road_10","road_11","road_12","road_13","road_14","road_15","road_16"];
	roadsCentral = ["road","road_1","road_2","road_3","road_4"];
	roadsCE = ["road_5","road_6"];
	roadsCSE = ["road_7"];
	roadsSE = ["road_8","road_9","road_10","road_11"];
	roadsSW = ["road_12"];
	roadsCW = ["road_13","road_14"];
	roadsNW = ["road_15"];
	roadsNE = ["road_16"];
	roadsX setVariable ["airport",[[[6988.38,7135.59,10.0673],17.0361,"MG"],[[6873.83,7472,3.19066],262.634,"MG"],[[6902.09,7427.71,13.0559],359.999,"MG"],[[6886.75,7445.52,0.0368803],360,"Mort"],[[6888.47,7440.31,0.0368826],0.000531628,"Mort"],[[6882.14,7445.42,0.0368817],360,"Mort"],[[6886.49,7436.58,0.0368807],360,"Mort"],[[6970.32,7188.49,-0.0339937],359.999,"Tank"],[[6960.98,7188.49,-0.0339937],359.999,"Tank"],[[6950.71,7187.42,-0.033505],359.999,"Tank"]]];

    roadsX setVariable ["airport_1",[[[2175.14,13402.4,-0.01863],138.861,"Tank"],[[2183.31,13409.7,-0.0184679],139.687,"Tank"],[[2211.39,13434.4,0.0164337],141.512,"Tank"],[[2221.62,13440.6,0.016408],142.886,"Tank"],[[2221.31,13195,0.0368757],0.000337857,"Mort"],[[2224.09,13197.6,0.038271],1.30051e-005,"Mort"],[[2218.96,13199.1,0.0382385],0.00923795,"Mort"],[[2071.1,13308.5,14.4943],133.738,"MG"]]];

    roadsX setVariable ["airport_2",[[[11803,13051.6,0.0368805],360,"Mort"],[[11813.5,13049.2,0.0368915],0.000145629,"Mort"],[[11799.5,13043.2,0.0368919],360,"Mort"],[[11723.3,13114.6,18.1545],300.703,"MG"],[[11782.3,13058.1,0.0307827],19.6564,"Tank"],[[11810.6,13040.2,0.0368905],360,"Tank"],[[11832.9,13042.1,0.0283785],16.3683,"Tank"]]];
    roadsX setVariable ["airport_3",[[[11658,3055.02,0.036881],360,"Mort"],[[11662.6,3060.14,0.0368819],0.000294881,"Mort"],[[11664.8,3049.94,0.0368805],360,"Mort"],[[11668.9,3055.64,0.0368805],2.08056e-005,"Mort"],[[11747.8,2982.95,18.1513],249.505,"MG"],[[11784.1,3132.77,0.183631],214.7,"Tank"],[[11720.3,3176.15,0.112019],215.055,"Tank"]]];
    roadsX setVariable ["airport_4",[[[2092.87,3412.98,0.0372648],0.00414928,"Mort"],[[2091.5,3420.69,0.0369596],360,"Mort"],[[2099.93,3422.53,0.0373936],0.00215797,"Mort"],[[2100.13,3416.28,0.0394554],0.0043371,"Mort"],[[2198.24,3471.03,18.0123],0.00187816,"MG"],[[2133.01,3405.88,-0.0156536],315.528,"Tank"],[[2145.82,3416.83,-0.00544548],316.441,"Tank"],[[2163.9,3432.18,-0.0256157],318.777,"Tank"]]];
	}
else
	{
	if (worldName == "Altis") then
		{
		roadsMrk = ["road","road_1","road_2","road_3","road_4","road_5","road_6","road_7","road_8","road_9","road_10","road_11","road_12","road_13","road_14","road_15","road_16","road_17","road_18","road_19","road_20","road_21","road_22","road_23","road_24","road_25","road_26","road_27","road_28","road_29","road_30","road_31","road_32","road_33","road_34","road_35","road_36","road_37","road_38","road_39","road_40","road_41","road_42"];
		{_x setMarkerAlpha 0} forEach roadsMrk;
		roadsX setVariable ["airport",[[[21175.06,7369.336,0],62.362,"Tank"],[[21178.89,7361.573,0.421],62.36,"Tank"],[[20961.332,7295.678,0],0,"Mort"],[[20956.143,7295.142,0],0,"Mort"],[[20961.1,7290.02,0.262632],0,"Mort"]]];
        roadsX setVariable ["airport_1",[[[23044.8,18745.7,0.0810001],88.275,"Tank"],[[23046.8,18756.8,0.0807302],88.275,"Tank"],[[23214.8,18859.5,0],267.943,"Tank"],[[22981.2,18903.9,0],0,"Mort"],[[22980.1,18907.5,0.553066],0,"Mort"]]];
        roadsX setVariable ["airport_2",[[[26803.1,24727.7,0.0629988],359.958,"Mort"],[[26809,24728.2,0.03755],359.986,"Mort"],[[26815.2,24729,0.0384922],359.972,"Mort"],[[26821.3,24729.1,0.0407047],359.965,"Mort"],[[26769.1,24638.7,0.290344],131.324,"Tank"],[[26774.2,24643.9,0.282555],134.931,"Tank"]]];
        roadsX setVariable ["airport_3",[[[14414.9,16327.8,-0.000991821],207.397,"Tank"],[[14471.9,16383.2,0.0378571],359.939,"Mort"],[[14443,16379.2,0.0369205],359.997,"Mort"],[[14449.4,16376.9,0.0369892],359.996,"Mort"],[[14458,16375.9,0.0369167],359.997,"Mort"],[[14447.2,16397.1,3.71081],269.525,"MG"],[[14472.3,16312,12.1993],317.315,"MG"],[[14411,16229,0.000303268],40.6607,"Tank"],[[14404.4,16235,-0.0169964],50.5741,"Tank"],[[14407.2,16331.7,0.0305004],204.588,"Tank"]]];
        roadsX setVariable ["airport_4",[[[11577.4,11953.6,0.241838],122.274,"Tank"],[[11577.8,11964.3,0.258125],124.324,"Tank"],[[11633.3,11762,0.0372791],359.996,"Mort"],[[11637.3,11768.1,0.043232],0.0110098,"Mort"],[[11637.1,11763.1,0.0394402],0.00529677,"Mort"]],true];
        roadsX setVariable ["airport_5",[[[9064.02,21531.3,0.00117016],138.075,"Tank"],[[9095.12,21552.8,0.614614],157.935,"Tank"],[[9030.28,21531.1,0.261349],157.935,"Mort"],[[9033.91,21534.7,0.295588],157.935,"Mort"]]];
		}
	else
		{
		roadsMrk = ["road","road_1","road_2","road_3","road_4","road_5","road_6","road_7","road_8","road_9","road_10","road_11","road_12","road_13","road_14","road_15","road_16","road_17","road_18","road_19","road_20","road_21","road_22","road_23","road_24","road_25","road_26","road_27","road_28","road_29","road_30","road_31","road_32","road_33","road_34","road_35","road_36","road_37","road_38"];
		{_x setMarkerAlpha 0} forEach roadsMrk;
		roadsX setVariable ["airport",[[[12191.2,12605.8,9.43077],0,"MG"],[[12194.2,12599.4,13.3954],0,"AA"],[[12141,12609,0.00088501],0,"Mort"],[[12144.3,12615.9,0],0,"Mort"],[[12156.5,12614.3,0],0,"Mort"],[[12170,12595.9,0.000305176],250.234,"AT"],[[12070.4,12656,0.0098114],23.5329,"Tank"],[[12022.5,12670.9,0.0098114],18.9519,"Tank"]]];
        roadsX setVariable ["airport_1",[[[4782.75,10251.4,18],0,"AA"],[[4716.17,10215.3,13.1149],278.308,"AA"],[[4713.94,10209.3,9.12177],188.973,"MG"],[[4787.34,10248.9,4.99982],188.303,"MG"],[[4740.75,10333.2,20.3206],232.414,"MG"],[[4818.39,10200.1,0.00982666],239.625,"Tank"],[[4765.22,10330.8,0],0,"Mort"],[[4758.21,10328.1,0],0,"Mort"],[[4751.45,10324.4,0],0,"Mort"],[[4745.39,10320.6,0],0,"Mort"],[[4739.97,10283.2,0.00567627],291.41,"AT"],[[4814.19,10245.1,0.00567627],211.414,"AT"],[[4841.34,10158.9,0.0102844],240.137,"Tank"],[[4865.7,10116.7,0.00970459],239.499,"Tank"],[[4888.33,10074.2,0.00982666],235.077,"Tank"]]];
        roadsX setVariable ["airport_2",[[[4717.95,2595.24,12.9766],0,"AA"],[[4714.27,2590.97,8.97349],176.197,"MG"],[[4743.55,2567.69,0.0130215],207.155,"Tank"],[[4775.62,2547.37,0.00691605],210.579,"Tank"],[[4719.88,2582.34,0.00566483],261.79,"AT"],[[4826.5,2558.35,0.00150108],0,"Mort"],[[4821.12,2550.32,0.00147152],0,"Mort"],[[4816.59,2543.65,0.00147247],0,"Mort"],[[4812.77,2518.77,0.00566483],150.397,"AT"]]];
		};
	};
listMilBld = ["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_HelipadSquare_F"];
listbld = ["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F"];
swoopShutUp = ["V_RebreatherIA","G_Diving"];
difficultyCoef = if !(isMultiplayer) then {0} else {floor ((({side group _x == teamPlayer} count playableUnits) - ({side group _x != teamPlayer} count playableUnits)) / 5)};
if (side (group petros) == west) then {swoopShutUp pushBack "U_B_Wetsuit"} else {swoopShutUp pushBack "U_I_Wetsuit"};

//Pricing values for soldiers, vehicles
if (!isServer) exitWith {};
diag_log format ["%1: [Antistasi] | INFO | initVar | Building Pricelist.",servertime];
{server setVariable [_x,50,true]} forEach SDKMil;
{server setVariable [_x,75,true]} forEach (sdkTier1 - SDKMil);
{server setVariable [_x,100,true]} forEach  sdkTier2;
{server setVariable [_x,150,true]} forEach sdkTier3;
//{timer setVariable [_x,0,true]} forEach (vehAttack + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA,vehCSATPlane,vehCSATPlaneAA] + vehCSATAttackHelis + vehAA + vehMRLS);
{timer setVariable [_x,3,true]} forEach [staticATOccupants,staticAAOccupants];
{timer setVariable [_x,6,true]} forEach [staticATInvaders,staticAAInvaders];
{timer setVariable [_x,0,true]} forEach vehNATOAPC;
{timer setVariable [_x,10,true]} forEach vehCSATAPC;
timer setVariable [vehNATOTank,0,true];
timer setVariable [vehCSATTank,10,true];
timer setVariable [vehNATOAA,0,true];
timer setVariable [vehCSATAA,3,true];
timer setVariable [vehNATOBoat,3,true];
timer setVariable [vehCSATBoat,3,true];
timer setVariable [vehNATOPlane,0,true];
timer setVariable [vehCSATPlane,10,true];
timer setVariable [vehNATOPlaneAA,0,true];
timer setVariable [vehCSATPlaneAA,10,true];
{timer setVariable [_x,1,true]} forEach vehNATOTransportHelis - [vehNATOPatrolHeli];
{timer setVariable [_x,10,true]} forEach vehCSATTransportHelis - [vehCSATPatrolHeli];
{timer setVariable [_x,0,true]} forEach vehNATOAttackHelis;
{timer setVariable [_x,10,true]} forEach vehCSATAttackHelis;
timer setVariable [vehNATOMRLS,0,true];
timer setVariable [vehCSATMRLS,5,true];


server setVariable [civCar,200,true];//200
server setVariable [civTruck,600,true];//600
server setVariable [civHeli,5000,true];//5000
server setVariable [civBoat,200,true];//200
server setVariable [vehSDKBike,50,true];//50
server setVariable [vehSDKLightUnarmed,200,true];//200
server setVariable [vehSDKTruck,300,true];//300
{server setVariable [_x,700,true]} forEach [vehSDKLightArmed,vehSDKAT];
{server setVariable [_x,400,true]} forEach [SDKMGStatic,vehSDKBoat,vehSDKRepair];//400
{server setVariable [_x,800,true]} forEach [SDKMortar,staticATteamPlayer,staticAAteamPlayer];//800
server setVariable ["hr",8,true];//initial HR value
server setVariable ["resourcesFIA",1000,true];//Initial FIA money pool value
skillFIA = 0;//Initial skill level for FIA soldiers
prestigeNATO = 5;//Initial Prestige NATO
prestigeCSAT = 5;//Initial Prestige CSAT
prestigeOPFOR = 50;//Initial % support for NATO on each city
if (not cadetMode) then {prestigeOPFOR = 75};//if you play on vet, this is the number
prestigeBLUFOR = 0;//Initial % FIA support on each city
countCA = 600;//600
bombRuns = 0;
cityIsSupportChanging = false;
resourcesIsChanging = false;
savingServer = false;
revealX = false;
prestigeIsChanging = false;
markersChanging = [];
staticsToSave = [];
napalmCurrent = false;
tierWar = 1;
haveRadio = false;
haveNV = false;
zoneCheckInProgress = false;
garrisonIsChanging = false;
playerHasBeenPvP = [];
missionsX = []; publicVariable "missionsX";
movingMarker = false;
if !(hasIFA) then
	{
	unlockedItems = unlockedItems + ["ItemMap","ItemWatch","ItemCompass","FirstAidKit","Medikit","ToolKit","H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_grn","H_Booniehat_dirty","H_Cap_oli","H_Cap_blk","H_MilCap_rucamo","H_MilCap_gry","H_BandMask_blk","H_Bandanna_khk","H_Bandanna_gry","H_Bandanna_camo","H_Shemag_khk","H_Shemag_tan","H_Shemag_olive","H_ShemagOpen_tan","H_Beret_grn","H_Beret_grn_SF","H_Watchcap_camo","H_TurbanO_blk","H_Hat_camo","H_Hat_tan","H_Beret_blk","H_Beret_red","H_Watchcap_khk","G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_beast","G_Tactical_Black","G_Aviator","G_Shades_Black","acc_flashlight"] + uniformsSDK + civUniforms;//Initial Arsenal available items
	if (side group petros == independent) then {unlockedItems pushBack "I_UavTerminal"} else {unlockedItems pushBack "B_UavTerminal"};
	}
else
	{
	unlockedItems = unlockedItems + ["ItemMap","ItemWatch","ItemCompass","FirstAidKit","Medikit","ToolKit","LIB_ToolKit","H_LIB_CIV_Villager_Cap_1","H_LIB_CIV_Worker_Cap_2","G_LIB_Scarf2_B","G_LIB_Mohawk"] + uniformsSDK + civUniforms;
	};


diag_log format ["%1: [Antistasi]: initVar | Setting Default Arsenal Unlocks.",servertime];
//The following are the arrays used for arsenal unlocks in the templates
/*
unlockedWeapons = [];
unlockedRifles = [];
unlockedMagazines = [];
initialRifles = [];
unlockedAT = [];
unlockedItems = [];
unlockedBackpacks = [];
*/

unlockedOptics = [];
unlockedMG = [];
unlockedGL = [];
unlockedSN = [];
unlockedAA = [];
garageIsUsed = false;
vehInGarage = [];
destroyedBuildings = []; //publicVariable "destroyedBuildings";
reportedVehs = [];
hasACRE = false;
hasACE = false;
hasACEhearing = false;
hasACEMedical = false;

//ACE detection and ACE item availability in Arsenal
	aceItems = [
		"ACE_EarPlugs",
		"ACE_RangeCard",
		"ACE_Clacker",
		"ACE_M26_Clacker",
		"ACE_DeadManSwitch",
		"ACE_DefusalKit",
		"ACE_MapTools",
		"ACE_Flashlight_MX991",
		"ACE_wirecutter",
		"ACE_RangeTable_82mm",
		"ACE_EntrenchingTool",
		"ACE_Cellphone",
		"ACE_CableTie",
		"ACE_SpottingScope",
		"ACE_Tripod",
		"ACE_Chemlight_HiWhite",
		"ACE_Chemlight_HiRed",
		"ACE_Kestrel4500",
		"ACE_ATragMX",
		"ACE_acc_pointer_green",
		"ACE_HandFlare_White",
		"ACE_HandFlare_Red",
		"ACE_Spraypaintred"
	];
	if (hasIFA) then {aceItems append ["ACE_LIB_LadungPM","ACE_SpareBarrel"]};
	publicVariable "aceItems";

	aceBasicMedItems = [
		"ACE_fieldDressing",
		"ACE_bloodIV_500",
		"ACE_bloodIV",
		"ACE_epinephrine",
		"ACE_morphine",
		"ACE_bodyBag"
	]; publicVariable "aceBasicMedItems";

	aceAdvMedItems = [
		"ACE_elasticBandage",
		"ACE_quikclot",
		"ACE_bloodIV_250",
		"ACE_packingBandage",
		"ACE_personalAidKit",
		"ACE_plasmaIV",
		"ACE_plasmaIV_500",
		"ACE_plasmaIV_250",
		"ACE_salineIV",
		"ACE_salineIV_500",
		"ACE_salineIV_250",
		"ACE_surgicalKit",
		"ACE_tourniquet",
		"ACE_adenosine",
		"ACE_atropine",
		"adv_aceSplint_splint",
		"adv_aceCPR_AED"
	]; publicVariable "aceAdvMedItems";


if (!isNil "ace_common_fnc_isModLoaded") then {
	unlockedItems = unlockedItems + aceItems;
	if !(hasIFA) then
		{
		unlockedBackpacks pushBackUnique "ACE_TacticalLadder_Pack";
		unlockedWeapons pushBackUnique "ACE_VMH3";
		itemsAAF = itemsAAF + ["ACE_Kestrel4500","ACE_ATragMX"];
		weaponsNato = weaponsNato + ["ACE_M84"];
		};
	hasACE = true;
	if (isClass (configFile >> "CfgSounds" >> "ACE_EarRinging_Weak")) then {
		hasACEhearing = true;
	};
	if (isClass (ConfigFile >> "CfgSounds" >> "ACE_heartbeat_fast_3")) then {
		if (ace_medical_level == 1) then {
			hasACEMedical = true;
			unlockedItems = unlockedItems + aceBasicMedItems;
		};
	};

	if (isClass (ConfigFile >> "CfgSounds" >> "ACE_heartbeat_fast_3")) then {
		if (ace_medical_level == 2) then {
			hasACEMedical = true;
			unlockedItems = unlockedItems + aceBasicMedItems + aceAdvMedItems;
		};
	};
};
if (isClass(configFile >> "cfgPatches" >> "acre_main")) then
	{
	hasACRE = true;
	haveRadio = true;
	unlockedItems = unlockedItems + ["ACRE_PRC343","ACRE_PRC148","ACRE_PRC152","ACRE_PRC77","ACRE_PRC117F"];
	};

//allItems = allItems + itemsAAF + opticsAAF + _vests + helmets + NVGoggles;

if (worldName == "Tanoa") then
	{
	{server setVariable [_x select 0,_x select 1]} forEach [["Lami01",277],["Lifou01",350],["Lobaka01",64],["LaFoa01",38],["Savaka01",33],["Regina01",303],["Katkoula01",413],["Moddergat01",195],["Losi01",83],["Tanouka01",380],["Tobakoro01",45],["Georgetown01",347],["Kotomo01",160],["Rautake01",113],["Harcourt01",325],["Buawa01",44],["SaintJulien01",353],["Balavu01",189],["Namuvaka01",45],["Vagalala01",174],["Imone01",31],["Leqa01",45],["Blerick01",71],["Yanukka01",189],["OuaOue01",200],["Cerebu01",22],["Laikoro01",29],["Saioko01",46],["Belfort01",240],["Oumere01",333],["Muaceba01",18],["Nicolet01",224],["Lailai01",23],["Doodstil01",101],["Tavu01",178],["Lijnhaven01",610],["Nani01",19],["PetitNicolet01",135],["PortBoise01",28],["SaintPaul01",136],["Nasua01",60],["Savu01",184],["Murarua01",258],["Momea01",159],["LaRochelle01",532],["Koumac01",51],["Taga01",31],["Buabua01",27],["Penelo01",189],["Vatukoula01",15],["Nandai01",130],["Tuvanaka01",303],["Rereki01",43],["Ovau01",226],["IndPort01",420],["Ba01",106]];
	call compile preprocessFileLineNumbers "roadsDB.sqf";
	}
else
	{
	if (worldName == "Altis") then
		{
		call compile preprocessFileLineNumbers "roadsDBAltis.sqf";
		{server setVariable [_x select 0,_x select 1]} forEach [["Therisa",154],["Zaros",371],["Poliakko",136],["Katalaki",95],["Alikampos",115],["Neochori",309],["Stavros",122],["Lakka",173],["AgiosDionysios",84],["Panochori",264],["Topolia",33],["Ekali",9],["Pyrgos",531],["Orino",45],["Neri",242],["Kore",133],["Kavala",660],["Aggelochori",395],["Koroni",32],["Gravia",291],["Anthrakia",143],["Syrta",151],["Negades",120],["Galati",151],["Telos",84],["Charkia",246],["Athira",342],["Dorida",168],["Ifestiona",48],["Chalkeia",214],["AgiosKonstantinos",39],["Abdera",89],["Panagia",91],["Nifi",24],["Rodopoli",212],["Kalithea",36],["Selakano",120],["Frini",69],["AgiosPetros",11],["Feres",92],["AgiaTriada",8],["Paros",396],["Kalochori",189],["Oreokastro",63],["Ioannina",48],["Delfinaki",29],["Sofia",179],["Molos",188]];
		}
	else
		{
		if (worldName == "chernarus_summer") then
			{
			call compile preprocessFileLineNumbers "roadsDBcherna.sqf";
			{server setVariable [_x select 0,_x select 1]} forEach [["vill_NovySobor",129],["city_StarySobor",149],["vill_Guglovo",26],["vill_Vyshnoye",41],["vill_Kabanino",86],["vill_Rogovo",66],["vill_Mogilevka",104],["city_Gorka",115],["vill_Grishino",168],["vill_Shakhovka",55],["vill_Pogorevka",57],["vill_Pulkovo",26],["vill_Nadezhdino",109],["city_Vybor",180],["vill_Polana",118],["vill_Staroye",115],["vill_Dubrovka",86],["vill_Pustoshka",163],["vill_Kozlovka",100],["vill_Pusta",52],["vill_Dolina",83],["vill_Gvozdno",78],["vill_Prigorodki",145],["vill_Drozhino",58],["vill_Sosnovka",54],["vill_Msta",96],["vill_Lopatino",159],["city_Zelenogorsk",280],["vill_Orlovets",65],["city_Berezino",340],["vill_Myshkino",49],["vill_Petrovka",45],["city_Chernogorsk",761],["vill_Bor",46],["vill_Nizhnoye",146],["vill_Balota",147],["vill_Khelm",110],["city_Krasnostav",194],["vill_Komarovo",127],["city_Elektrozavodsk",745],["city_Solnychniy",224],["vill_Kamyshovo",196],["vill_Tulga",35],["vill_Pavlovo",99],["vill_Kamenka",127],["hill_Olsha",20]];
			};
		};
	};

if (isDedicated) then {civPerc = 70; publicVariable "civPerc"};

diag_log format ["%1: [Antistasi] | INFO | initVar | Storing variables.",servertime];

publicVariable "unlockedWeapons";
publicVariable "unlockedRifles";
publicVariable "unlockedItems";
publicVariable "unlockedOptics";
publicVariable "unlockedBackpacks";
publicVariable "unlockedMagazines";
publicVariable "garageIsUsed";
publicVariable "vehInGarage";
publicVariable "reportedVehs";
publicVariable "hasACE";
publicVariable "hasTFAR";
publicVariable "hasACRE";
publicVariable "hasACEhearing";
publicVariable "hasACEMedical";
publicVariable "revealX";
publicVariable "prestigeNATO";
publicVariable "prestigeCSAT";
publicVariable "skillFIA";
publicVariable "staticsToSave";
publicVariable "bombRuns";
publicVariable "chopForest";
publicVariable "napalmCurrent";
publicVariable "tierWar";
publicVariable "haveRadio";
publicVariable "haveNV";
publicVariable "unlockedMG";
publicVariable "unlockedGL";
publicVariable "unlockedSN";
publicVariable "unlockedAT";
publicVariable "unlockedAA";
publicVariable "initialRifles";

if (isMultiplayer) then {[[petros,"hint","Variables Init Completed"],"A3A_fnc_commsMP"] call BIS_fnc_MP;};
diag_log format ["%1: [Antistasi] | INFO | initVar Completed.",servertime];
