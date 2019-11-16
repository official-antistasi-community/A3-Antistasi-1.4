/****************************************************************
File: UPSMON_timeloop.sqf
Author: CarlGustav

Description:

Parameter(s):

Returns:

****************************************************************/

private ["_lat","_day","_hour","_sunangle","_Night"];

_Night = false;
_lat = -1 * getNumber(configFile >> "CfgWorlds" >> worldName >> "latitude");
_day = 360 * (dateToNumber date);
_hour = (daytime / 24) * 360;
_sunangle = ((12 * cos(_day) - 78) * cos(_lat) * cos(_hour)) - (24 * sin(_lat) * cos(_day));  
		
If (_sunangle < 0) then {_Night = true;};
If (_sunangle > 0) then {_Night = False;};
			
_Night;
