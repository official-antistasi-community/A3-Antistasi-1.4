/****************************************************************
File: UPSMON_SetRenfParam.sqf
Author: Azroul13

Description:
	
Parameter(s):
	<--- _grp
	<--- UPSMON parameters
Returns:

****************************************************************/
private[];	

_grp = _this select 0;
_Ucthis = _this select 1;

// set If enemy detected reinforcements will be sent REIN1
_rfid = ["REINFORCEMENT:",0,_UCthis] call UPSMON_getArg; // rein_#
_reinforcement= if ("REINFORCEMENT" in _UCthis) then {"REINFORCEMENT"} else {"NOREINFORCEMENT"}; //rein_yes

If (_rfid > 0 || "REINFORCEMENT" in _UCthis) then
{
	_grp setvariable ["UPSMON_Reinforcement",true];
	_grp setvariable ["UPSMON_ReinforcementSent",false];
	
	If ("REINFORCEMENT" in _UCthis) then
	{
		switch (side _grp) do 
		{
			case West: 
			{
				UPSMON_REINFORCEMENT_WEST_UNITS pushback _grp;
				PublicVariable "UPSMON_REINFORCEMENT_WEST_UNITS";		
			};
			case EAST: 
			{
				UPSMON_REINFORCEMENT_EAST_UNITS pushback _grp;
				PublicVariable "UPSMON_REINFORCEMENT_EAST_UNITS";	
			};
			case RESISTANCE: 
			{
				UPSMON_REINFORCEMENT_GUER_UNITS pushback _grp;
				PublicVariable "UPSMON_REINFORCEMENT_GUER_UNITS";			
			};
		};
	}
	else
	{
		_grp setvariable ["UPSMON_Rfid",_rfid];
	};
};

