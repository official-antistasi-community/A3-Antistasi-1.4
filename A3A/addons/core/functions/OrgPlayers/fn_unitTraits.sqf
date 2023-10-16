/*
Author: Barbolani
Maintainer: DoomMetal, MeltedPixel, Bob-Murphy, Wurzel0701
    Sets the units traits (camouflage, medic, engineer) for the selected role of the player
    THIS FILE DEPENDS ON ONLY THE DEFAULT COMMANDER HAVING A ROLE DESCRIPTION!

Arguments:
    <NULL>

Return Value:
    <NULL>

Scope: Local
Environment: Any
Public: No
Dependencies:
    <NULL>

Example:
    [] spawn A3A_fnc_unitTraits;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _type = typeOf player;
private _text = "";
private _titleStr = localize "STR_A3A_fn_orgp_unitTraits_titel";

if(roleDescription player == "Default Commander") then
{
    //Same values as teamleader
    player setUnitTrait ["camouflageCoef",0.8];
    player setUnitTrait ["audibleCoef",0.8];
    player setUnitTrait ["loadCoef",1.4];
    player setUnitTrait ["medic", true];
	player setUnitTrait ["engineer", true];
    _text = localize "STR_A3A_fn_orgp_unitTraits_commander1" + "<br/>" + localize "STR_A3A_fn_orgp_unitTraits_commander2";
}
else
{
    switch (_type) do
    {
    	//cases for greenfor missions
    	case "I_G_medic_F":  {_text = localize "STR_A3A_fn_orgp_unitTraits_medic1" + "<br/>" + localize "STR_A3A_fn_orgp_unitTraits_medic2"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_TL_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = localize "STR_A3A_fn_orgp_unitTraits_teamllead1" + "<br/>" + localize "STR_A3A_fn_orgp_unitTraits_teamllead2"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_F":  {player setUnitTrait ["UAVHacker",true]; _text = localize "STR_A3A_fn_orgp_unitTraits_rifle1" + "<br/>" + localize "STR_A3A_fn_orgp_unitTraits_rifle2"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_GL_F": {player setUnitTrait ["camouflageCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = localize "STR_A3A_fn_orgp_unitTraits_grenadier1" + "<br/>" + localize "STR_A3A_fn_orgp_unitTraits_grenadier2"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_AR_F": {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = localize "STR_A3A_fn_orgp_unitTraits_autorifle1" + "<br/>" + localize "STR_A3A_fn_orgp_unitTraits_autorifle2"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_engineer_F":  {_text = localize "STR_A3A_fn_orgp_unitTraits_engi1" + "<br/>" + localize "STR_A3A_fn_orgp_unitTraits_engi2"}; //reintroduced - 8th January 2020, Bob Murphy
 };
};

if (isMultiPlayer) then
{
	sleep 5;
	[_titleStr, format [localize "STR_A3A_fn_orgp_unitTraits_you",_text]] call A3A_fnc_customHint;
};
