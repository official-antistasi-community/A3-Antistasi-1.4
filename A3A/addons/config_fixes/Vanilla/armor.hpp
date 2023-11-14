//Vanilla - armor.hpp

class Wheeled_APC_F;
class Tank_F;
class APC_Wheeled_02_base_F;
class APC_Wheeled_03_base_F;
class O_APC_Tracked_02_base_F;

//Slat Cages
class APC_Wheeled_02_base_v2_F : APC_Wheeled_02_base_F
{
    animationList[] = {"showBags",0.2,"showCanisters",0.2,"showTools",0.2,"showCamonetHull",0,"showSLATHull",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class APC_Wheeled_01_base_F : Wheeled_APC_F
{
    animationList[] = {"showBags",0.5,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class AFV_Wheeled_01_base_F : Wheeled_APC_F
{
    animationList[] = {"showCamonetHull",0,"showCamonetCannon",0,"showCamonetTurret",0,"showSLATHull",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class O_APC_Tracked_02_cannon_F : O_APC_Tracked_02_base_F
{
    animationList[] = {"showTracks",0.5,"showCamonetHull",0,"showBags",0.5,"showSLATHull",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class I_APC_Wheeled_03_base_F : APC_Wheeled_03_base_F
{
    animationList[] = {"showCamonetHull",0,"showBags",0.3,"showBags2",0.3,"showTools",0.3,"showSLATHull",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class APC_Tracked_03_base_F : Tank_F
{
    animationList[] = {"showBags",0.3,"showBags2",0.3,"showCamonetHull",0,"showCamonetTurret",0,"showTools",0.3,"showSLATHull",1,"showSLATTurret",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};

class I_MRAP_03_F;
class I_MRAP_03_gmg_F;
class I_MRAP_03_hmg_F;
class O_MBT_04_cannon_F;
class O_MBT_04_command_F;

//Grey
class a3a_MRAP_03_grey_F : I_MRAP_03_F
{ 
    hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
};
class a3a_MRAP_03_gmg_grey_F : I_MRAP_03_gmg_F
{ 
    hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
};
class a3a_MRAP_03_hmg_grey_F : I_MRAP_03_hmg_F
{ 
    hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
};

//Olive
class a3a_APC_Wheeled_03_cannon_blufor_F : a3a_APC_Wheeled_03_cannon_F
{
    textureList[] = {};
    hiddenSelectionsTextures[] = {"a3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_CO.paa","a3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext2_CO.paa","a3\armor_f_gamma\APC_Wheeled_03\data\RCWS30_CO.paa","a3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_alpha_CO.paa","a3\armor_f\data\camonet_aaf_fia_desert_co.paa","a3\armor_f\data\cage_sand_co.paa"};
};

//Black
class a3a_MBT_04_cannon_black_F : O_MBT_04_cannon_F
{
    textureList[] = {};
    hiddenSelectionsTextures[] = {"a3\armor_f_tank\mbt_04\data\mbt_04_exterior_1_co.paa","a3\armor_f_tank\mbt_04\data\mbt_04_exterior_2_co.paa","a3\armor_f\data\camonet_csat_stripe_desert_co.paa"};
};
class a3a_MBT_04_command_black_F : O_MBT_04_command_F
{
    textureList[] = {};
    hiddenSelectionsTextures[] = {"a3\armor_f_tank\mbt_04\data\mbt_04_exterior_1_co.paa","a3\armor_f_tank\mbt_04\data\mbt_04_exterior_2_co.paa","a3\armor_f\data\camonet_csat_stripe_desert_co.paa"};
};
