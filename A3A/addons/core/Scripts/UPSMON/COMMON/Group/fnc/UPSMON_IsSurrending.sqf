
private ["_grp","_dist","_ratio","_supstatus","_unitsneedammo","_typeofgrp","_haslos"];

_grp = _this select 0;
_dist = _this select 1;
_ratio = _this select 2;
_supstatus = _this select 3;
_unitsneedammo = _this select 4;
_typeofgrp = _this select 5;
_haslos = _this select 6;


If (_grp getvariable ["UPSMON_Grpmission",""] != "RETREAT") then
{
	If (UPSMON_SURRENDER) then
	{
		If ((random 100) <= (call (compile format ["UPSMON_%1_SURRENDER",(_grp getvariable ["UPSMON_Origin",[]]) select 5]))) then
		{
			If (!("air" in _typeofgrp)) then
			{
				If (_ratio > 2 || ((count units _grp) == count _unitsneedammo) || (_supstatus != "")) then
				{
					If (_supstatus == "SUPRESSED") then
					{
						If (_dist < 300) then
						{
							If (_haslos) then
							{
								_grp setvariable ["UPSMON_Grpmission","SURRENDER"];
								_grpstatus = "BLUE";
							};						
						};
					};
				};
			};
		};
	};
};