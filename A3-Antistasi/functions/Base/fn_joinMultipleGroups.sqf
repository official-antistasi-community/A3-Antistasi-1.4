/**
	Joins several groups into a single new group.
	
	Params:
		_groups: Groups to join
		_groupName: Name of new group
		
	Returns:
		The new group
**/

private _groups = param [0];
private _groupName = param [1, groupId (_groups select 0)];

if (_groups IsEqualTo []) exitWith {
	grpNull;
};

private _joinedGroup = createGroup [side (_groups select 0), true];

{
	units _x join _joinedGroup;

} forEach _groups;

_joinedGroup setGroupId [_groupName];

_joinedGroup;