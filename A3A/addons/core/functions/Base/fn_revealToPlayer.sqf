if (isDedicated) exitWith {};
private ["_LeaderX"];
if (count _this == 0) then
	{
	while {revealX} do
		{
		if (player == leader group player) then
			{
			if ([player] call A3A_fnc_hasRadio) then
				{
				{
				_LeaderX = leader _x;
				if (((side _LeaderX == Invaders) or (side _LeaderX == Occupants)) and (vehicle _LeaderX != _LeaderX) and (player knowsAbout _LeaderX < 1.5)) then
					{
					player reveal [_LeaderX,4];
					sleep 1;
					};
				} forEach allGroups;
				};
			};
		sleep 10;
		};
	}
else
	{
	private ["_groupX"];
	if (player == leader group player) then
		{
		_groupX = _this select 0;
		_LeaderX = leader _groupX;
		player reveal [_LeaderX,4];
		};
	};