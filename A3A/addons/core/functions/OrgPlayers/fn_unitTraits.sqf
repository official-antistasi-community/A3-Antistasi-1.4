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
if(roleDescription player == "Default Commander") then
{
    //Same values as teamleader
    player setUnitTrait ["camouflageCoef",0.8];
    player setUnitTrait ["audibleCoef",0.8];
    player setUnitTrait ["loadCoef",1.4];
    player setUnitTrait ["medic", true];
	player setUnitTrait ["engineer", true];
    _text = "Commander role.<br/><br/>The commander is a lightweight unit with increased camouflage, medical and engineering capabilities.";
}
else
{
    switch (_type) do
    {
    	//cases for greenfor missions
    	case "I_G_medic_F":  {_text = "Medic role.<br/><br/>Medics do not have any bonus or penalties, but have the ability to use certain medical items for full health restoration."}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_TL_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = "Teamleader role.<br/><br/>Teamleader are more lightweight units with increased camouflage capabilities."}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_F":  {player setUnitTrait ["UAVHacker",true]; _text = "Rifleman role.<br/><br/>Riflemen do not have any bonus or penalties but can hack drones."}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_GL_F": {player setUnitTrait ["camouflageCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = "Grenadier role.<br/><br/>Grenadiers have a slight bonus on carry capacity, but are easy to spot."}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_AR_F": {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = "Autorifleman role.<br/><br/>Autoriflemen have a slight bonus on carry capacity, but make too much noise when they move."}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_engineer_F":  {_text = "Engineer role.<br/><br/>Engineers do not have any bonus or penalties, but have the ability to use Repair Kits for vehicle repair."}; //reintroduced - 8th January 2020, Bob Murphy
    };
};

_text spawn {
	sleep 5;
    [localize "STR_A3A_Unit_Traits_title", format [localize "STR_A3A_Unit_Traits_selected_trait", _this]] call A3A_fnc_customHint;
};
