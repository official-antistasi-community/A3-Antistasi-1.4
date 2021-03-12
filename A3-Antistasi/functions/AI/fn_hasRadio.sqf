private ["_unit"];

_unit = _this select 0;

_result = false;

if (haveRadio) then
	{
	_result = true;
	}
else
	{
	if (_unit call A3A_fnc_getRadio != "") then
		{
		_result = true
		}
	else
		{
		if (A3A_hasIFA) then
			{
			{if ((_x getVariable "unitType") in SDKGL) exitWith {_result = true}} forEach (units (group _unit));
			};
		};
	};
_result