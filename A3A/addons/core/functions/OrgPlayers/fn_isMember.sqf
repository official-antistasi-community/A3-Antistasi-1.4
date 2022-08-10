params ["_player"];
// Remote-controlled AI unit is not a member
if (_player getVariable ["owner", _player] != _player) exitWith {false}; 
if !(membershipEnabled) exitWith {true};
// Original player unit can be a member
_player getVariable ["playerUID", getPlayerUID _player] in membersX;
