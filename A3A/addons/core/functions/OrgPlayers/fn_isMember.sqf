if !(membershipEnabled) exitWith {true};

params ["_player"];
// Remote-controlled AI unit is not a member
if (_player getVariable ["owner", _player] != _player) exitWith {false};
(_player getVariable ["A3A_playerUID", getPlayerUID _player]) in membersX;
