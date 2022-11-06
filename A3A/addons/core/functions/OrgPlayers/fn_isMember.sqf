if !(membershipEnabled) exitWith {true};

params ["_player"];
// Remote-controlled AI unit is not a member
if (_player getVariable ["owner", _player] != _player) exitWith {false};

// Original player unit can be a member
private _uid = _player getVariable ["A3A_playerUID", getPlayerUID _player]
private _isMember = _uid in membersX;

//if admin and not member, add as temp member
if !(_isMember && {call A3A_fnc_getAdmin isEqualTo _player}) then {
    membersX pushBackUnique _uid;
    _player setVariable ["eligible", true, true];
    publicVariable "membersX";
    _isMember = true;
};

_isMember
