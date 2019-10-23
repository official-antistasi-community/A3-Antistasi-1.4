private ["_unit"];

_unit = _this select 0;

_result = false;

if (haveRadio) then
	{
	_result = true;
	}
else
	{
	if ("ItemRadio" in assignedItems _unit) then
		{
		_result = true
		}
	else
		{
		if (hayIFA) then
			{
			{if (typeOf _x in SDKGL) exitWith {_result = true}} forEach (units (group _unit));
			};
		};
	};
_result