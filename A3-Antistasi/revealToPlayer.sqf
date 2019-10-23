if (isDedicated) exitWith {};
private ["_lider"];
if (count _this == 0) then
	{
	while {revelar} do
		{
		if (player == leader group player) then
			{
			if ([player] call A3A_fnc_hasRadio) then
				{
				{
				_lider = leader _x;
				if (((side _lider == muyMalos) or (side _lider == malos)) and (vehicle _lider != _lider) and (player knowsAbout _lider < 1.5)) then
					{
					player reveal [_lider,4];
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
	private ["_grupo"];
	if (player == leader group player) then
		{
		_grupo = _this select 0;
		_lider = leader _grupo;
		player reveal [_lider,4];
		};
	};