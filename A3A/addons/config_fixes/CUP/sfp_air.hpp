//CUP-SFP - sfp_air.hpp
class CUP_Uh60S_Base;
class CUP_B_UH60S_USN : CUP_Uh60S_Base{
	class EventHandlers;
};
class CUP_UH60_Unarmed_Base;
class CUP_MH60S_Unarmed_USN : CUP_UH60_Unarmed_Base{
	class EventHandlers;
};
class CUP_MH60S_Unarmed_FFV_Base;
class CUP_MH60S_Unarmed_FFV_USN : CUP_MH60S_Unarmed_FFV_Base{
	class EventHandlers;
};

class a3a_SFP_B_UH60S_USN : CUP_B_UH60S_USN
{
    displayName = "UH-60M (M3M)";
    textureList[] = {"Black", 1};
    animationList[] = {"Navyclan_hide",1,"Navyclan2_hide",1,"Filters_Hide",1,"mainRotor_folded",1,"mainRotor_unfolded",0,"Hide_ESSS2x",1,"Hide_ESSS4x",1,"Hide_Nose",0,"Blackhawk_Hide",0,"Hide_FlirTurret",1,"Hide_Probe",1,"Doorcock_Hide",0};
	class EventHandlers : EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class a3a_SFP_MH60S_Unarmed_USN : CUP_MH60S_Unarmed_USN
{
    displayName = "UH-60M (Unarmed)";
    textureList[] = {"Black", 1};
    animationList[] = {"Navyclan_hide",1,"Navyclan2_hide",1,"Filters_Hide",1,"mainRotor_folded",1,"mainRotor_unfolded",0,"Hide_ESSS2x",1,"Hide_ESSS4x",1,"Hide_Nose",0,"Blackhawk_Hide",0,"Hide_FlirTurret",0,"Hide_Probe",1,"Doorcock_Hide",0};
	class EventHandlers : EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};
class a3a_SFP_MH60S_Unarmed_FFV_USN : CUP_MH60S_Unarmed_FFV_USN
{
    displayName = "UH-60M (Unarmed/FFV)";
    textureList[] = {"Black", 1};
    animationList[] = {"Navyclan_hide",1,"Navyclan2_hide",1,"Filters_Hide",1,"mainRotor_folded",1,"mainRotor_unfolded",0,"Hide_ESSS2x",1,"Hide_ESSS4x",1,"Hide_Nose",0,"Blackhawk_Hide",0,"Hide_FlirTurret",0,"Hide_Probe",1,"Doorcock_Hide",0};
	class EventHandlers : EventHandlers
	{
        fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
        init = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
};