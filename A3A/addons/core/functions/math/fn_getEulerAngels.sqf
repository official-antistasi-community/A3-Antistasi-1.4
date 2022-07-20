// eulerAngles

params ["_object"];

private _dir = vectorDir _object;
_dir params ["_xDir", "_yDir", "_zDir"];

private _up = vectorUp _object;
_up params ["_xUp", "_yUp", "_zUp"];

private _side = _dir vectorCrossProduct _up;
_side params ["_xSide", "_ySide", "_zSide"];

private _xRot = _yUp atan2 _zUp;
private _yRot = -_xUp atan2 sqrt (1 - (_xUp ^ 2));
private _zRot = _xDir atan2 _xSide;

[_xRot, _yRot, _zRot]