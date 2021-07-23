/*
Maintainer: Caleb Serafin
    If the current player is not a member, it will loop every 60 seconds to check the distance from the player to HQ or any member.
    However, if there are no members online, it will allow the player unlimited distance from HQ.
    If there is a member online, it will warn the player and begin a 61 second countdown

Return Value:
    <ANY> Undefined

Scope: Clients, Global Effect
Environment: Scheduled
Public: No (Only spawned once in initClient)
Dependencies:
    <SCALAR> memberDistance
    <SIDE> teamPlayer

Example:
    [] spawn A3A_fnc_memberLeash;
*/

#define INITIAL_COUNT_TIME 61

_countX = INITIAL_COUNT_TIME;
while {!([player] call A3A_fnc_isMember)} do
	{
	_playerMembers = (call A3A_fnc_playableUnits) select {([_x] call A3A_fnc_isMember) and (side group _x == teamPlayer)};
	if !(_playerMembers isEqualTo []) then
		{
		if (player distance2D (getMarkerPos respawnTeamPlayer) > memberDistance) then
			{
			_closestMember = [_playerMembers,player] call BIS_fnc_nearestPosition;
			if (player distance2d _closestMember > memberDistance) then
				{
				_countX = _countX - 1;
				}
			else
				{
				_countX = INITIAL_COUNT_TIME;
				};
			}
		else
			{
			_countX = INITIAL_COUNT_TIME;
			};
		}
	else
		{
		_countX = INITIAL_COUNT_TIME;
		};
	if (_countX != INITIAL_COUNT_TIME) then
		{
		["Member Distance", format ["You have to get closer to the HQ or the closest server member in %1 seconds. <br/><br/> After this timeout you will be teleported to your HQ", _countX]] call A3A_fnc_customHint;
		sleep 1;
		if (_countX == 0) then
			{
			private _possibleVehicle = vehicle player;
			if (_possibleVehicle != player && (driver _possibleVehicle) == player) then
				{
				[_possibleVehicle] call A3A_fnc_teleportVehicleToBase;
				};
			player setPos (getMarkerPos respawnTeamPlayer);
			};
		}
	else
		{
		sleep 60;
		};
	};
