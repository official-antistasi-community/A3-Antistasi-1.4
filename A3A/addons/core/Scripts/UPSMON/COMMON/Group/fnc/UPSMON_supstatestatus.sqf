/****************************************************************
File: UPSMON_supstatestatus.sqf
Author: Azroul13

Description:
	Check if the group is under fire
	Activated only when TPWCAS script is present 
Parameter(s):
	<--- unit
Returns:
	Boolean
****************************************************************/
	//Check if the group is under fire
private ["_grp","_supstatus","_unitsnbr","_tpwcas_running","_statuslist"];

_grp = _this select 0;
_supstatus = "";

_unitsnbr = count (units _grp);
_tpwcas_running = if (!isNil "tpwcas_running") then {true} else {false};
_statuslist = [];
{
	If (alive _x) then
	{
		_x setvariable ["UPSMON_SUPSTATUS",""];
		If (_x in UPSMON_GOTHIT_ARRAY) then
		{
			UPSMON_GOTHIT_ARRAY = UPSMON_GOTHIT_ARRAY - [_x];
			If (damage _x < 0.3) then
			{
				_statuslist pushback "hit";
			}
			else
			{
				_statuslist pushback "wounded";
			};
			
			_x setvariable ["UPSMON_SUPSTATUS","UNDERFIRE"];
		};
		
		if (_tpwcas_running) then
		{
			If (_x getvariable "tpwcas_supstate" == 3) then 
			{
				_statuslist pushback "supressed";
				_x setvariable ["UPSMON_SUPSTATUS","SUPRESSED"];
			};
			If (_x getvariable "tpwcas_supstate" == 2) then 
			{
				_statuslist pushback "hit";
				_x setvariable ["UPSMON_SUPSTATUS","UNDERFIRE"];
			};
		};
		
		If (isNil "bdetect_enable") then
		{ 
			If (_x getVariable ["bcombat_suppression_level", 0] >= 20 && _x getVariable ["bcombat_suppression_level", 0] < 75) then
			{
				_statuslist pushback "hit";
				_x setvariable ["UPSMON_SUPSTATUS","UNDERFIRE"];
			};
			If (_x getVariable ["bcombat_suppression_level", 0] >= 75) then
			{
				_statuslist pushback "supressed";
				_x setvariable ["UPSMON_SUPSTATUS","SUPRESSED"];
			};
		};
	}
	else
	{
		if (_x in UPSMON_GOTKILL_ARRAY) then
		{
			UPSMON_GOTKILL_ARRAY = UPSMON_GOTKILL_ARRAY - [_x];
			_statuslist pushback "dead";
		};
	};
} foreach units _grp;

If ({_x == "supressed" || _x == "wounded" ||  _x == "dead"} count _statuslist >= _unitsnbr) then
{
	If ({_x == "supressed"} count _statuslist < {_x == "wounded" || _x == "dead"} count _statuslist) then
	{
		_supstatus = "INCAPACITED"
	}
	else
	{
		_supstatus = "SUPRESSED"
	};
};

If (_supstatus == "") then
{
	If ("hit" in _statuslist || "wounded" in _statuslist || "dead" in _statuslist || "supressed" in _statuslist) then
	{
		_supstatus = "UNDERFIRE"
	};
};

_supstatus