if (worldName != "Tanoa") exitWith {true};

private _site1 = _this select 0;
private _posSite1 = if (_site1 isEqualType "") then {getMarkerPos _site1} else {_this select 0};

private _site2 = _this select 1;
private _posSite2 = if (_site2 isEqualType "") then {getMarkerPos _site2} else {_this select 1};

private _return = false;
if (_posSite1 distance getMarkerPos "island" <= 5500) then
	{
	if (_posSite2 distance getMarkerPos "island" <= 5500) then {_return = true};
	}
else
	{
	if (_posSite1 distance getMarkerPos "island_1" <= 2000) then
		{
		if (_posSite2 distance getMarkerPos "island_1" <= 2000) then {_return = true}
		}
	else
		{
		if (_posSite1 distance getMarkerPos "island_2" <= 2000) then
			{
			if (_posSite2 distance getMarkerPos "island_2" <= 2000) then {_return = true}
			}
		else
			{
			if (_posSite1 distance getMarkerPos "island_3" <= 3000) then
				{
				if (_posSite2 distance getMarkerPos "island_3" <= 3000) then {_return = true}
				}
			else
				{
				if (_posSite1 distance getMarkerPos "island_4" <= 2500) then
					{
					if (_posSite2 distance getMarkerPos "island_4" <= 2500) then {_return = true};
					};
				};
			};
		};
	};
_return