/*
Function: A3A_fnc_medicalBox
Author: Killerswin2
    handles buying a medical supply box
Arguments:
    [none]
Return Value:
    [nil]
Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 
Example:
    [] call A3A_fnc_medicalBox; 
*/
#include "..\..\script_component.hpp"

if(A3A_hasACE) then {
	[player, FactionGet(reb,"vehicleMedicalBox") # 0, FactionGet(reb,"vehicleMedicalBox") # 1, [['A3A_fnc_initMovableObject', true], ['A3A_Logistics_fnc_addLoadAction', false]]] call A3A_fnc_buyItem;
} else 
{
	[player, FactionGet(reb,"vehicleMedicalBox") # 0, FactionGet(reb,"vehicleMedicalBox") # 1, [['A3A_fnc_initMovableObject', true], ['A3A_Logistics_fnc_addLoadAction', false], ['A3A_fnc_medicalBoxFill', false]]] call A3A_fnc_buyItem;
};