//needs to be run on units when theyre created to disable joinGroup and leaveGroup
params ["_unit"];
if !(hasAce) exitWith {};
private _fileName = "initAceTeamManagement";

[typeOf _unit, 0,["ACE_MainActions", "ACE_JoinGroup"]] call ace_interact_menu_fnc_removeActionFromClass;
[typeOf _unit, 1,["ACE_SelfActions", "ACE_TeamManagement", "ACE_LeaveGroup"]] call ace_interact_menu_fnc_removeActionFromClass;

