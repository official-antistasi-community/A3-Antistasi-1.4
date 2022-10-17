/****************************************************************
File: UPSMON_TRACK.sqf
Author: Azroul13

Description:

Parameter(s):

Returns:

****************************************************************/
private ["_grpid","_leader","_pos","_rankshort","_lastname","_wppos","_markercolor","_grptype","_drawicon","_text","_trackername","_destname"];


While {true} do
{
	{
		If (!IsNull _x) then
		{
			If (alive (leader _x)) then
			{
				_grpid = _x getvariable ["UPSMON_grpid",0];
				_leader = leader _x;
				_pos = getposATL _leader;
				_rankshort = [rank _leader,"displayNameShort"] call BIS_fnc_rankparams;  
				_lastname = name _leader;
				_units = (units _x) - [_leader];
				
				_wppos = waypointPosition [_x,count(waypoints _x)-1];
				
				_markercolor = switch (side _leader) do {
					case west: {"ColorBlue"};
					case east: {"ColorRed"};
					case resistance: {"ColorGreen"};
					default {"ColorBlack"};
				};
				
				_grptype = [_leader] call UPSMON_grptype;
				_drawicon = "b_inf";
				If (_grptype == "Iscar") then {_drawicon = "b_motor_inf"};
				If (_grptype == "IsAir") then {_drawicon = "b_plane";};
				If (_grptype == "Isboat") then {_drawicon = "b_naval";};   

				_text = format ["%1. %2 - Grpcount: %3 - Mission: %4 Status: %5 - Target: %6",_rankshort, _lastname,count units _x,_x getvariable ["UPSMON_Grpmission","PATROL"],_x getvariable ["UPSMON_Grpstatus","GREEN"],_x getvariable ["UPSMON_GrpTarget",ObjNull]];
				
				_trackername = format["trk_%1",_grpid];
				
				if (getMarkerColor _trackername == "") then 
				{
					_markerlead = createMarker [_trackername,[0,0]];
				};
				_trackername setMarkerShape "ICON";
				_trackername setMarkerType _drawicon;
				_trackername setmarkerpos _pos;
				_trackername setmarkercolor _markercolor;
				_trackername setMarkerText _text;
				
				If (count(waypoints _x) != 0) then 
				{
					_destname = format["dest_%1",_grpid];
					_wptext = format ["%1. %2",_rankshort, _lastname];
					if (getMarkerColor _destname == "") then 
					{
						_markerobj = createMarker[_destname,[0,0]];
					};	
					_destname setMarkerShape "ICON";
					_destname setMarkerType "mil_objective";
					_destname setmarkerpos _wppos;
					_destname setmarkercolor _markercolor;
					_destname setMarkerText _wptext;
				};
				
				If (count _units > 0) then
				{
					_i = 0;
					{
						_i = _i + 1;
						_trackerunit = format["trk_%1_%2",_grpid,_i];
						_unit = _x;
						If (alive _unit) then
						{
							_pos2 = getposATL _unit;
							if (getMarkerColor _trackerunit == "") then 
							{
								_markerunit = createMarker [_trackerunit,[0,0]];
							};
							_trackerunit setMarkerShape "ICON";
							_trackerunit setMarkerType "mil_triangle";
							_trackerunit setmarkerpos _pos2;
							_trackerunit setmarkercolor _markercolor;
							_trackerunit setmarkerdir (getdir _unit);
						}
						else
						{
							if (getMarkerColor _trackerunit == "") then 
							{
								Deletemarker _trackerunit;
							};
						};
					} foreach _units;
				};
			};
		};
	} foreach UPSMON_Trackednpcs;
	
	sleep 0.5;
};