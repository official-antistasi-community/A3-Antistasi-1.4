//WS - ws_ifv.hpp

//Marshall
//Ion
class B_ION_APC_Wheeled_01_command_lxWS;
class B_ION_APC_Wheeled_01_cannon_lxWS;
//NATO
class APC_Wheeled_01_command_base_lxWS;
class B_T_APC_Wheeled_01_command_lxWS;

//Iskatel/Kamysh
//Arid
class O_APC_Tracked_02_30mm_lxWS;
//Tropical
class O_T_APC_Tracked_02_30mm_lxWS;
//SFIA
class O_SFIA_APC_Tracked_02_30mm_lxWS;
class O_SFIA_APC_Tracked_02_cannon_lxWS;
//ION
class a3a_ION_APC_Tracked_02_30mm : O_APC_Tracked_02_30mm_lxWS
{
    side = 1;
    crew = "B_ION_Soldier_lxWS";
    faction = "BLU_ION_lxWS";
    animationList[] = {"showTracks",1,"showCamonetHull",0,"showBags",0.2,"showSLATHull",1};
    textureList[] = {"Grey", 1};
    hiddenSelectionsTextures[] = {"lxWS\vehicles_1_f_lxws\APC_Tracked_02\data\APC_Tracked_02_ext_01_black_CO.paa","lxWS\vehicles_1_f_lxws\APC_Tracked_02\data\APC_Tracked_02_ext_02_black_CO.paa","lxWS\vehicles_1_f_lxws\APC_Tracked_02\data\APC_Tracked_02_ext_03_black_CO.paa","lxWS\vehicles_1_f_lxws\APC_Tracked_02\data\APC_Tracked_02_30mm_black_co.paa","A3\Armor_F\Data\camonet_CSAT_Stripe_Desert_CO.paa","lxWS\vehicles_1_f_lxws\APC_Tracked_02\data\cage_black_CO.paa"};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
