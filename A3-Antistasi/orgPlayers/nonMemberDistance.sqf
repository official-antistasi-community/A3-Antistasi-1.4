_cuenta = 61;
while {!([player] call A3A_fnc_isMember)} do
	{
	_playerMembers = playableUnits select {([_x] call A3A_fnc_isMember) and (side group _x == buenos)};
	if !(_playerMembers isEqualTo []) then
		{
		if (player distance2D (getMarkerPos respawnBuenos) > memberDistance) then
			{
			_closestMember = [_playerMembers,player] call BIS_fnc_nearestPosition;
			if (player distance2d _closestMember > memberDistance) then
				{
				_cuenta = _cuenta - 1;
				}
			else
				{
				_cuenta = 61
				};
			}
		else
			{
			_cuenta = 61;
			};
		}
	else
		{
		_cuenta = 61;
		};
	if (_cuenta != 61) then
		{
		hint format ["You have to get closer to the HQ or the closest server member in %1 seconds. \n\n After this timeout you will be teleported to your HQ",_cuenta];
		sleep 1;
		if (_cuenta == 0) then {player setPos (getMarkerPos respawnBuenos)};
		}
	else
		{
		sleep 60;
		};
	};