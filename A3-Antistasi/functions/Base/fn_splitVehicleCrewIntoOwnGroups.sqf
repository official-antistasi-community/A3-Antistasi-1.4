/**
	Splits a vehicle crew into separate groups.
	
	Params:
		_vehicle: A vehicle to split the crew of
		
	Returns:
		A fragmented vehicle description
**/

params ["_vehicle"];

private _crew = fullCrew _vehicle select {_x select 1 != "cargo"}; 
private _crewGroups = []; 
 
private _groupName = groupId group (_crew select 0 select 0); 
 
{ 
	private _unit = _x select 0; 
	private _group = createGroup [side _unit, true]; 

	[_unit] join _group; 
	_group setGroupId [_groupName + "#" + str _forEachIndex]; 
 
	_crewGroups pushBack _group; 
} forEach _crew;

[_crewGroups, _groupName];