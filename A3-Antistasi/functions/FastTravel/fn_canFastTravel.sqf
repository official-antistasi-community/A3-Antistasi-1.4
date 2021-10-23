/*
Maintainer: DoomMetal
    Checks if the player or a high command group is able to fast travel at all
    and gives a reason if not.

Arguments:
    <UNIT/GROUP> The unit group to check fast travel for, player is default

Return Value:
    ARRAY<BOOL, STRING> Returns true and "" if able to FT, false and reason if not

Scope: Local
Environment: Any
Public: Yes
Dependencies:
    None

Example:
    [] call A3A_fnc_canFastTravel; // [true, ""] or [false,"Reasons"]
*/

#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

params [["_group", player]];

// TODO: check if _group is actually a group or player

// High Command groups
private _groupX = grpNull;
private _isHighCommandGroup = false;
if (count hcSelected player > 1) exitWith {[false, "You can only fast travel single high command groups"];}; // TODO: not needed
if (count hcSelected player == 1) then {_groupX = hcSelected player select 0; _isHighCommandGroup = true} else {_groupX = group player}; // TODO: needs change

// private _checkForPlayer = false;
// if ((!_isHighCommandGroup) and limitedFT) then {_checkForPlayer = true};
private _boss = leader _groupX;

if ((_boss != player) and (!_isHighCommandGroup)) then {_groupX = player};

// No high command groups commanded by players
if (({isPlayer _x} count units _groupX > 1) and (_isHighCommandGroup)) exitWith {
    [false, "You can not fast travel High Command groups commanded by players"];
};

// No FT while controlling AI
if (player != player getVariable ["owner",player]) exitWith {
    [false, "You can not fast travel while you are controlling AI"];
};

// No FT while in friendly fire jail
if (!isNil "A3A_FFPun_Jailed" && {(getPlayerUID player) in A3A_FFPun_Jailed}) exitWith {
    [false, "You can not fast travel while in friendly fire punishment"];
};

private _distanceX = 500; // Distance for enemies near check
private _result = [true, ""];
// Reduce enemies near distance if fog, was commented out before refactor so didn't touch it
//_distanceX = 500 - (([_boss,false] call A3A_fnc_fogCheck) * 450);
{
    // Enemies near
    if ([_x,_distanceX] call A3A_fnc_enemyNearCheck) exitWith {
        _result = [false, "You can not fast travel with enemies near the group"];
    };

    // If unit is in a vehicle
    if (vehicle _x != _x) then {
        // No tow ropes
        if !((vehicle _x getVariable "SA_Tow_Ropes") isEqualTo objNull) exitWith {
            _result = [false, "You can not fast travel with your tow rope out or a vehicle attached"];
        };
        // No boats
        if ((typeOf (vehicle _x)) isKindOf "Ship") exitWith {
            _result = [false, "You can not fast travel while any group members are in a boat"];
        };
        // No static weapons
        if ((typeOf (vehicle _x)) isKindOf "StaticWeapon") exitWith {
            _result = [false, "You can not fast travel with group members in a static weapon"];
        };
        // No vehicles without drivers
        if (isNull (driver vehicle _x)) exitWith {
            _result = [false, "You do not have a driver in all the groups vehicles"];
        };
        // No immobile vehicles
        if (!canMove vehicle _x) exitWith {
            _result = [false, "You can not fast travel if your vehicle immobile"];
        };
    };
} forEach units _groupX;

_result;
