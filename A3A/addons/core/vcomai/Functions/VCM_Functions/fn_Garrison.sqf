
/*
	Author: Genesis, tweaked by Freddo

	Description:
		Function for getting AI to garrison buildings and then move around inside them.

	Parameter(s):
		0: GROUP

	Returns:
		NOTHING
*/

//Lets find the closest building

private _unit = (leader _this);
private _nBuildingLst = nearestObjects [waypointPosition [_this, 1], ["House", "Building"], 50];
private _nBuilding = [0,0,0];
private _buildingPositions = [];
{
	_buildingPositions = [_x] call BIS_fnc_buildingPositions;
	if ((count _buildingPositions) > 2) exitWith {_nBuilding = _x;};
} forEach _nBuildingLst;


//waitUntil unit is within 50m of building closest to waypoint
waitUntil {isNull _unit || {!(alive _unit)} || {_nBuilding distance2D _unit < 50}};

//If the array is not more than 0 - then exit.


//Find the units in the group!
private _groupUnits = units _this;
_this setVariable ["VCOM_GARRISONED",true];	
private _waypointIs = "HOLD";
while {_waypointIs isEqualTo "HOLD" && ({ alive _x } count units _this > 0)} do
{
	private _index = currentWaypoint _this;
	private _waypointIs = waypointType [_this,_index];		
	private _tempA = _buildingPositions;
	if (count _tempA > 0) then
	{
		{
			private _foot = isNull objectParent _x;
			if (_foot) then
			{	
				private _buildingLocation = selectRandom _tempA;
				if !(isNil "_buildingLocation") then
				{
					_x enableAI "PATH";
					_x doMove _buildingLocation;
					_x setUnitPos "UP";
					[_x,_buildingLocation] spawn 
					{
						params ["_unit","_buildingLocation"];
						if (isNil "_buildingLocation") exitWith {};
						waitUntil {!alive _unit || {_unit distance _buildingLocation < 1.3}};
						_unit disableAI "PATH";
					};
					private _RMV = _tempA findIf {_buildingLocation isEqualTo _x};
					_tempA deleteAt _RMV;
				};
			};
		} forEach _groupUnits;		
		
		
	};
	sleep (30 + (random 60));
};

//Allow the AI to move again.
{
	_x enableAI "PATH";
} foreach _groupUnits;