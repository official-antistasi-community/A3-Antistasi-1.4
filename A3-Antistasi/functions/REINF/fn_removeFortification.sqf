/*
    Author: killerswin2
    Description:
        trys the remove fortifications 

    Arguments:
    0. <Object>  fortification that we will try to remove
    1. <Object>  player that wants to remove fortification

    Return Value:
    <nil>

    Scope: Client
    Environment: scheduled
    Public: yes
    Dependencies:

    Example:
        [cursorObject, player] call A3A_fnc_removefortification;
*/


params[["_veh", objNull, [objNull]], ["_player", objNull, [objNull]]];

//check if constructing
if (_player getVariable ["deconstructing", false]) exitwith {};
_player setVariable ["deconstructing", true];
_veh setVariable ["deconstructing", true, true];

private _lockOutTime = time + 30;

_player playMoveNow selectRandom medicAnims;
_player addEventHandler ["AnimDone",{
    params["_engineer", "_anim"]; //person doing animation
    if (!(_anim in medicAnims)) then {
        _engineer playMoveNow selectRandom medicAnims;
     }; 
	if (([_engineer] call A3A_fnc_canFight) and !(_engineer getVariable ["helping",false]) and !(_engineer getVariable ["rearming",false]) and (_engineer getVariable ["deconstructing",false])) then {
		_engineer playMoveNow selectRandom medicAnims;
	} else {
		_engineer removeEventHandler ["AnimDone",_thisEventHandler];
	};
}];

waitUntil  {sleep 1; !([_player] call A3A_fnc_canFight) or (_player getVariable ["helping",false]) or (_player getVariable ["rearming",false]) or (_player distance _veh > 4) or (time > _lockOutTime)};

_player setVariable ["deconstructing",false];

if (time <= _lockOutTime) exitWith {[localize "STR_A3A_Deconstruct_fortification_Hint_Title", localize "STR_A3A_Deconstruct_fortification_Cancelled"] call A3A_fnc_customHint;};

//clean up and be done.
[localize "STR_A3A_Deconstruct_fortification_Hint_Title", localize "STR_A3A_Deconstruct_fortification_Done"] call A3A_fnc_customHint;
tempMedAnimationBecauseArmaLowerCasesFromAnimationState = nil;
_veh setVariable ["deconstructing", false, true];
staticsToSave deleteAt (staticsToSave find _veh);
publicVariable "staticsToSave";
deleteVehicle _veh;