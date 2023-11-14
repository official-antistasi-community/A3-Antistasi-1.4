//Vanilla - ifv.hpp

//Marshall
class B_APC_Wheeled_01_cannon_F;
class B_T_APC_Wheeled_01_cannon_F;
class a3a_B_APC_Wheeled_01_cannon_F : B_APC_Wheeled_01_cannon_F
{
    animationList[] = {"showBags",0.5,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class a3a_B_T_APC_Wheeled_01_cannon_F : B_T_APC_Wheeled_01_cannon_F
{
    animationList[] = {"showBags",0.5,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};

//Rhino
class B_AFV_Wheeled_01_cannon_F;
class B_T_AFV_Wheeled_01_cannon_F;
class a3a_AFV_Wheeled_01_cannon_F : B_AFV_Wheeled_01_cannon_F
{
    animationList[] = {"showCamonetHull",0,"showCamonetCannon",0,"showCamonetTurret",0,"showSLATHull",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class a3a_T_AFV_Wheeled_01_cannon_F :  B_T_AFV_Wheeled_01_cannon_F
{
    animationList[] = {"showCamonetHull",0,"showCamonetCannon",0,"showCamonetTurret",0,"showSLATHull",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};

//Gorgon
class I_APC_Wheeled_03_cannon_F;
class a3a_APC_Wheeled_03_cannon_F : I_APC_Wheeled_03_cannon_F
{
    animationList[] = {"showCamonetHull",0,"showBags",0.3,"showBags2",0.3,"showTools",0.3,"showSLATHull",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};

//Mora
class I_APC_tracked_03_cannon_F;
class I_E_APC_tracked_03_cannon_F;
class a3a_APC_tracked_03_cannon_F : I_APC_tracked_03_cannon_F
{
    animationList[] = {"showBags",0.3,"showBags2",0.3,"showCamonetHull",0,"showCamonetTurret",0,"showTools",0.3,"showSLATHull",1,"showSLATTurret",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class a3a_E_APC_tracked_03_cannon_F : I_E_APC_tracked_03_cannon_F
{
    animationList[] = {"showBags",0.3,"showBags2",0.3,"showCamonetHull",0,"showCamonetTurret",0,"showTools",0.3,"showSLATHull",1,"showSLATTurret",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};

//Marid
class O_APC_Wheeled_02_rcws_v2_F;
class O_T_APC_Wheeled_02_rcws_v2_ghex_F;
class a3a_APC_Wheeled_02_rcws_v2_F : O_APC_Wheeled_02_rcws_v2_F
{
    animationList[] = {"showBags",0.2,"showCanisters",0.2,"showTools",0.2,"showCamonetHull",0,"showSLATHull",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class a3a_T_APC_Wheeled_02_rcws_v2_F : O_T_APC_Wheeled_02_rcws_v2_ghex_F
{
    animationList[] = {"showBags",0.2,"showCanisters",0.2,"showTools",0.2,"showCamonetHull",0,"showSLATHull",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};

//Kamysh
class O_APC_Tracked_02_cannon_F;
class O_T_APC_Tracked_02_cannon_ghex_F;
class a3a_APC_Tracked_02_cannon_F : O_APC_Tracked_02_cannon_F
{
    animationList[] = {"showTracks",0.5,"showCamonetHull",0,"showBags",0.5,"showSLATHull",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class a3a_T_APC_Tracked_02_cannon_F : O_T_APC_Tracked_02_cannon_ghex_F
{
    animationList[] = {"showTracks",0.5,"showCamonetHull",0,"showBags",0.5,"showSLATHull",1};
	class EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};