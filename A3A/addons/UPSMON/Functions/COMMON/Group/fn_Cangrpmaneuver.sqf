
private ["_grp","_nowp","_attackpos","_typeofgrp","_maneuver"];

_grp = _this select 0;
_nowp = _this select 1;
_attackpos = _this select 2;
_typeofgrp = _this select 3;

_maneuver = false;

If (!_nowp) then
{
	If (count _attackpos > 0) then
	{
		If (!("static" in _typeofgrp)) then
		{
			If (!("arti" in _typeofgrp)) then
			{
				If (!("supply" in _typeofgrp)) then
				{
					If (_grp getvariable ["UPSMON_TIMEORDER",time] <= time) then
					{
						If (_grp getvariable ["UPSMON_Grpmission",""] != "TRANSPORT") then
						{
							_maneuver = true;
						};
					};
				};
			};
		};
	};
};

_maneuver;