params ["_currentSegment", "_connectedNavPoint", ["_navPointPos", objNull]];
private ["_navPointName", "_roadType"];

ignoredSegments pushBack _currentSegment;
_navPointName = [_currentSegment] call getRoadName;
_roadType = 2;//[_currentSegment] call getRoadType;
if(!(_navPointPos isEqualType [])) then {_navPointPos = getPos _currentSegment;};
[_navPointName, _navPointPos, [], _roadType] call setNavPoint;
navPointNames pushBack _navPointName;

//Sets the link between the start and this navpoint
if(_connectedNavPoint isEqualType "") then
{
  [_connectedNavPoint, _navPointName] call setNavConnection;
};

_navPointName;
