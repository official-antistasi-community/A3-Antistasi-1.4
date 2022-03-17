
/*
	Author: Genesis

	Description:
		Function for telling a group to temporarily garrison a structure. The group will leave it shortly after.

	Parameter(s):
		0: GROUP

	Returns:
		NOTHING
*/

private _leader = (leader _this);
private _nBuildingLst = nearestObjects [_leader, ["House", "Building"], 50];
private _buildingPositions = [];

{
	if (count ([_x] call BIS_fnc_buildingPositions) > 3) then {_buildingPositions pushback _x;};
} foreach _nBuildingLst;

//Exit if no compatible buildings found
if (_buildingPositions isEqualTo []) exitWith {};

private _tempA = [(selectRandom _buildingPositions)] call BIS_fnc_buildingPositions;
private _groupUnits = units _this;
if (count _tempA > 0) then
{
	{
		private _foot = isNull objectParent _x;
		if (_foot) then
		{
			private _buildingLocation = selectRandom _tempA;
			if !(isNil "_buildingLocation") then
			{
				_x doMove _buildingLocation;
				[_x,_buildingLocation] spawn 
				{
					params ["_leader","_buildingLocation"];
					if (isNil "_buildingLocation") exitWith {};
					while {(alive _leader) && {_leader distance2D _buildingLocation < 1.3}} do
					{
						sleep 3;
						_leader doMove _buildingLocation;
					};
				};
				private _rmv = _tempA findIf {_buildingLocation isEqualTo _x};
				_tempA deleteAt _rmv;
			};
		};
	} foreach _groupUnits;
};