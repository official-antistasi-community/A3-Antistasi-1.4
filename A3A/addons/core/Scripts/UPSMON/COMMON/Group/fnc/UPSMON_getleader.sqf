/****************************************************************
File: UPSMON_getleader.sqf
Author: Monsada

Description:
	Check if leader is alive and if not search for a replacement in the group
Parameter(s):
	<--- leader
	<--- group
Returns:
	leader
****************************************************************/

private ["_npc","_grp","_members","_list"];
	
_npc = _this select 0;
_grp = _this select 1;
_members = units _grp;
	
//sleep 0.05;
if (!alive _npc) then 
{
		
	//soldier not in vehicle takes the lead or not in tank vehicle
	_list = [];
	{
		if (alive _x) then
		{	
			If (!isPlayer _x) then
			{
				if (canmove _x) then
				{
					_points = 0;
					If (_x == vehicle _x) then
					{
						switch (rank _x) do
						{
							case "CORPORAL":
							{
								_points = _points + 20;
							};
							case "SERGEANT":
							{
								_points = _points + 30;
							};
							case "LIEUTENANT":
							{
								_points = _points + 40;
							};
							case "MAJOR":
							{
								_points = _points + 50;
							};
							case "COLONEL":
							{
								_points = _points + 60;
							};
							case "PRIVATE":
							{
								_points = _points + 10;
							};
						};		
					}
					else
					{
						If (vehicle _x iskindof "TANK" || vehicle _x iskindof "Wheeled_APC") then
						{
							If ((assignedVehicleRole _x) select 0 == "Commander") then
							{
								_points = _points + 80;
							};
							
							If ((assignedVehicleRole _x) select 0 == "Gunner") then
							{
								_points = _points + 40;
							};
						};
					};
					
					_list pushback [_x,_points];
				};
			};
		};
	} foreach _members;					
		
	If (count _list > 0) then
	{
		_list = [_list, [], {(_x select 1)}, "DESCEND"] call BIS_fnc_sortBy;
		_npc = (_list select 0) select 0;
	};
	//if no soldier out of vehicle takes any
	if (!alive _npc ) then 
	{
		{
			if (alive _x && canmove _x) exitwith {_npc = _x;};
		} foreach _members;	
	};

	//If not alive or already leader or is player exits
	{
		{
			if (alive _x && !isPlayer _x) exitwith {_npc = [_npc,_grp] call UPSMON_getleader;};
		} foreach _members;				
	};	
		
	if (leader _grp == _npc) exitwith {_npc};			
		
	//Set new _npc as leader		
	_grp selectLeader _npc;					
};

_npc // return