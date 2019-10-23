if !(_this in vehUnlimited) then
	{
	_cant = timer getVariable _this;
	if !(isNil _cant) then
		{
		if !(_cant isEqualType 0) then {_cant = 1};
		timer setVariable [_this,_cant -1,true];
		}
	else
		{
		if !(_this in vehUnlimited) then
			{
			timer setVariable [_this,0,true];
			};
		};