params ["_group", "_supportTypes", "_target"];

/*  Simulates the call for support by a group by making the teamleader a bit more dumb for a time

    Execution on: HC or Server

    Scope: Internal

    Params:
        _group: GROUP : The group which should call support
        _supportTypes: ARRAY of STRINGs : The types of support the group calls for
        _target: OBJECT : The target object the group wants support against

    Returns:
        Nothing
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _groupLeader = leader _group;

if(side _group == teamPlayer) exitWith
{
    Error_1("Rebel group %1 managed to call callForSupport, not allowed for rebel groups", _group);
};

if((_group getVariable ["canCallSupportAt", -1]) > (dateToNumber date)) exitWith {};

//Block the group from calling support again
private _date = date;
_date set [4, (_date select 4) + 5];
private _dateNumber = dateToNumber _date;
_group setVariable ["canCallSupportAt", _dateNumber, true];

//If groupleader is down, dont call support
if !([_groupLeader] call A3A_fnc_canFight) exitWith {};

Debug_4("Leader of %1 (side %2) is starting to call for help against %3 with helps %4", _group, side _group, _target, _supportTypes);

//Lower skill of group leader to simulate radio communication (!!!Barbolanis idea!!!)
private _oldSkill = skill _groupLeader;
_groupLeader setSkill (_oldSkill - 0.2);

//Wait for the call to happen
private _timeToCallSupport = 10 + random 5;
sleep _timeToCallSupport;

//Reset leader skill
_groupLeader setSkill _oldSkill;

//If the group leader survived the call, proceed
if([_groupLeader] call A3A_fnc_canFight) then
{
    private _revealed = [getPos _groupLeader, side _group] call A3A_fnc_calculateSupportCallReveal;
    //Starting the support
    Debug_3("%1 managed to call help against %2, reveal value is %3", _group, _target, _revealed);
    [_target, _group knowsAbout _target, _supportTypes, side _group, _revealed] remoteExec ["A3A_fnc_sendSupport", 2];
}
else
{
    //Support call failed, resetting cooldown
    Debug_1("%1 got no help as the leader is dead or down", _group);
    _group setVariable ["canCallSupportAt", -1, true];
};
