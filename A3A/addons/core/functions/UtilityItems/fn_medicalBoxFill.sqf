/*
Function: A3A_fnc_medicalBoxFill
Author: Killerswin2
    handles filling a vanilla medical supply box
Arguments:
    [object] - _box that will be filled 
Return Value:
    [nil]
Scope: Clients
Environment: Unscheduled
Public: No
Dependencies: 
Example:
    [] call A3A_fnc_medicalBox; 
*/

params  [
    ["_box", objNull, [objNull]]
];

clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box addItemCargoGlobal ["FirstAidKit", 100];