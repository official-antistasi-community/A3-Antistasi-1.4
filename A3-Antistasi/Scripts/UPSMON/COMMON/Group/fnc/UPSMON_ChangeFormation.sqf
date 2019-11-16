/****************************************************************
File: UPSMON_SetStances.sqf
Author: Azroul13

Description:

Parameter(s):

Returns:

****************************************************************/

private ["_grp","_supstatus","_attackpos","_dist","_terrainscan","_haslos","_time"];

_grp = _this select 0;
_supstatus = _this select 1;
_attackpos = _this select 2;
_dist = _this select 3;
_terrainscan = _this select 4;
_haslos = _this select 5;
_typeofgrp = _this select 6;

If (!(_grp getvariable ["UPSMON_haschangedformation",false])) then
{
	_grp setvariable ["UPSMON_haschangedformation",true];
	If ("air" in _typeofgrp) then
	{
		If ((Speedmode _grp) != "FULL") then
		{
			_grp setspeedmode "FULL";
		};
	}
	else
	{
		If (_supstatus != "SUPRESSED") then
		{
			If (count _attackpos > 0) then
			{
				If (_dist > 500 || !_haslos) then
				{
					If (vehicle (leader _grp) == (leader _grp)) then
					{
						If ((Speedmode _grp) != "NORMAL") then
						{
							_grp setspeedmode "NORMAL";
						};
						If (_dist < 200) then
						{
							If ((Formation _grp) != "LINE") then
							{
								_grp setformation "LINE";
							};
						}
						else
						{
							If ((Formation _grp) != "STAG COLUMN") then
							{
								_grp setformation "STAG COLUMN";
							};
						};
					};
				}
				else
				{
					If (_dist > 150) then
					{
						If (!(Behaviour (leader _grp) in ["COMBAT","STEALTH"])) then
						{
							_grp setBehaviour "COMBAT";
						};
					
						If ((Formation _grp) != "WEDGE") then
						{
							_grp setformation "WEDGE";
						};
					};
				
					If (_dist <= 150) then
					{
						If ((_terrainscan select 0) == "forest" || (_terrainscan select 0) == "inhabited") then
						{				
							If ((Speedmode _grp) != "LIMITED") then
							{
								_grp setspeedmode "LIMITED";
							};
						
							if ((_terrainscan select 0) == "inhabited") then
							{
								If ((_terrainscan select 1) > 230) then
								{
									If ((Formation _grp) != "STAG COLUMN") then
									{
										_grp setformation "STAG COLUMN";
									};
								};
							};
						};
						
						If ((_terrainscan select 0) == "meadow") then
						{
							If ((Speedmode _grp) != "FULL") then
							{
								_grp setspeedmode "FULL";
							};
							If ((Formation _grp) != "LINE") then
							{
								_grp setformation "LINE";
							};							
						};
					};
				};
			};
		}
		else
		{
			If (_supstatus != "") then
			{
				If ((behaviour (leader _grp)) != "COMBAT") then
				{
					(leader _grp) setbehaviour "COMBAT";
				};
		
				If ((_terrainscan select 0) == "meadow") then
				{
					If (Speedmode _grp != "NORMAL") then
					{
						_grp setspeedmode "NORMAL";
					};
				};
		
				If ((_terrainscan select 0) == "forest" || (_terrainscan select 0) == "inhabited") then
				{
					If ((Speedmode _grp) != "LIMITED") then
					{
						_grp setspeedmode "LIMITED";
					};
			
					If ((Formation _grp) != "DIAMOND") then
					{
						_grp setformation "DIAMOND";
					};			
				};
			}
			else
			{
				If ((Speedmode _grp) != "LIMITED") then
				{
					_grp setSpeedmode "LIMITED";
				};	
				
				If ((Behaviour (leader _grp)) != "STEALTH") then
				{
					_grp setBehaviour "STEALTH";
				};
			};
		};
	};
};

[_grp] spawn 
{
	private ["_grp"];
	
	_grp = _this select 0;
	
	sleep 20;
	If (!IsNull _grp) then
	{
		_grp setvariable ["UPSMON_haschangedformation",false];
	};
};