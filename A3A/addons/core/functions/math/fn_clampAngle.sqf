// clamp angle

params ["_angle", "_fromAngle", "_toAngle"];

if (_angle < 0) then {
	_angle = 360 + _angle;
};

if(_angle > 180) then {
	_angle max (360 + _fromAngle);	
};

_angle min _toAngle