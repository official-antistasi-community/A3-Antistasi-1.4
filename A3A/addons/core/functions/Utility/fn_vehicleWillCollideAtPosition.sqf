/**
   Vehicle collision check
   
   Checks if a vehicle will collide with anything if moved to the target location;
   
   Internally, we get the corners of the vehicle's bounding box, and fire off some collision detection lines between them to see if they hit anything.
   
   Params:
	_vehicle - Vehicle to test
	_position - Position to move to, in AGL format
**/


params ["_vehicle", "_targetPos"];

private _vehiclePosAGL = getPos _vehicle;
private _boundingBox = boundingBoxReal _vehicle; 
private _corners = [ 
	//Bottom - rear - left 
	[_boundingBox select 0 select 0, _boundingBox select 0 select 1, _boundingBox select 0 select 2], 
	//Bottom - front - left 
	[_boundingBox select 0 select 0, _boundingBox select 1 select 1, _boundingBox select 0 select 2], 
	//Bottom - rear - right 
	[_boundingBox select 1 select 0, _boundingBox select 0 select 1, _boundingBox select 0 select 2], 
	//Bottom - front - right 
	[_boundingBox select 1 select 0, _boundingBox select 1 select 1, _boundingBox select 0 select 2], 
	//Top - rear - left 
	[_boundingBox select 0 select 0, _boundingBox select 0 select 1, _boundingBox select 1 select 2], 
	//Top - front - left 
	[_boundingBox select 0 select 0, _boundingBox select 1 select 1, _boundingBox select 1 select 2], 
	//Top - rear - right 
	[_boundingBox select 1 select 0, _boundingBox select 0 select 1, _boundingBox select 1 select 2], 
	//Top - front - right 
	[_boundingBox select 1 select 0, _boundingBox select 1 select 1, _boundingBox select 1 select 2] 
]; 
 
private _lines = [ 
	//Bottom - rear - left to Bottom - rear - right 
	[_corners select 0, _corners select 2], 
	//Bottom - front - left to Bottom - front - right 
	[_corners select 1, _corners select 3], 
	//Bottom - rear - left to Bottom - front - left 
	[_corners select 0, _corners select 1], 
	//Bottom - rear - right to Bottom - front - right 
	[_corners select 2, _corners select 3], 
	//Top - rear - left to Bottom - rear - right 
	[_corners select 4, _corners select 6], 
	//Top - front - left to Bottom - front - right 
	[_corners select 5, _corners select 7], 
	//Top - rear - left to Bottom - front - left 
	[_corners select 4, _corners select 5], 
	//Top - rear - right to Bottom - front - right 
	[_corners select 6, _corners select 7],
	//Diagonal - Bottom - rear - left to Top - front - right
	[_corners select 0, _corners select 7]
]; 
 
private _collision = false; 
private _heightOffset = (_boundingBox select 1 select 2) - (_boundingBox select 0 select 2) / 2; 

{ 
	//private _startPos = _targetPos vectorAdd (_x # 0) vectorAdd [0, 0, _height]; 
	private _startPosModelSpace = _x select 0;
	private _endPosModelSpace = _x select 1;
	private _startPosVehicleCurrentLocation = _vehicle modelToWorld (_startPosModelSpace);
	private _endPosVehicleCurrentLocation = _vehicle modelToWorld (_endPosModelSpace);

	private _positionDifference = [
		(_targetPos select 0) - (_vehiclePosAGL select 0),
		(_targetPos select 1) - (_vehiclePosAGL select 1),
		(_targetPos select 2) - (_vehiclePosAGL select 2)
	];

	private _startPos = [
		(_startPosVehicleCurrentLocation select 0) + (_positionDifference select 0),
		(_startPosVehicleCurrentLocation select 1) + (_positionDifference select 1),
		0.1 + (_startPosModelSpace select 2) + _heightOffset
	];

	private _endPos = [
		(_endPosVehicleCurrentLocation select 0) + (_positionDifference select 0),
		(_endPosVehicleCurrentLocation select 1) + (_positionDifference select 1),
		0.1 + (_startPosModelSpace select 2) + _heightOffset
	];

	private _result = lineIntersectsSurfaces [AGLtoASL _startPos, AGLtoASL _endPos, objNull, objNull, false, 1, "FIRE", "FIRE"]; 
	if (count _result > 0) exitWith { 
		_collision = true;
	}; 
} forEach _lines; 
 
_collision; 