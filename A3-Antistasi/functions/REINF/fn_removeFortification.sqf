/*
    Author: [killerswin2]
    [Description]
        trys the remove fortifications 

    Arguments:
    0. <Object> Crate to loot to
    1. <Object>    Client ID

    Return Value:
    <nil>

    Scope: Client
    Environment: Any
    Public: [yes]
    Dependencies:

    Example:
        [_this # 0, _this # 1] call A3A_fnc_removefortification;
*/


params[["_veh", objNull, [objNull]], ["_player", objNull, [objNull]]];

private _lockOutTime = time + 30;

_player playMoveNow selectRandom medicAnims;
_player setVariable ["constructing", true];

_player addEventHandler ["AnimDone",{
	private _engineer = _this # 0; //person doing
	if (([_engineer] call A3A_fnc_canFight) and !(_engineer getVariable ["helping",false]) and !(_engineer getVariable ["rearming",false]) and (_engineer getVariable ["constructing",false])) then {
		_engineer playMoveNow selectRandom medicAnims;
	} else {
		_engineer removeEventHandler ["AnimDone",_thisEventHandler];
	};
}];

waitUntil  {sleep 5; !([_player] call A3A_fnc_canFight) or (_player getVariable ["helping",false]) or (_player getVariable ["rearming",false]) or (_player distance _veh > 4) or (time > _lockOutTime)};

_player setVariable ["constructing",false];

if (time <= _lockOutTime) exitWith {[localize "STR_A3A_Deconstruct_fortification_Hint_Title", localize "STR_A3A_Deconstruct_fortification_Cancelled"] call A3A_fnc_customHint;};

[localize "STR_A3A_Deconstruct_fortification_Hint_Title", localize "STR_A3A_Deconstruct_fortification_Done"] call A3A_fnc_customHint;
deleteVehicle _veh;