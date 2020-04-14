if !(membershipEnabled) exitWith {["Membership", "Server Member feature is disabled"] call A3A_fnc_customHint;};
private ["_countX"];
_textX = "In Game Members<br/><br/>";
_countN = 0;

{
_playerX = _x getVariable ["owner",objNull];
if (!isNull _playerX) then
	{
	//_uid = getPlayerUID _playerX;
	if ([_playerX] call A3A_fnc_isMember) then {_textX = format ["%1%2<br/>",_textX,name _playerX]} else {_countN = _countN + 1};
	};
} forEach (call A3A_fnc_playableUnits);

_textX = format ["%1<br/>No members:<br/>%2",_textX,_countN];

["Membership", _textX] call A3A_fnc_customHint;