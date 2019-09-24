params ["_linkSegment", "_lastSegment", "_navPointName", "_isOpen"];
private ["_nameLink", "_marker"];

if(isNull _linkSegment) exitWith {};

linkSegments pushBack _linkSegment;
_nameLink = [_linkSegment] call getRoadName;
//Sets origin of this segment
missionNamespace setVariable [format ["%1_c", _nameLink], _navPointName];

if(_isOpen) then
{
  //Creates and save the marker
  _marker = ["mil_dot", getPos _linkSegment, "ColorRed"] call createNavMarker;
  missionNamespace setVariable [format ["%1_m", _nameLink], _marker];

  //Sets the exit as blocked and new start point
  openSearchSegments pushBack [_linkSegment, _lastSegment, _navPointName];
};
